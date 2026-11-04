// The *original* dsh-go, whose releases this build only reports.
//
// A fork is signed with its own key, so Android refuses to install the
// upstream APK over it ("signatures do not match"). The row in About therefore
// never downloads or installs anything: it asks the GitHub API what the
// original's latest release is and opens its release page.
//
// One check per day unless forced by a tap; the answer is cached next to the
// timestamp in SharedPreferences.

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'release.dart';
import 'update_config.dart';
import 'update_http.dart';
import 'version.dart';

/// A release of the original app: its version and where to read about it.
class UpstreamRelease {
  const UpstreamRelease({required this.version, required this.tag, this.pageUrl});

  final AppVersion version;

  /// The git tag as GitHub writes it (`v1.1.0`).
  final String tag;

  /// The API's `html_url`; null when the answer didn't carry one.
  final Uri? pageUrl;

  /// Where to send the person: the release's page, or the releases page.
  Uri get page => pageUrl ?? upstreamReleasesPage;

  /// Whether the original moved ahead of the version this build is based on.
  bool get isNewer => version.isNewerThan(upstreamBase);
}

/// The original version this build was made from ([upstreamBaseVersion]).
final upstreamBase = AppVersion.tryParse(upstreamBaseVersion) ?? const AppVersion(0, 0, 0);

/// Why the check couldn't answer. All read "couldn't check" to the person.
enum UpstreamFailure {
  /// No connection, DNS, timeout, TLS.
  network,

  /// GitHub API rate limit (403/429 with the limit spent).
  rateLimited,

  /// 404: the release isn't there (or the repository is private).
  noRelease,

  /// Answered, but not with a usable release.
  badResponse,
}

/// What [UpstreamChecker.check] found: a [release], or a [failure].
class UpstreamCheck {
  const UpstreamCheck({this.release, this.failure, this.cached = false});

  final UpstreamRelease? release;
  final UpstreamFailure? failure;

  /// True when the answer came from the day-old cache, not the network.
  final bool cached;

  bool get failed => release == null;
}

/// Asks GitHub for the original's latest release, at most once a day.
class UpstreamChecker {
  UpstreamChecker({required this.http, this.now = DateTime.now});

  final UpdateHttp http;

  /// The clock, so tests can age the cache.
  final DateTime Function() now;

  static const checkInterval = Duration(hours: 24);
  static const _timeout = Duration(seconds: 12);

  static const _checkedAtKey = 'upstream_check_at';
  static const _tagKey = 'upstream_latest_tag';
  static const _pageKey = 'upstream_latest_page';

  /// [force] skips the cache (a tap on the row); failures are never cached.
  Future<UpstreamCheck> check({bool force = false}) async {
    final prefs = await SharedPreferences.getInstance();
    if (!force) {
      final cached = _readCache(prefs);
      if (cached != null) return UpstreamCheck(release: cached, cached: true);
    }
    final result = await _fetch();
    if (result.release case final release?) {
      await prefs.setInt(_checkedAtKey, now().millisecondsSinceEpoch);
      await prefs.setString(_tagKey, release.tag);
      if (release.pageUrl case final page?) {
        await prefs.setString(_pageKey, page.toString());
      } else {
        await prefs.remove(_pageKey);
      }
    }
    return result;
  }

  UpstreamRelease? _readCache(SharedPreferences prefs) {
    final at = prefs.getInt(_checkedAtKey);
    final tag = prefs.getString(_tagKey);
    if (at == null || tag == null) return null;
    final age = now().millisecondsSinceEpoch - at;
    if (age < 0 || age >= checkInterval.inMilliseconds) return null;
    final version = AppVersion.tryParse(tag);
    if (version == null) return null;
    return UpstreamRelease(version: version, tag: tag, pageUrl: Uri.tryParse(prefs.getString(_pageKey) ?? ''));
  }

  Future<UpstreamCheck> _fetch() async {
    final UpdateHttpResponse response;
    try {
      response = await http.get(
        upstreamLatestApi,
        headers: const {'accept': 'application/vnd.github+json', 'x-github-api-version': '2022-11-28'},
        timeout: _timeout,
      );
    } on Object {
      // SocketException, TimeoutException, HandshakeException, HttpException…
      return const UpstreamCheck(failure: UpstreamFailure.network);
    }
    if (response.status != 200) {
      await response.discard();
      return UpstreamCheck(
        failure: switch (response.status) {
          403 || 429 => UpstreamFailure.rateLimited,
          404 => UpstreamFailure.noRelease,
          >= 500 => UpstreamFailure.network,
          _ => UpstreamFailure.badResponse,
        },
      );
    }
    final String body;
    try {
      body = await response.text(timeout: _timeout);
    } on Object {
      return const UpstreamCheck(failure: UpstreamFailure.network);
    }
    try {
      // The same parser as the app's own updates: tag, version, html_url.
      final info = parseGithubRelease(jsonDecode(body));
      return UpstreamCheck(
        release: UpstreamRelease(version: info.version, tag: info.tag, pageUrl: info.pageUrl),
      );
    } on Object {
      // FormatException, or a TypeError from a field of the wrong type.
      return const UpstreamCheck(failure: UpstreamFailure.badResponse);
    }
  }
}

/// HTTP the upstream check goes through; tests override it.
final upstreamHttpProvider = Provider<UpdateHttp>((ref) => IoUpdateHttp());

final upstreamCheckerProvider = Provider<UpstreamChecker>(
  (ref) => UpstreamChecker(http: ref.watch(upstreamHttpProvider)),
);
