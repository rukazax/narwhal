// Scans the host QR code described in lib/remote/qr/host_qr.dart: a camera
// preview with a torch key, a clear state for every way the camera or the code
// can refuse, and a paste fallback for phones without a working camera.
//
// The page only reads the code: confirmation and saving happen on the remote
// screen ([addHostFromQr]), so a cancelled scan changes nothing.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../l10n/l10n.dart';
import '../../remote/qr/host_qr.dart';
import '../settings/settings_widgets.dart';
import '../shell/page_frame.dart';
import '../theme/app_icons.dart';
import '../theme/theme.dart';
import 'host_qr_paste.dart';
import 'host_qr_texts.dart';

/// Opens the camera, reads one host code and pops the parsed [HostQrPayload].
class HostQrScanPage extends StatefulWidget {
  const HostQrScanPage({super.key});

  @override
  State<HostQrScanPage> createState() => _HostQrScanPageState();
}

class _HostQrScanPageState extends State<HostQrScanPage> with WidgetsBindingObserver {
  final _controller = MobileScannerController(
    formats: const [BarcodeFormat.qrCode],
    detectionSpeed: DetectionSpeed.noDuplicates,
    // This page mounts and unmounts the camera widget when a code is refused,
    // so it (not the widget) decides when the camera starts: one `start()` at
    // a time, no "already initializing" race on a remount.
    autoStart: false,
  );

  /// The last code this app refused; the preview is replaced by its message
  /// until the person retries or pastes a link.
  HostQrInvalid? _invalid;

  /// A code was accepted (or a link pasted): stop reacting to further frames.
  bool _handled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // The camera widget attaches the controller during its first build.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(_start());
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_controller.dispose());
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // The controller is ours (not the widget's), so pausing is ours too.
    if (_controller.value.error?.errorCode == MobileScannerErrorCode.permissionDenied) return;
    switch (state) {
      case AppLifecycleState.resumed:
        unawaited(_start());
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
      case AppLifecycleState.detached:
        unawaited(_controller.stop().catchError((Object _) {}));
    }
  }

  Future<void> _start() async {
    if (_handled || _controller.value.isRunning) return;
    try {
      await _controller.start();
    } catch (_) {
      // Not attached yet (the widget is being rebuilt) or the camera failed:
      // the widget shows the error with a retry.
    }
  }

  void _onDetect(BarcodeCapture capture) {
    if (_handled) return;
    for (final barcode in capture.barcodes) {
      final raw = barcode.rawValue;
      if (raw == null || raw.isEmpty) continue;
      switch (parseHostQr(raw)) {
        case HostQrHost(:final payload):
          _handled = true;
          unawaited(_accept(payload));
        case HostQrInvalid invalid:
          _handled = true;
          unawaited(_controller.stop().catchError((Object _) {}));
          if (mounted) setState(() => _invalid = invalid);
      }
      return;
    }
  }

  Future<void> _accept(HostQrPayload payload) async {
    try {
      await _controller.stop();
    } catch (_) {}
    if (mounted) Navigator.of(context).pop(payload);
  }

  Future<void> _retry() async {
    setState(() {
      _invalid = null;
      _handled = false;
    });
    // A refused code unmounted the camera widget: start after it is back.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(_start());
    });
  }

  Future<void> _paste() async {
    final payload = await showHostQrPasteDialog(context);
    if (payload == null || !mounted) return;
    _handled = true;
    await _accept(payload);
  }

  Future<void> _toggleTorch() async {
    try {
      await _controller.toggleTorch();
    } catch (_) {
      // No flashlight on this camera: the key is disabled.
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final invalid = _invalid;
    return AppPage.list(
      title: l10n.remoteScanQr,
      subtitle: Text(invalid == null ? l10n.remoteScanQrHint : l10n.remoteScanQrPasteHelp),
      actions: [
        ValueListenableBuilder<MobileScannerState>(
          valueListenable: _controller,
          builder: (context, state, _) => GlassIconButton(
            key: const ValueKey('host-qr-torch'),
            // The bolt is the app's light glyph (AppIcons.running): a torch key.
            icon: AppIcons.running,
            tooltip: l10n.remoteScanQrTorch,
            onPressed: state.torchState == TorchState.unavailable ? null : () => unawaited(_toggleTorch()),
          ),
        ),
      ],
      children: [
        if (invalid != null)
          _RefusedCard(
            key: const ValueKey('host-qr-refused'),
            message: hostQrErrorText(l10n, invalid.reason),
            retryLabel: l10n.remoteScanQrCameraRetry,
            onRetry: () => unawaited(_retry()),
            pasteLabel: l10n.remoteScanQrPaste,
            onPaste: () => unawaited(_paste()),
          )
        else
          _Preview(
            controller: _controller,
            onDetect: _onDetect,
            onRetry: () => unawaited(_retry()),
            onPaste: () => unawaited(_paste()),
          ),
        SettingsSection(
          title: l10n.remoteScanQrHowTitle,
          footer: Text(l10n.remoteScanQrPrivacy),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(SettingsMetrics.inset, 12, SettingsMetrics.trailingPad, 8),
              child: Text(
                l10n.remoteScanQrHowBody,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: DshColors.of(context).textTertiary,
                  height: 1.55,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(SettingsMetrics.inset, 0, SettingsMetrics.trailingPad, 10),
              child: SelectableText(
                _examplePayload,
                style: AppType.mono(size: 11, color: Theme.of(context).colorScheme.onSurfaceVariant, height: 1.5),
              ),
            ),
            SettingsTile(
              icon: AppIcons.paste,
              tinted: false,
              title: l10n.remoteScanQrPaste,
              subtitle: l10n.remoteScanQrPasteHelp,
              onTap: () => unawaited(_paste()),
            ),
          ],
        ),
      ],
    );
  }

  /// What any QR generator can encode; the JSON is the canonical payload.
  static const _examplePayload =
      '{"v":1,"kind":"narwhal-host","name":"Home PC",\n'
      ' "url":"ssh://you@192.168.1.20:22","token":"…"}';
}

/// The live camera with the frame overlay and the hint under it.
class _Preview extends StatelessWidget {
  const _Preview({
    required this.controller,
    required this.onDetect,
    required this.onRetry,
    required this.onPaste,
  });

  final MobileScannerController controller;
  final void Function(BarcodeCapture) onDetect;
  final VoidCallback onRetry;
  final VoidCallback onPaste;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: ClipRRect(
          borderRadius: AppShape.radiusLg,
          child: ColoredBox(
            color: Colors.black,
            child: Stack(
              fit: StackFit.expand,
              children: [
                MobileScanner(
                  key: const ValueKey('host-qr-camera'),
                  controller: controller,
                  onDetect: onDetect,
                  placeholderBuilder: (_) => const Center(child: CircularProgressIndicator()),
                  errorBuilder: (context, error) {
                    final message = switch (error.errorCode) {
                      MobileScannerErrorCode.permissionDenied => l10n.remoteScanQrCameraDenied,
                      MobileScannerErrorCode.unsupported => l10n.remoteScanQrCameraUnavailable,
                      _ => l10n.remoteScanQrCameraFailed,
                    };
                    return _CameraProblem(
                      message: message,
                      retryLabel: l10n.remoteScanQrCameraRetry,
                      pasteLabel: l10n.remoteScanQrPaste,
                      onRetry: onRetry,
                      onPaste: onPaste,
                    );
                  },
                ),
                const IgnorePointer(child: CustomPaint(painter: _FramePainter())),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 18,
                  child: IgnorePointer(
                    child: Text(
                      l10n.remoteScanQrHint,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Camera unavailable: what happened, a retry and the paste way in.
class _CameraProblem extends StatelessWidget {
  const _CameraProblem({
    required this.message,
    required this.retryLabel,
    required this.pasteLabel,
    required this.onRetry,
    required this.onPaste,
  });

  final String message;
  final String retryLabel;
  final String pasteLabel;
  final VoidCallback onRetry;
  final VoidCallback onPaste;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(AppIcons.camera, size: 34, color: Colors.white70),
              const SizedBox(height: 14),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70, height: 1.5),
              ),
              const SizedBox(height: 18),
              FilledButton.tonal(onPressed: onRetry, child: Text(retryLabel)),
              const SizedBox(height: 4),
              TextButton(onPressed: onPaste, child: Text(pasteLabel)),
            ],
          ),
        ),
      ),
    );
  }
}

/// A code this app won't connect to: why, and the two ways forward.
class _RefusedCard extends StatelessWidget {
  const _RefusedCard({
    super.key,
    required this.message,
    required this.retryLabel,
    required this.onRetry,
    required this.pasteLabel,
    required this.onPaste,
  });

  final String message;
  final String retryLabel;
  final VoidCallback onRetry;
  final String pasteLabel;
  final VoidCallback onPaste;

  @override
  Widget build(BuildContext context) {
    final colors = DshColors.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: SettingsSection(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(SettingsMetrics.inset, 14, SettingsMetrics.trailingPad, 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(AppIcons.attention, size: 22, color: colors.danger),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(message, style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.45)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(SettingsMetrics.inset, 6, SettingsMetrics.trailingPad, 12),
            child: Row(
              children: [
                FilledButton.tonal(onPressed: onRetry, child: Text(retryLabel)),
                const SizedBox(width: 8),
                TextButton(onPressed: onPaste, child: Text(pasteLabel)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Four corner marks and a quiet centre line over the live preview.
class _FramePainter extends CustomPainter {
  const _FramePainter();

  static const _inset = 26.0;
  static const _arm = 30.0;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    final rect = Rect.fromLTRB(_inset, _inset, size.width - _inset, size.height - _inset);
    for (final (corner, dx, dy) in [
      (rect.topLeft, 1.0, 1.0),
      (rect.topRight, -1.0, 1.0),
      (rect.bottomLeft, 1.0, -1.0),
      (rect.bottomRight, -1.0, -1.0),
    ]) {
      canvas.drawLine(corner, corner.translate(dx * _arm, 0), paint);
      canvas.drawLine(corner, corner.translate(0, dy * _arm), paint);
    }
  }

  @override
  bool shouldRepaint(_FramePainter oldDelegate) => false;
}
