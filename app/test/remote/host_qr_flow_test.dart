// The QR confirm flow without a camera (ui/remote/host_qr_add.dart,
// host_qr_paste.dart): what the sheet shows, what accepting saves, and that a
// refused code never reaches the host list.

import 'dart:convert';

import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_app/remote/qr/host_qr.dart';
import 'package:dsh_app/remote/secret_store.dart';
import 'package:dsh_app/state/hosts_state.dart';
import 'package:dsh_app/ui/remote/host_qr_add.dart';
import 'package:dsh_app/ui/remote/host_qr_paste.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shell/golden_harness.dart';

const _payloadRaw =
    '{"v":1,"kind":"narwhal-host","name":"Домашний сервер",'
    '"url":"ssh://me@10.0.0.5:2222","token":"s3cr3t"}';

const _existingRaw =
    '{"id":"ssh-existing","name":"Мой сервер","host":"10.0.0.5","port":2222,'
    '"user":"me","auth":"password","launchCommand":"dsh web"}';

HostQrPayload _payload([String raw = _payloadRaw]) => (parseHostQr(raw) as HostQrHost).payload;

void main() {
  late MemorySecretStore secrets;

  setUp(() {
    secrets = MemorySecretStore();
    SharedPreferences.setMockInitialValues({});
  });

  List<Override> overrides() => [secretStoreProvider.overrideWithValue(secrets)];

  Future<void> pumpApp(WidgetTester tester, Widget home) async {
    usePhoneSurface(tester);
    await tester.pumpWidget(goldenApp(home: home, brightness: Brightness.light, overrides: overrides()));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  Future<void> frames(WidgetTester tester, [int n = 8]) async {
    for (var i = 0; i < n; i++) {
      await tester.pump(const Duration(milliseconds: 60));
    }
  }

  /// A page with one key that opens a dialog/sheet, as the remote screen does.
  Widget opener(Future<void> Function(BuildContext context) onTap) => Scaffold(
    body: Center(
      child: Builder(
        builder: (context) => FilledButton(onPressed: () => onTap(context), child: const Text('open')),
      ),
    ),
  );

  testWidgets('the confirmation sheet shows the host and never the token', (tester) async {
    final payload = _payload();
    bool? answer;
    await pumpApp(
      tester,
      opener((context) async {
        answer = await showHostQrConfirm(context, payload);
      }),
    );
    await tester.tap(find.text('open'));
    await frames(tester);

    expect(find.text(appL10n.remoteQrConfirmTitle), findsOneWidget);
    expect(find.text('Домашний сервер'), findsOneWidget);
    expect(find.text('me@10.0.0.5:2222'), findsWidgets);
    expect(find.text(appL10n.remoteQrConfirmPasswordIncluded), findsOneWidget);
    expect(find.textContaining('s3cr3t'), findsNothing);

    await tester.tap(find.text(appL10n.commonCancel));
    await frames(tester);
    expect(answer, isFalse);
  });

  testWidgets('accepting adds the host and its password from the code', (tester) async {
    final payload = _payload();
    HostRef? added;
    await pumpApp(
      tester,
      Consumer(
        builder: (context, ref, _) => opener((context) async {
          added = await addHostFromQr(context, ref, payload);
        }),
      ),
    );
    final container = ProviderScope.containerOf(tester.element(find.text('open')));

    await tester.tap(find.text('open'));
    await frames(tester);
    await tester.tap(find.text(appL10n.remoteQrConfirmAdd));
    await frames(tester);

    expect(added, isNotNull);
    final hosts = container.read(hostsProvider).ssh;
    expect(hosts, hasLength(1));
    final host = hosts.single;
    expect(added, HostRef.ssh(host.id));
    expect(host.name, 'Домашний сервер');
    expect(host.host, '10.0.0.5');
    expect(host.port, 2222);
    expect(host.user, 'me');
    expect(await secrets.read(SshSecrets.passwordKey(host.id)), 's3cr3t');
    // Saved for the next launch, like the manual form.
    expect((await SharedPreferences.getInstance()).getString(HostsController.prefsKey), contains('10.0.0.5'));
  });

  testWidgets('cancelling adds nothing', (tester) async {
    final payload = _payload();
    await pumpApp(
      tester,
      Consumer(
        builder: (context, ref, _) => opener((context) async {
          await addHostFromQr(context, ref, payload);
        }),
      ),
    );
    final container = ProviderScope.containerOf(tester.element(find.text('open')));

    await tester.tap(find.text('open'));
    await frames(tester);
    await tester.tap(find.text(appL10n.commonCancel));
    await frames(tester);

    expect(container.read(hostsProvider).ssh, isEmpty);
    expect(secrets.values, isEmpty);
  });

  testWidgets('a second scan of the same machine updates its row', (tester) async {
    SharedPreferences.setMockInitialValues({
      HostsController.prefsKey: jsonEncode([jsonDecode(_existingRaw)]),
    });
    // No name in this code: the person's own name must survive.
    final payload = _payload('{"v":1,"kind":"narwhal-host","url":"ssh://me@10.0.0.5:2222","token":"other"}');
    HostRef? added;
    await pumpApp(
      tester,
      Consumer(
        builder: (context, ref, _) => opener((context) async {
          added = await addHostFromQr(context, ref, payload);
        }),
      ),
    );
    final container = ProviderScope.containerOf(tester.element(find.text('open')));

    await tester.tap(find.text('open'));
    await frames(tester);
    await tester.tap(find.text(appL10n.remoteQrConfirmAdd));
    await frames(tester);

    final hosts = container.read(hostsProvider).ssh;
    expect(hosts, hasLength(1));
    expect(hosts.single.id, 'ssh-existing');
    expect(hosts.single.name, 'Мой сервер');
    expect(added, const HostRef.ssh('ssh-existing'));
    expect(await secrets.read(SshSecrets.passwordKey('ssh-existing')), 'other');
  });

  testWidgets('the paste dialog refuses another app’s code, then accepts a link', (tester) async {
    HostQrPayload? pasted;
    await pumpApp(
      tester,
      opener((context) async {
        pasted = await showHostQrPasteDialog(context);
      }),
    );
    await tester.tap(find.text('open'));
    await frames(tester);

    await tester.enterText(
      find.byKey(const ValueKey('host-qr-paste-field')),
      'WIFI:S:home;T:WPA;P:secret;;',
    );
    await tester.tap(find.text(appL10n.remoteScanQrPasteCheck));
    await frames(tester);
    expect(find.text(appL10n.remoteQrErrOtherApp), findsOneWidget);
    expect(pasted, isNull);

    await tester.enterText(find.byKey(const ValueKey('host-qr-paste-field')), 'ssh://me@nas.local?token=k');
    await tester.tap(find.text(appL10n.remoteScanQrPasteCheck));
    await frames(tester);
    expect(pasted?.host, 'nas.local');
    expect(pasted?.user, 'me');
    expect(pasted?.password, 'k');
  });
}
