// About → 「Обновления Narwhal」 → 「Обновить」: the update offer for one release
// of this fork (lib/update/apk_installer.dart).
//
// Nothing is downloaded until the person presses 「Скачать и установить」 here;
// the sheet then follows the provider through the download, the checksum and
// the hand-off to Android's own package installer. Closing the sheet doesn't
// stop a run in flight — the row shows its progress and this sheet picks it up
// again; 「Отменить скачивание」 is the way to stop it.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../state/self_update_state.dart';
import '../../update/apk_installer.dart';
import '../../update/self_release.dart';
import '../common/app_sheet.dart';
import '../common/sheet_title_bar.dart';
import '../theme/app_icons.dart';
import '../theme/theme.dart';
import 'update_sheet.dart' show SheetNotice, SheetProgress, formatUpdateSize;
import 'upstream_tile.dart' show openLink;

/// The update offer for [release]'s [asset].
///
/// A run that finished last time (the installer opened, or a failure) starts
/// over, so the sheet always begins at "what will happen"; a run still in
/// flight is left alone and simply shown.
Future<void> showSelfUpdateSheet(
  BuildContext context,
  WidgetRef ref,
  SelfRelease release,
  SelfReleaseAsset asset,
) {
  final state = ref.read(selfUpdateProvider);
  if (!state.busy) ref.read(selfUpdateProvider.notifier).reset();
  return showAppSheet<void>(
    context,
    isScrollControlled: true,
    builder: (_) => SelfUpdateSheet(release: release, asset: asset),
  );
}

/// Why the update stopped, in the app's language.
String describeSelfUpdateFailure(SelfUpdateFailure failure) => switch (failure) {
  SelfUpdateFailure.network => appL10n.selfUpdateNetworkFailed,
  SelfUpdateFailure.noSpace => appL10n.selfUpdateNoSpace,
  SelfUpdateFailure.tooLarge => appL10n.selfUpdateTooLarge(formatUpdateSize(maxSelfApkBytes)),
  SelfUpdateFailure.checksum => appL10n.selfUpdateChecksumFailed,
  SelfUpdateFailure.install => appL10n.selfUpdateInstallFailed,
};

class SelfUpdateSheet extends ConsumerWidget {
  const SelfUpdateSheet({super.key, required this.release, required this.asset});

  final SelfRelease release;

  /// The package that release carries ([SelfRelease.apk]).
  final SelfReleaseAsset asset;

  static const _buttonSize = Size.fromHeight(48);

  void _start(WidgetRef ref) => unawaited(ref.read(selfUpdateProvider.notifier).start(release, asset));

  Future<void> _openSettings(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (await ref.read(selfUpdateProvider.notifier).openInstallSettings()) return;
    messenger?.showSnackBar(SnackBar(content: Text(l10n.selfUpdateSettingsFailed)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = DshColors.of(context);
    final state = ref.watch(selfUpdateProvider);
    final size = asset.size;
    final facts = ['Narwhal ${release.version.name}', if (size != null) formatUpdateSize(size)].join(' · ');
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SheetTitleBar(l10n.selfUpdateSheetTitle),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(SheetTitleBar.inset, 0, SheetTitleBar.inset, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(facts, style: theme.textTheme.bodySmall?.copyWith(color: colors.textTertiary)),
                  const SizedBox(height: 16),
                  _body(context, state),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(SheetTitleBar.inset, 16, SheetTitleBar.inset, 8),
            child: _actions(context, ref, state),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context, SelfUpdateState state) {
    final l10n = context.l10n;
    final colors = DshColors.of(context);
    switch (state.phase) {
      case SelfUpdatePhase.idle:
        // What will happen, before anything is spent.
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Step(AppIcons.download, l10n.selfUpdateStepDownload),
            _Step(AppIcons.permissions, l10n.selfUpdateStepPermission),
            _Step(AppIcons.restart, l10n.selfUpdateStepRestart),
          ],
        );
      case SelfUpdatePhase.downloading:
        final fraction = state.fraction;
        final received = formatUpdateSize(state.received);
        final amount = state.total == null ? received : '$received / ${formatUpdateSize(state.total!)}';
        return SheetProgress(
          title: fraction == null ? l10n.updateDownloading : l10n.updateDownloadingPercent((fraction * 100).floor()),
          trailing: amount,
          value: fraction,
        );
      case SelfUpdatePhase.verifying:
        return SheetProgress(title: l10n.updateVerifyingPackage);
      case SelfUpdatePhase.needsPermission:
        return SheetNotice(
          icon: AppIcons.permissions,
          background: colors.warningContainer,
          foreground: colors.onWarningContainer,
          title: l10n.selfUpdatePermissionTitle,
          text: l10n.selfUpdatePermissionRequired,
        );
      case SelfUpdatePhase.opened:
        return SheetNotice(
          icon: AppIcons.completed,
          background: colors.successContainer,
          foreground: colors.onSuccessContainer,
          title: l10n.selfUpdateInstallerOpened,
          text: l10n.selfUpdateInstallerOpenedNote,
        );
      case SelfUpdatePhase.failed:
        return SheetNotice(
          icon: AppIcons.error,
          background: colors.dangerContainer,
          foreground: colors.onDangerContainer,
          title: l10n.selfUpdateFailedTitle,
          text: describeSelfUpdateFailure(state.failure ?? SelfUpdateFailure.install),
        );
    }
  }

  Widget _actions(BuildContext context, WidgetRef ref, SelfUpdateState state) {
    final l10n = context.l10n;
    void close() => Navigator.of(context).pop();
    final page = release.page;

    Widget pair(String secondary, VoidCallback? onSecondary, String primary, VoidCallback? onPrimary) => Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(minimumSize: _buttonSize),
            onPressed: onSecondary,
            child: Text(secondary),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(minimumSize: _buttonSize),
            onPressed: onPrimary,
            child: Text(primary),
          ),
        ),
      ],
    );

    Widget retry() => TextButton(
      key: const ValueKey('self-update-retry'),
      onPressed: () => _start(ref),
      child: Text(l10n.commonRetry),
    );

    switch (state.phase) {
      case SelfUpdatePhase.idle:
        return pair(l10n.commonCancel, close, l10n.selfUpdateDownloadAndInstall, () => _start(ref));
      case SelfUpdatePhase.downloading:
        return OutlinedButton(
          key: const ValueKey('self-update-cancel'),
          style: OutlinedButton.styleFrom(minimumSize: _buttonSize),
          onPressed: ref.read(selfUpdateProvider.notifier).cancel,
          child: Text(l10n.updateCancelDownload),
        );
      case SelfUpdatePhase.verifying:
        return FilledButton(
          style: FilledButton.styleFrom(minimumSize: _buttonSize),
          onPressed: null,
          child: Text(l10n.updateVerifying),
        );
      case SelfUpdatePhase.needsPermission:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            pair(l10n.commonLater, close, l10n.updateOpenPermissionSettings, () => unawaited(_openSettings(context, ref))),
            retry(),
          ],
        );
      case SelfUpdatePhase.opened:
        return pair(l10n.commonClose, close, l10n.commonRetry, () => _start(ref));
      case SelfUpdatePhase.failed:
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            pair(l10n.commonClose, close, l10n.commonRetry, () => _start(ref)),
            TextButton(
              key: const ValueKey('self-update-sheet-page'),
              onPressed: () => unawaited(openLink(context, ref, page)),
              child: Text(l10n.selfUpdatesReleasePage),
            ),
          ],
        );
    }
  }
}

/// One line of "what will happen": a small icon and a sentence.
class _Step extends StatelessWidget {
  const _Step(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = DshColors.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Icon(icon, size: 18, color: colors.textTertiary),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: theme.textTheme.bodyMedium?.copyWith(height: 1.45))),
        ],
      ),
    );
  }
}
