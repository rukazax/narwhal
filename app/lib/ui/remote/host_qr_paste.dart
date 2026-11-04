// The no-camera way in: paste a QR link or the JSON from a code someone sent
// in a chat. Same parser as the scanner, so both paths accept the same text and
// refuse the same payloads.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../l10n/l10n.dart';
import '../../remote/qr/host_qr.dart';
import '../theme/app_icons.dart';
import '../theme/theme.dart';
import 'host_qr_texts.dart';

/// Asks for a QR payload as text. Null when the person backs out.
Future<HostQrPayload?> showHostQrPasteDialog(BuildContext context) =>
    showDialog<HostQrPayload>(context: context, builder: (_) => const HostQrPasteDialog());

class HostQrPasteDialog extends StatefulWidget {
  const HostQrPasteDialog({super.key});

  @override
  State<HostQrPasteDialog> createState() => _HostQrPasteDialogState();
}

class _HostQrPasteDialogState extends State<HostQrPasteDialog> {
  final _text = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _paste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (!mounted) return;
    final text = data?.text?.trim();
    if (text == null || text.isEmpty) {
      setState(() => _error = context.l10n.remoteScanQrClipboardEmpty);
      return;
    }
    setState(() {
      _text.text = text;
      _error = null;
    });
  }

  void _check() {
    switch (parseHostQr(_text.text)) {
      case HostQrHost(:final payload):
        Navigator.of(context).pop(payload);
      case HostQrInvalid(:final reason):
        setState(() => _error = hostQrErrorText(context.l10n, reason));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scheme = Theme.of(context).colorScheme;
    final colors = DshColors.of(context);
    return AlertDialog(
      title: Text(l10n.remoteScanQrPasteTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              key: const ValueKey('host-qr-paste-field'),
              controller: _text,
              minLines: 3,
              maxLines: 6,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.multiline,
              style: AppType.mono(size: 12, color: scheme.onSurface, height: 1.45),
              onChanged: (_) {
                if (_error != null) setState(() => _error = null);
              },
              decoration: InputDecoration(
                hintText: l10n.remoteScanQrPasteHint,
                hintStyle: AppType.mono(size: 12, color: colors.textTertiary, height: 1.45),
                errorText: _error,
                errorMaxLines: 4,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton.icon(
                onPressed: _paste,
                icon: const Icon(AppIcons.paste, size: 18),
                label: Text(l10n.remoteScanQrPasteClipboard),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.commonCancel)),
        FilledButton(onPressed: _check, child: Text(l10n.remoteScanQrPasteCheck)),
      ],
    );
  }
}
