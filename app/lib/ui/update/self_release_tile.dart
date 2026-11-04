// 设置 → 关于: 「Обновления Narwhal」 — this fork's own releases.
//
// The row says which release is the latest, compared to the running build. A
// newer release adds two actions: 「Обновить」, which opens the update offer
// (ui/update/self_release_sheet.dart) and downloads nothing until the person
// confirms there, and 「Страница релиза」, which opens the release page in the
// browser. Neither is ever started by the weekly automatic check: that one only
// says what is out.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../state/self_release_state.dart';
import '../../state/self_update_state.dart';
import '../settings/settings_widgets.dart';
import 'self_release_sheet.dart' show showSelfUpdateSheet;
import 'update_sheet.dart' show formatUpdateSize;
import 'upstream_tile.dart' show openLink;

class SelfReleaseTile extends ConsumerWidget {
  const SelfReleaseTile({super.key});

  /// 「Обновить」: the confirmed, in-app update.
  static const installKey = ValueKey('self-update-install');

  /// 「Страница релиза」: the browser.
  static const pageKey = ValueKey('self-update-page');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(selfReleaseProvider);
    final run = ref.watch(selfUpdateProvider);
    final release = state.release;
    final newer = state.hasUpdate;
    final row = SettingsTile(
      key: const ValueKey('settings-self-update'),
      title: l10n.selfUpdatesTitle,
      subtitle: _subtitle(context, state, run),
      trailing: state.checking
          ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2))
          : newer
          ? null
          : TextButton(
              onPressed: () => unawaited(checkSelfRelease(context, ref)),
              child: Text(state.failure == null ? l10n.selfUpdatesCheck : l10n.selfUpdatesRetry),
            ),
      // A newer release has its own two keys below; the row itself does nothing
      // then, and asking GitHub again is not what a tap there would mean.
      onTap: state.checking || newer ? null : () => unawaited(checkSelfRelease(context, ref)),
    );
    if (!newer || release == null) return row;
    final asset = release.apk;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        row,
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
          child: Row(
            children: [
              if (asset != null)
                Expanded(
                  child: FilledButton(
                    key: installKey,
                    style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(40)),
                    onPressed: () => unawaited(showSelfUpdateSheet(context, ref, release, asset)),
                    child: Text(l10n.selfUpdatesInstall),
                  ),
                ),
              if (asset != null) const SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  key: pageKey,
                  style: TextButton.styleFrom(minimumSize: const Size.fromHeight(40)),
                  onPressed: () => unawaited(openLink(context, ref, release.page)),
                  child: Text(l10n.selfUpdatesReleasePage),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _subtitle(BuildContext context, SelfReleaseState state, SelfUpdateState run) {
    final l10n = context.l10n;
    if (state.checking && state.release == null) return l10n.selfUpdatesChecking;
    if (state.failure != null) return l10n.selfUpdatesFailed;
    // A download under way is more interesting than the offer itself.
    if (run.busy) {
      final fraction = run.fraction;
      return fraction == null ? l10n.updateDownloading : l10n.updateDownloadingPercent((fraction * 100).floor());
    }
    if (state.hasUpdate) {
      final release = state.release!;
      final size = release.apk?.size;
      return size == null
          ? l10n.selfUpdatesAvailable(release.label)
          : l10n.selfUpdatesAvailableSize(release.label, formatUpdateSize(size));
    }
    return l10n.selfUpdatesCurrent(state.installedLabel);
  }
}

/// 「Проверить」: a check the person asked for, which ignores the weekly window.
/// Says so when GitHub didn't answer.
Future<void> checkSelfRelease(BuildContext context, WidgetRef ref) async {
  final l10n = context.l10n;
  final messenger = ScaffoldMessenger.maybeOf(context);
  await ref.read(selfReleaseProvider.notifier).check();
  if (!context.mounted) return;
  if (ref.read(selfReleaseProvider).failure != null) {
    messenger?.showSnackBar(SnackBar(content: Text(l10n.selfUpdatesNoAnswer)));
  }
}
