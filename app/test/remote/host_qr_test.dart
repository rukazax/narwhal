// The host QR payload (lib/remote/qr/host_qr.dart): what this app accepts,
// what it refuses and why. No camera: the parser is plain Dart.

import 'package:dsh_app/remote/qr/host_qr.dart';
import 'package:dsh_app/remote/ssh/ssh_host_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// The payload of a code that should be accepted.
  HostQrPayload host(String raw) {
    final outcome = parseHostQr(raw);
    expect(outcome, isA<HostQrHost>(), reason: 'expected a host from: $raw');
    return (outcome as HostQrHost).payload;
  }

  /// Why a code should be refused.
  HostQrError refusal(String raw) {
    final outcome = parseHostQr(raw);
    expect(outcome, isA<HostQrInvalid>(), reason: 'expected a refusal for: $raw');
    return (outcome as HostQrInvalid).reason;
  }

  group('JSON payload', () {
    test('reads the canonical payload', () {
      final payload = host(
        '{"v":1,"kind":"narwhal-host","transport":"ssh","name":"Home PC",'
        '"url":"ssh://me@192.168.1.20:2222","token":"s3cr3t",'
        '"launchCommand":"dsh web --port 0","workingDirectory":"~/code"}',
      );
      expect(payload.name, 'Home PC');
      expect(payload.named, isTrue);
      expect(payload.host, '192.168.1.20');
      expect(payload.user, 'me');
      expect(payload.port, 2222);
      expect(payload.password, 's3cr3t');
      expect(payload.hasPassword, isTrue);
      expect(payload.address, 'me@192.168.1.20:2222');
      expect(payload.launchCommand, 'dsh web --port 0');
      expect(payload.workingDirectory, '~/code');
    });

    test('separate host, user and port fields, port defaults to 22', () {
      final payload = host('{"v":1,"kind":"narwhal-host","host":"lab.example.com","user":"root"}');
      expect(payload.host, 'lab.example.com');
      expect(payload.user, 'root');
      expect(payload.port, 22);
      expect(payload.address, 'root@lab.example.com');
      expect(payload.password, isNull);
      expect(payload.hasPassword, isFalse);
      expect(payload.name, 'lab.example.com');
      expect(payload.named, isFalse);
    });

    test('a port sent as a string is read', () {
      expect(host('{"v":1,"kind":"narwhal-host","host":"h","user":"u","port":"2200"}').port, 2200);
    });

    test('token and name may come from the URL query', () {
      final payload = host('{"v":1,"kind":"narwhal-host","url":"ssh://me@10.0.0.5?token=fromQuery&name=Desk"}');
      expect(payload.host, '10.0.0.5');
      expect(payload.password, 'fromQuery');
      expect(payload.name, 'Desk');
      expect(payload.named, isTrue);
    });

    test('a numeric token is kept as text', () {
      expect(host('{"v":1,"kind":"narwhal-host","host":"h","user":"u","token":123456}').password, '123456');
    });

    test('a missing v means version 1', () {
      expect(host('{"kind":"narwhal-host","host":"h","user":"u"}').host, 'h');
    });

    test('a newer version is refused', () {
      expect(refusal('{"v":2,"kind":"narwhal-host","host":"h","user":"u"}'), HostQrError.unsupportedVersion);
    });

    test('a version that is not a number is refused', () {
      expect(refusal('{"v":"1","kind":"narwhal-host","host":"h","user":"u"}'), HostQrError.unsupportedVersion);
      expect(refusal('{"v":0,"kind":"narwhal-host","host":"h","user":"u"}'), HostQrError.unsupportedVersion);
    });

    test('another app’s payload is refused', () {
      expect(refusal('{"v":1,"kind":"dshgo-share","url":"https://go.dshtui.com/share/"}'), HostQrError.notHostQr);
      expect(refusal('{"schema":1,"plugins":[]}'), HostQrError.notHostQr);
    });

    test('a LAN / WebRTC payload is refused as another transport', () {
      expect(
        refusal('{"v":1,"kind":"narwhal-host","transport":"lan","url":"https://192.168.1.20:3443","token":"k"}'),
        HostQrError.unsupportedTransport,
      );
      expect(
        refusal('{"v":1,"kind":"narwhal-host","transport":"ssh","url":"https://192.168.1.20:3443"}'),
        HostQrError.unsupportedTransport,
      );
    });

    test('missing fields are named', () {
      expect(refusal('{"v":1,"kind":"narwhal-host","user":"me"}'), HostQrError.missingAddress);
      expect(refusal('{"v":1,"kind":"narwhal-host","url":"ssh://host"}'), HostQrError.missingUser);
      expect(refusal('{"v":1,"kind":"narwhal-host","host":"h","user":"u","port":70000}'), HostQrError.invalidPort);
      expect(refusal('{"v":1,"kind":"narwhal-host","host":"h","user":"u","port":"abc"}'), HostQrError.invalidPort);
    });

    test('broken JSON is not a host code', () {
      expect(refusal('{"v":1,"kind":"narwhal-host",'), HostQrError.notHostQr);
    });

    test('the password never appears in toString', () {
      final payload = host('{"v":1,"kind":"narwhal-host","host":"h","user":"u","token":"s3cr3t"}');
      expect(payload.toString(), isNot(contains('s3cr3t')));
    });
  });

  group('links', () {
    test('an ssh link with a token query', () {
      final payload = host('ssh://me@192.168.1.20:2222?token=s3cr3t&name=Home%20PC');
      expect(payload.name, 'Home PC');
      expect(payload.user, 'me');
      expect(payload.host, '192.168.1.20');
      expect(payload.port, 2222);
      expect(payload.password, 's3cr3t');
    });

    test('a plain user@host:port', () {
      final payload = host('me@192.168.1.20:2222');
      expect(payload.user, 'me');
      expect(payload.host, '192.168.1.20');
      expect(payload.port, 2222);
      expect(payload.name, '192.168.1.20');
      expect(payload.password, isNull);
    });

    test('a plain user@host uses port 22', () {
      expect(host('me@nas.local').port, 22);
    });

    test('a web link is another transport, not a typo', () {
      expect(refusal('https://192.168.1.20:3443/app?token=k'), HostQrError.unsupportedTransport);
    });

    test('random text is not a host code', () {
      expect(refusal('hello world'), HostQrError.notHostQr);
      expect(refusal('WIFI:S:home;T:WPA;P:secret;;'), HostQrError.notHostQr);
      expect(refusal('mailto:me@example.com'), HostQrError.notHostQr);
      expect(refusal('BEGIN:VCARD\nVERSION:3.0\nEND:VCARD'), HostQrError.notHostQr);
    });

    test('an empty or oversized code is refused', () {
      expect(refusal(''), HostQrError.empty);
      expect(refusal('   \n '), HostQrError.empty);
      expect(refusal('ssh://${'a' * (hostQrMaxLength + 1)}'), HostQrError.tooLong);
    });
  });

  group('toConfig', () {
    test('carries the host fields and the form’s defaults', () {
      final payload = host('{"v":1,"kind":"narwhal-host","name":"Home","host":"h","user":"me","port":2200}');
      final config = payload.toConfig(id: 'ssh-test');
      expect(config.id, 'ssh-test');
      expect(config.name, 'Home');
      expect(config.host, 'h');
      expect(config.user, 'me');
      expect(config.port, 2200);
      expect(config.auth.name, 'password');
      expect(config.launchCommand, defaultDshLaunchCommand);
      expect(config.workingDirectory, isNull);
    });
  });
}
