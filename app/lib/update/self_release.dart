// This fork's own releases (github.com/rukazax/narwhal).
//
// The row in About says what the latest release is and opens its page in the
// browser; when it is newer than the running build, the row can also install it
// from inside the app (lib/update/apk_installer.dart, ui/update/self_release_sheet.dart).
// That install is always the person's: a tap on 「Обновить」 and a confirmation.
// Nothing below downloads anything — this file only reports, and the weekly
// check below never starts a download.
//
// When the check runs: at most once a week, and on a moment of its own. A
// launch that finds the last answer older than [SelfReleaseChecker.interval]
// arranges a check for a random minute of the next half hour
// ([SelfReleaseChecker.planAutoCheck]) and keeps that moment in
// SharedPreferences, so an app killed before it runs the check after the next
// launch instead of drawing a new moment every time. The check only runs while
// the app is in front (lib/ui/update/self_release_host.dart): there is no
// background worker. A tap on the row (「Проверить」) always checks at once and
// ignores the saved moment.

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'release.dart' show normalizeSha256;
import 'update_config.dart';
import 'update_http.dart';
import 'version.dart';

/// A file attached to a release: the APKs it carries, with what GitHub says
/// about them. The row only tells what is out; downloading one is a separate,
/// person-initiated step (lib/update/apk_installer.dart).
class SelfReleaseAsset {
  const SelfReleaseAsset({required this.name, this.size, this.sha256, this.url});

  final String name;

  /// Bytes; null when the release didn't say.
  final int? size;

  /// Lowercase hex; null when the asset carries no digest.
  final String? sha256;

  /// Where GitHub serves it (`browser_download_url`). Null when the answer
  /// didn't carry one (or an old cache entry): the release's tag and the name
  /// still make a URL (selfReleaseAssetUrl).
  final Uri? url;

  Map<String, Object?> toJson() => {'name': name, 'size': ?size, 'sha256': ?sha256, 'url': ?url?.toString()};

  /// An `assets` entry; null for anything that isn't an APK with a usable name.
  static SelfReleaseAsset? tryParse(Object? json) {
    if (json is! Map) return null;
    final name = json['name'];
    if (name is! String || !name.toLowerCase().endsWith('.apk')) return null;
    return SelfReleaseAsset(
      name: name,
      size: (json['size'] as num?)?.toInt(),
      // `digest` is GitHub's field, `sha256` what toJson writes for the cache.
      sha256: normalizeSha256(json['digest'] ?? json['sha256']),
      // `browser_download_url` is GitHub's field, `url` what toJson writes.
      url: _httpUrl(json['browser_download_url'] ?? json['url']),
    );
  }
}

/// A version of this fork, as the checker compares it.
///
/// Semver ([AppVersion]) with the fork's channel suffix `-narwhal` /
/// `-narwhal.<n>` taken out of the pre-release part: the suffix marks the build
/// as this fork's, it is not a pre-release, so `1.0.0-narwhal` is the *same*
/// release as `1.0.0` rather than something older. The number in
/// `-narwhal.<n>` only decides between two builds of one version. A leading
/// `v` (the git tag) is accepted, and a missing patch reads as `.0`.
class SelfReleaseVersion implements Comparable<SelfReleaseVersion> {
  const SelfReleaseVersion(this.base, {this.channel = 0});

  final AppVersion base;

  /// `1.0.0-narwhal.2` → 2; a bare `-narwhal`, or no suffix at all → 0.
  final int channel;

  static final _channel = RegExp(r'^narwhal$', caseSensitive: false);

  /// Null when [raw] isn't a version.
  static SelfReleaseVersion? tryParse(String? raw) {
    final version = AppVersion.tryParse(raw);
    if (version == null) return null;
    final pre = [...version.preRelease];
    var channel = 0;
    if (pre.length >= 2 && _channel.hasMatch(pre[pre.length - 2]) && int.tryParse(pre.last) != null) {
      channel = int.parse(pre.removeLast());
      pre.removeLast();
    } else if (pre.isNotEmpty && _channel.hasMatch(pre.last)) {
      pre.removeLast();
    }
    return SelfReleaseVersion(
      AppVersion(version.major, version.minor, version.patch, preRelease: pre, build: version.build),
      channel: channel,
    );
  }

  /// `1.0.0` (the build number stays out, as in [AppVersion.name]).
  String get name => base.name;

  @override
  int compareTo(SelfReleaseVersion other) {
    final byBase = base.compareTo(other.base);
    return byBase != 0 ? byBase : channel.compareTo(other.channel);
  }

  bool isNewerThan(SelfReleaseVersion other) => compareTo(other) > 0;

  @override
  bool operator ==(Object other) => other is SelfReleaseVersion && compareTo(other) == 0;

  @override
  int get hashCode => Object.hash(name, channel);

  @override
  String toString() => channel == 0 ? name : '$name-narwhal.$channel';
}

/// A release of this fork: its version, where to read about it and the APKs it
/// carries.
class SelfRelease {
  const SelfRelease({
    required this.version,
    required this.tag,
    this.pageUrl,
    this.publishedAt,
    this.assets = const [],
  });

  final SelfReleaseVersion version;

  /// The git tag as GitHub writes it (`v1.0.0-narwhal`).
  final String tag;

  /// The API's `html_url`; null when the answer didn't carry one.
  final Uri? pageUrl;
  final DateTime? publishedAt;
  final List<SelfReleaseAsset> assets;

  /// Where to send the person: the release's page, or the releases page.
  Uri get page => pageUrl ?? selfReleasesPage;

  /// The tag as the row shows it (`1.0.0-narwhal`).
  String get label => tag.isNotEmpty && (tag[0] == 'v' || tag[0] == 'V') ? tag.substring(1) : tag;

  /// The package this build can install: the release's first APK, or null when
  /// it carries none (a release of notes only).
  SelfReleaseAsset? get apk => assets.firstOrNull;

  /// Which asset names belong to which ABI. [abi] is the running APK's
  /// `nativeLibraryDir` name: `arm64`, `arm`, `x86_64` or `x86`.
  static const abiTokens = <String, List<String>>{
    'arm64': ['arm64-v8a', 'arm64', 'aarch64'],
    'arm': ['armeabi-v7a', 'armv7', 'armeabi'],
    'x86_64': ['x86_64', 'x64'],
    'x86': ['x86'],
  };

  /// The package for [abi]: an asset whose name names that ABI, else a universal
  /// one (no ABI token in its name), else the first APK. A one-APK release is
  /// returned as is, so publishing several per-ABI builds changes nothing for
  /// the single-APK case.
  SelfReleaseAsset? apkFor(String? abi) {
    if (assets.isEmpty) return null;
    if (assets.length == 1) return assets.first;
    final tokens = abiTokens[abi] ?? const <String>[];
    for (final asset in assets) {
      final name = asset.name.toLowerCase();
      if (tokens.any(name.contains)) return asset;
    }
    final all = abiTokens.values.expand((tokens) => tokens);
    for (final asset in assets) {
      final name = asset.name.toLowerCase();
      if (!all.any(name.contains)) return asset;
    }
    return assets.first;
  }

  /// Where [asset] is downloaded from: its own URL, or the canonical one built
  /// from [tag] and its name when the answer didn't carry one.
  Uri assetUrl(SelfReleaseAsset asset) => asset.url ?? selfReleaseAssetUrl(tag, asset.name);

  /// Whether this release is newer than the running [installed] build.
  bool isNewerThan(SelfReleaseVersion installed) => version.isNewerThan(installed);
}

/// Parses a GitHub `releases/latest` body of this fork. Throws
/// [FormatException] when it isn't a usable release (draft, unparsable tag).
SelfRelease parseSelfRelease(Object? json) {
  if (json is! Map) throw const FormatException('release is not an object');
  if (json['draft'] == true) throw const FormatException('draft release');
  final tag = json['tag_name'];
  if (tag is! String) throw FormatException('unrecognised tag: $tag');
  final version = SelfReleaseVersion.tryParse(tag);
  if (version == null) throw FormatException('unrecognised tag: $tag');
  return SelfRelease(
    version: version,
    tag: tag,
    pageUrl: _httpUrl(json['html_url']),
    publishedAt: DateTime.tryParse(json['published_at'] as String? ?? '')?.toUtc(),
    assets: [
      for (final asset in (json['assets'] as List?)?.whereType<Map>() ?? const <Map>[])
        ?SelfReleaseAsset.tryParse(asset),
    ],
  );
}

/// An absolute `http(s)` URL, or null: an empty or relative one is no page and
/// no download.
Uri? _httpUrl(Object? raw) {
  final url = raw is String ? Uri.tryParse(raw.trim()) : null;
  return url != null && url.hasScheme && url.host.isNotEmpty ? url : null;
}

/// Why the check couldn't answer. All read "couldn't check" to the person.
enum SelfReleaseFailure {
  /// No connection, DNS, timeout, TLS.
  network,

  /// GitHub API rate limit (403/429).
  rateLimited,

  /// 404: the release isn't there (or the repository is private).
  noRelease,

  /// Answered, but not with a usable release.
  badResponse,
}

/// What a check found: a [release], or a [failure].
class SelfReleaseCheck {
  const SelfReleaseCheck({this.release, this.failure, this.cached = false});

  final SelfRelease? release;
  final SelfReleaseFailure? failure;

  /// True when the answer came from the week-old cache, not the network.
  final bool cached;

  bool get failed => release == null;
}

/// Asks GitHub for this fork's latest release, and decides when it may.
class SelfReleaseChecker {
  SelfReleaseChecker({required this.http, DateTime Function()? now, Random? random})
    : now = now ?? DateTime.now,
      random = random ?? Random();

  final UpdateHttp http;

  /// The clock, so tests can age the cache and move the weekly window.
  final DateTime Function() now;

  /// The dice behind the window; a seeded one makes tests deterministic.
  final Random random;

  /// How long an answer is good for: the automatic check asks at most this
  /// often.
  static const interval = Duration(days: 7);

  /// The longest wait after a launch: the check lands anywhere inside this
  /// window, so the whole installed base doesn't ask GitHub at once.
  static const maxDelay = Duration(minutes: 30);

  /// Preferences keys. The answer and when it was taken:
  static const checkedAtKey = 'self_release_checked_at';
  static const tagKey = 'self_release_tag';
  static const pageKey = 'self_release_page';
  static const publishedAtKey = 'self_release_published_at';
  static const assetsKey = 'self_release_assets';

  /// The moment the planned automatic check may run (ms); absent when none is
  /// planned or the last one was used.
  static const nextCheckAtKey = 'self_release_next_check_at';

  static const _timeout = Duration(seconds: 12);

  /// A timer that fires a moment early counts as arrived.
  static const _earlyTolerance = Duration(minutes: 1);

  /// The last answer, when it is younger than [interval]; null otherwise (and
  /// when there is none). Never asks GitHub.
  Future<SelfRelease?> readCache() async {
    final prefs = await SharedPreferences.getInstance();
    return _freshCache(prefs, now());
  }

  /// The latest release: the cache while it is younger than [interval], the
  /// network otherwise. [force] skips the cache (a tap on the row); failures
  /// are never cached, so a later call asks again.
  Future<SelfReleaseCheck> check({bool force = false}) async {
    final prefs = await SharedPreferences.getInstance();
    if (!force) {
      final cached = _freshCache(prefs, now());
      if (cached != null) return SelfReleaseCheck(release: cached, cached: true);
    }
    final result = await _fetch();
    if (result.release case final release?) _store(prefs, release);
    return result;
  }

  /// True when the automatic check is owed: never answered, or the answer is
  /// older than [interval]. A clock that went backwards counts as due.
  Future<bool> autoCheckDue() async {
    final prefs = await SharedPreferences.getInstance();
    return _due(prefs, now());
  }

  /// How long to wait before the automatic check, or null when none is owed.
  ///
  /// The moment is drawn once and kept in [nextCheckAtKey]: every later call
  /// returns what is left of it, so an app killed and started again waits for
  /// the same moment instead of drawing a new one. A moment already passed is
  /// due now ([Duration.zero]).
  Future<Duration?> planAutoCheck() async {
    final prefs = await SharedPreferences.getInstance();
    final at = now();
    if (!_due(prefs, at)) {
      // Answered within the week by a tap: no automatic check is owed.
      unawaited(prefs.remove(nextCheckAtKey));
      return null;
    }
    final nowMs = at.millisecondsSinceEpoch;
    if (prefs.getInt(nextCheckAtKey) case final planned?) {
      final left = planned - nowMs;
      if (left <= 0) return Duration.zero;
      if (left <= maxDelay.inMilliseconds) return Duration(milliseconds: left);
      // Further off than any window this app draws: the clock moved backwards
      // since. Draw a new one below.
    }
    final wait = Duration(seconds: random.nextInt(maxDelay.inSeconds + 1));
    unawaited(prefs.setInt(nextCheckAtKey, nowMs + wait.inMilliseconds));
    return wait;
  }

  /// Runs the planned check when its moment has arrived, and answers what it
  /// found; null when no check was planned or the moment is still ahead.
  ///
  /// The moment is used up either way: a failed answer leaves the week
  /// unspent, and the next launch plans a new window instead of retrying in a
  /// loop.
  Future<SelfReleaseCheck?> runAutoCheck() async {
    final prefs = await SharedPreferences.getInstance();
    final at = now();
    final planned = prefs.getInt(nextCheckAtKey);
    if (planned == null) return null;
    if (at.millisecondsSinceEpoch + _earlyTolerance.inMilliseconds < planned) return null;
    unawaited(prefs.remove(nextCheckAtKey));
    if (!_due(prefs, at)) return null;
    return check();
  }

  bool _due(SharedPreferences prefs, DateTime at) {
    final checkedAt = prefs.getInt(checkedAtKey);
    if (checkedAt == null) return true;
    final age = at.millisecondsSinceEpoch - checkedAt;
    return age < 0 || age >= interval.inMilliseconds;
  }

  SelfRelease? _freshCache(SharedPreferences prefs, DateTime at) {
    final checkedAt = prefs.getInt(checkedAtKey);
    if (checkedAt == null) return null;
    final age = at.millisecondsSinceEpoch - checkedAt;
    if (age < 0 || age >= interval.inMilliseconds) return null;
    return _stored(prefs);
  }

  /// The stored answer, whatever its age.
  SelfRelease? _stored(SharedPreferences prefs) {
    final tag = prefs.getString(tagKey);
    final version = tag == null ? null : SelfReleaseVersion.tryParse(tag);
    if (tag == null || version == null) return null;
    final publishedAt = prefs.getInt(publishedAtKey);
    return SelfRelease(
      version: version,
      tag: tag,
      pageUrl: _httpUrl(prefs.getString(pageKey)),
      publishedAt: publishedAt == null ? null : DateTime.fromMillisecondsSinceEpoch(publishedAt, isUtc: true),
      assets: _decodeAssets(prefs.getString(assetsKey)),
    );
  }

  /// Writes the answer down without waiting for the disk, as the app's own
  /// updater does: SharedPreferences updates its in-memory copy at once, so a
  /// reader straight after sees the new values, and nothing on screen waits on
  /// storage.
  void _store(SharedPreferences prefs, SelfRelease release) {
    unawaited(prefs.setInt(checkedAtKey, now().millisecondsSinceEpoch));
    unawaited(prefs.setString(tagKey, release.tag));
    if (release.pageUrl case final page?) {
      unawaited(prefs.setString(pageKey, page.toString()));
    } else {
      unawaited(prefs.remove(pageKey));
    }
    if (release.publishedAt case final published?) {
      unawaited(prefs.setInt(publishedAtKey, published.millisecondsSinceEpoch));
    } else {
      unawaited(prefs.remove(publishedAtKey));
    }
    unawaited(prefs.setString(assetsKey, jsonEncode([for (final asset in release.assets) asset.toJson()])));
    // The week's answer is in: whatever was planned is moot.
    unawaited(prefs.remove(nextCheckAtKey));
  }

  static List<SelfReleaseAsset> _decodeAssets(String? raw) {
    if (raw == null || raw.isEmpty) return const [];
    try {
      final list = jsonDecode(raw);
      if (list is! List) return const [];
      return [for (final entry in list) ?SelfReleaseAsset.tryParse(entry)];
    } on Object {
      // Not what we wrote (a hand-edited preference): as good as none.
      return const [];
    }
  }

  Future<SelfReleaseCheck> _fetch() async {
    final UpdateHttpResponse response;
    try {
      response = await http.get(selfLatestApi, headers: _headers, timeout: _timeout);
    } on Object {
      // SocketException, TimeoutException, HandshakeException, HttpException…
      return const SelfReleaseCheck(failure: SelfReleaseFailure.network);
    }
    if (response.status != 200) {
      await response.discard();
      return SelfReleaseCheck(
        failure: switch (response.status) {
          403 || 429 => SelfReleaseFailure.rateLimited,
          404 => SelfReleaseFailure.noRelease,
          >= 500 => SelfReleaseFailure.network,
          _ => SelfReleaseFailure.badResponse,
        },
      );
    }
    final String body;
    try {
      body = await response.text(timeout: _timeout);
    } on Object {
      return const SelfReleaseCheck(failure: SelfReleaseFailure.network);
    }
    try {
      return SelfReleaseCheck(release: parseSelfRelease(jsonDecode(body)));
    } on Object {
      // FormatException, or a TypeError from a field of the wrong type.
      return const SelfReleaseCheck(failure: SelfReleaseFailure.badResponse);
    }
  }

  static const _headers = {'accept': 'application/vnd.github+json', 'x-github-api-version': '2022-11-28'};
}

/// HTTP the fork's release check goes through; tests override it.
final selfReleaseHttpProvider = Provider<UpdateHttp>((ref) => IoUpdateHttp());

/// The wall clock and the dice behind the weekly window; tests pin both.
final selfReleaseClockProvider = Provider<DateTime Function()>((ref) => DateTime.now);
final selfReleaseRandomProvider = Provider<Random>((ref) => Random());

final selfReleaseCheckerProvider = Provider<SelfReleaseChecker>(
  (ref) => SelfReleaseChecker(
    http: ref.watch(selfReleaseHttpProvider),
    now: ref.watch(selfReleaseClockProvider),
    random: ref.watch(selfReleaseRandomProvider),
  ),
);

/// Whether About reports this fork's releases, and the original's in a section
/// of their own: a fork build (`DSH_SELF_UPDATE=false`, what
/// `tooling/build-apk.sh` passes). The original build uses its in-app updater
/// instead (lib/ui/update/update_tiles.dart).
final selfReleaseRowProvider = Provider<bool>((ref) => !selfUpdateEnabled);
