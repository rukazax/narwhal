// What a host QR code may contain, and how it is read (lib/remote/qr).
//
// The app has no desktop-side QR producer: a host code is made by the computer
// the person connects to, with any QR generator, from one of the forms below.
// JSON is the canonical one (it can carry a name and a password); a plain
// `ssh://…` link is the one a person can type by hand.
//
//   {"v":1,"kind":"narwhal-host","transport":"ssh","name":"Home PC",
//    "url":"ssh://me@192.168.1.20:2222","token":"…",
//    "launchCommand":"dsh web","workingDirectory":"~/code"}
//
//   ssh://me@192.168.1.20:2222?token=…&name=Home%20PC
//   me@192.168.1.20:2222
//
// `token` is the SSH password: it is stored in the phone's secret store, never
// shown in the UI and never logged ([HostQrPayload.toString]).

import 'dart:convert';

import '../ssh/ssh_host_config.dart';

/// Discriminator of this app's host payload. Anything else is another app's
/// QR code (a Wi-Fi network, a share code, a web link).
const hostQrKind = 'narwhal-host';

/// Payload version this build understands.
const hostQrVersion = 1;

/// Longest QR text accepted. A host payload is a few hundred bytes; anything
/// this large is not one, and parsing it is wasted work.
const hostQrMaxLength = 4096;

/// A host read from a QR code, ready to be saved as an [SshHostConfig].
class HostQrPayload {
  const HostQrPayload({
    required this.name,
    this.named = false,
    required this.host,
    required this.user,
    required this.port,
    this.password,
    this.launchCommand,
    this.workingDirectory,
  });

  /// What the person calls the machine; the host address when the code has no
  /// name of its own.
  final String name;

  /// True when [name] came from the code rather than falling back to the
  /// address (an existing host keeps its own name when a code has none).
  final bool named;
  final String host;
  final String user;
  final int port;

  /// The SSH password carried as `token`, null when the code has none.
  final String? password;

  /// Optional overrides for the remote `dsh web` command and its cwd.
  final String? launchCommand;
  final String? workingDirectory;

  bool get hasPassword => password != null && password!.isNotEmpty;

  /// `user@host` or `user@host:port`, as the host list shows it. An IPv6
  /// literal keeps its brackets so the port stays readable.
  String get address {
    final name = host.contains(':') ? '[$host]' : host;
    return port == 22 ? '$user@$name' : '$user@$name:$port';
  }

  /// The host this payload describes. Always password auth: a QR never carries
  /// a private key.
  SshHostConfig toConfig({String? id}) => SshHostConfig(
    id: id ?? SshHostConfig.newId(),
    name: name,
    host: host,
    port: port,
    user: user,
    launchCommand: launchCommand ?? defaultDshLaunchCommand,
    workingDirectory: workingDirectory,
  );

  /// Never prints [password]: this string ends up in debug output and test
  /// failure messages.
  @override
  String toString() => 'HostQrPayload($address, name: $name)';
}

/// One reason a scan was refused. The UI maps it to one localized sentence
/// (`hostQrErrorText`), so the parser stays free of Flutter.
enum HostQrError {
  /// Nothing was encoded (a blank code).
  empty,

  /// Longer than [hostQrMaxLength].
  tooLong,

  /// Not this app's payload: another app's JSON, a web link, random text.
  notHostQr,

  /// `v` is not [hostQrVersion] (a newer app made the code).
  unsupportedVersion,

  /// A host over the local network / WebRTC or a web address, which this app
  /// cannot connect to: it drives hosts over SSH.
  unsupportedTransport,

  /// No host address in the payload.
  missingAddress,

  /// An address that cannot be a host name.
  invalidAddress,

  /// No SSH user name.
  missingUser,

  /// A port outside 1–65535.
  invalidPort,
}

/// Result of [parseHostQr].
sealed class HostQrOutcome {
  const HostQrOutcome();
}

/// A host the QR code described.
final class HostQrHost extends HostQrOutcome {
  const HostQrHost(this.payload);

  final HostQrPayload payload;
}

/// A QR code this app will not connect to, with the reason.
final class HostQrInvalid extends HostQrOutcome {
  const HostQrInvalid(this.reason);

  final HostQrError reason;
}

/// Reads a scanned QR text: JSON first, then a link or a plain
/// `user@host[:port]`. Never throws.
HostQrOutcome parseHostQr(String raw) {
  final text = raw.trim();
  if (text.isEmpty) return const HostQrInvalid(HostQrError.empty);
  if (text.length > hostQrMaxLength) return const HostQrInvalid(HostQrError.tooLong);
  if (text.startsWith('{')) return _fromJson(text);
  return _fromLink(text);
}

HostQrOutcome _fromJson(String text) {
  final Object? decoded;
  try {
    decoded = jsonDecode(text);
  } catch (_) {
    return const HostQrInvalid(HostQrError.notHostQr);
  }
  if (decoded is! Map) return const HostQrInvalid(HostQrError.notHostQr);

  final kind = _string(decoded['kind']);
  if (kind == null || kind.toLowerCase() != hostQrKind) return const HostQrInvalid(HostQrError.notHostQr);

  // A newer code may mean something else by its fields; refuse it by version
  // rather than half-reading it. A missing `v` predates versioning: v1.
  final version = decoded['v'];
  if (version != null && version != hostQrVersion) return const HostQrInvalid(HostQrError.unsupportedVersion);

  final transport = _string(decoded['transport']);
  if (transport != null && transport.toLowerCase() != 'ssh') {
    return const HostQrInvalid(HostQrError.unsupportedTransport);
  }

  final url = _string(decoded['url']) ?? _string(decoded['address']);
  var host = _string(decoded['host']);
  var user = _string(decoded['user']);
  var port = _port(decoded['port']);
  // A port field that is there but unreadable is a broken code, not "use 22".
  if (decoded['port'] != null && port == null) return const HostQrInvalid(HostQrError.invalidPort);
  var fromQuery = const <String, String>{};
  if (url != null && url.trim().isNotEmpty) {
    final address = _parseAddress(url);
    if (address.error case final error?) return HostQrInvalid(error);
    host ??= address.host;
    user ??= address.user;
    port ??= address.port;
    fromQuery = address.query;
  }

  return _build(
    host: host,
    user: user,
    port: port,
    name: _string(decoded['name']),
    // `token` is the documented key; the others are accepted so a code made by
    // a simpler generator still works.
    password: _password(decoded['token']) ?? _password(decoded['password']) ?? fromQuery['token'] ?? fromQuery['password'],
    launchCommand: _string(decoded['launchCommand']) ?? _string(decoded['command']),
    workingDirectory: _string(decoded['workingDirectory']) ?? _string(decoded['cwd']),
    fallbackName: fromQuery['name'],
  );
}

HostQrOutcome _fromLink(String text) {
  // Random text with line breaks or spaces is not an address; refuse it before
  // it can look like a host name.
  if (RegExp(r'\s').hasMatch(text)) return const HostQrInvalid(HostQrError.notHostQr);
  final address = _parseAddress(text);
  if (address.error case final error?) return HostQrInvalid(error);
  return _build(
    host: address.host,
    user: address.user,
    port: address.port,
    name: address.query['name'],
    password: address.query['token'] ?? address.query['password'],
    launchCommand: address.query['command'],
    workingDirectory: address.query['cwd'],
  );
}

HostQrOutcome _build({
  required String? host,
  required String? user,
  required int? port,
  String? name,
  String? password,
  String? launchCommand,
  String? workingDirectory,
  String? fallbackName,
}) {
  final cleanHost = _cleanHost(host);
  if (host == null || host.trim().isEmpty) return const HostQrInvalid(HostQrError.missingAddress);
  if (cleanHost == null) return const HostQrInvalid(HostQrError.invalidAddress);
  final cleanUser = _cleanUser(user);
  if (user == null || user.trim().isEmpty) return const HostQrInvalid(HostQrError.missingUser);
  if (cleanUser == null) return const HostQrInvalid(HostQrError.missingUser);
  final cleanPort = port ?? 22;
  if (cleanPort < 1 || cleanPort > 65535) return const HostQrInvalid(HostQrError.invalidPort);
  final givenName = _short(name ?? fallbackName, 64);
  final secret = password != null && password.isNotEmpty ? password : null;
  return HostQrHost(
    HostQrPayload(
      name: givenName ?? cleanHost,
      named: givenName != null,
      host: cleanHost,
      user: cleanUser,
      port: cleanPort,
      password: secret,
      launchCommand: _short(launchCommand, 200),
      workingDirectory: _short(workingDirectory, 400),
    ),
  );
}

/// `ssh://user@host:port?token=…`, `user@host:port` or `host:port`. A web
/// address is refused as a transport this app does not have, not as a typo.
class _ParsedAddress {
  const _ParsedAddress({this.host, this.user, this.port, this.query = const {}, this.error});

  final String? host;
  final String? user;
  final int? port;
  final Map<String, String> query;
  final HostQrError? error;
}

_ParsedAddress _parseAddress(String text) {
  final value = text.trim();
  if (value.isEmpty) return const _ParsedAddress(error: HostQrError.missingAddress);

  final scheme = RegExp(r'^([a-zA-Z][a-zA-Z0-9+.-]*)://').firstMatch(value);
  if (scheme != null) {
    final name = scheme.group(1)!.toLowerCase();
    if (name != 'ssh') {
      // A dsh-mobile / dsh-go LAN pairing QR is an https URL; it is another
      // app's code, not a broken host address.
      final web = name == 'http' || name == 'https';
      return _ParsedAddress(error: web ? HostQrError.unsupportedTransport : HostQrError.notHostQr);
    }
    final Uri uri;
    try {
      uri = Uri.parse(value);
    } catch (_) {
      return const _ParsedAddress(error: HostQrError.invalidAddress);
    }
    if (uri.host.isEmpty) return _ParsedAddress(error: HostQrError.missingAddress, query: uri.queryParameters);
    // `ssh://user@host`; a `user:password@host` form keeps only the user name —
    // the password belongs in `token`.
    final userInfo = uri.userInfo.isEmpty ? null : Uri.decodeComponent(uri.userInfo.split(':').first);
    int? port;
    if (uri.hasPort) {
      try {
        port = uri.port;
      } on FormatException {
        return const _ParsedAddress(error: HostQrError.invalidPort);
      }
    }
    return _ParsedAddress(host: uri.host, user: userInfo, port: port, query: uri.queryParameters);
  }

  // No scheme: `[user@]host[:port]`, with `[::1]` for IPv6. Other
  // scheme-without-slash payloads (`mailto:`, `tel:`) and Wi-Fi codes
  // (`WIFI:S:…;T:…;;`) are other apps' QR codes.
  if (RegExp(r'^[a-zA-Z][a-zA-Z0-9+.-]*:(?!\d)').hasMatch(value) || value.contains(';')) {
    return const _ParsedAddress(error: HostQrError.notHostQr);
  }
  final at = value.lastIndexOf('@');
  if (at == value.length - 1) return const _ParsedAddress(error: HostQrError.missingAddress);
  final user = at > 0 ? value.substring(0, at) : null;
  final hostPart = at >= 0 ? value.substring(at + 1) : value;
  String host;
  int? port;
  if (hostPart.startsWith('[')) {
    final end = hostPart.indexOf(']');
    if (end < 0) return const _ParsedAddress(error: HostQrError.invalidAddress);
    host = hostPart.substring(1, end);
    final rest = hostPart.substring(end + 1);
    if (rest.isNotEmpty) {
      if (!rest.startsWith(':')) return const _ParsedAddress(error: HostQrError.invalidAddress);
      port = int.tryParse(rest.substring(1));
      if (port == null) return const _ParsedAddress(error: HostQrError.invalidPort);
    }
  } else {
    final colon = hostPart.lastIndexOf(':');
    if (colon >= 0) {
      host = hostPart.substring(0, colon);
      port = int.tryParse(hostPart.substring(colon + 1));
      if (port == null) return _ParsedAddress(error: HostQrError.invalidPort, user: user);
    } else {
      host = hostPart;
    }
  }
  if (host.isEmpty) return const _ParsedAddress(error: HostQrError.missingAddress);
  return _ParsedAddress(host: host, user: user, port: port);
}

/// A host name this app can put in an SSH config: no whitespace, no path and
/// no user part.
String? _cleanHost(String? raw) {
  final value = raw?.trim();
  if (value == null || value.isEmpty || value.length > 253) return null;
  if (RegExp(r'[\s/@\\]').hasMatch(value)) return null;
  if (value == '.' || value == '..') return null;
  return value;
}

String? _cleanUser(String? raw) {
  final value = raw?.trim();
  if (value == null || value.isEmpty || value.length > 64) return null;
  if (RegExp(r'[\s@/\\]').hasMatch(value)) return null;
  return value;
}

/// A JSON number or a numeric string; anything else is "no port given".
int? _port(Object? raw) => switch (raw) {
  final int value => value,
  final String value => int.tryParse(value.trim()),
  _ => null,
};

String? _string(Object? raw) => raw is String ? raw : null;

String? _password(Object? raw) => switch (raw) {
  final String value => value.isNotEmpty ? value : null,
  final num value => '$value',
  _ => null,
};

/// [value] trimmed and cut to [max] UTF-16 units, or null when empty.
String? _short(String? value, int max) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) return null;
  return trimmed.length <= max ? trimmed : trimmed.substring(0, max);
}
