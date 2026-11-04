// What a scanned host code turns into: a confirmation sheet (name and address,
// never the token), then the same save as the manual form. A host already saved
// for the same address is updated in place, so scanning twice does not leave
// two rows for one machine.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../remote/qr/host_qr.dart';
import '../../state/hosts_state.dart';
import '../common/app_sheet.dart';
import '../common/brief_notice.dart';
import '../common/list_page_row.dart';
import '../settings/settings_widgets.dart';
import '../theme/app_icons.dart';
import '../theme/theme.dart';

/// "Add this host?" — true when the person accepts.
Future<bool?> showHostQrConfirm(BuildContext context, HostQrPayload payload) =>
    showAppSheet<bool>(context, builder: (_) => HostQrConfirmSheet(payload: payload));

class HostQrConfirmSheet extends StatelessWidget {
  const HostQrConfirmSheet({super.key, required this.payload});

  final HostQrPayload payload;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = DshColors.of(context);
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SheetHeader(l10n.remoteQrConfirmTitle),
          // A short phone (or a large text size) scrolls rather than clips.
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(kSheetGutter, 4, kSheetGutter, 14),
                    child: Row(
                      children: [
                        const SettingsIcon(AppIcons.sshHost),
                        const SizedBox(width: SettingsMetrics.iconGap),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                payload.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                payload.address,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppType.mono(size: 13, color: colors.textTertiary, height: 1.45),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SheetGroup(
                    children: [
                      ListPageRow(
                        icon: AppIcons.sshHost,
                        title: l10n.remoteQrConfirmAddress,
                        value: payload.address,
                      ),
                      ListPageRow(
                        icon: AppIcons.command,
                        title: l10n.remotePort,
                        value: '${payload.port}',
                      ),
                      ListPageRow(
                        icon: AppIcons.lock,
                        title: l10n.remoteQrConfirmPassword,
                        subtitle: payload.hasPassword
                            ? l10n.remoteQrConfirmPasswordIncluded
                            : l10n.remoteQrConfirmPasswordMissing,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(kSheetGutter, 10, kSheetGutter, 0),
                    child: Text(
                      l10n.remoteQrConfirmPrivacy,
                      style: theme.textTheme.bodySmall?.copyWith(color: colors.textTertiary, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12 + MediaQuery.viewPaddingOf(context).bottom),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(l10n.commonCancel),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    key: const ValueKey('host-qr-confirm-add'),
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(l10n.remoteQrConfirmAdd),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Confirms [payload] and saves it. Returns the host to connect to, or null
/// when the person cancelled or the save failed.
Future<HostRef?> addHostFromQr(BuildContext context, WidgetRef ref, HostQrPayload payload) async {
  final confirmed = await showHostQrConfirm(context, payload);
  if (confirmed != true || !context.mounted) return null;

  // Reuse an existing row for the same machine (and its pinned host key).
  await ref.read(hostsProvider.notifier).ready;
  if (!context.mounted) return null;
  final hosts = ref.read(hostsProvider).ssh;
  SshHostConfig? existing;
  for (final host in hosts) {
    if (host.host == payload.host && host.port == payload.port && host.user == payload.user) {
      existing = host;
      break;
    }
  }
  var config = payload.toConfig(id: existing?.id);
  // A code without a name must not rename a host the person already named.
  if (existing != null && !payload.named) config = config.copyWith(name: existing.name);

  try {
    await ref.read(hostsProvider.notifier).saveSsh(
      config,
      secrets: payload.hasPassword ? SshSecrets(password: payload.password) : null,
    );
  } catch (_) {
    if (context.mounted) showBriefNotice(context, context.l10n.commonSaveFailed);
    return null;
  }
  return HostRef.ssh(config.id);
}
