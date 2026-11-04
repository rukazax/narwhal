// 设置 → 关于: 「Обновления Narwhal」 — this fork's own releases, reported only.
//
// Nothing is downloaded or installed here: the row says which release is the
// latest, compared to the running build, and opens its page in the browser
// (the same way the original's row does, upstream_tile.dart).

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../state/self_release_state.dart';
import '../settings/settings_widgets.dart';
import '../theme/app_icons.dart';
import '../theme/theme.dart';
import 'upstream_tile.dart' show openLink;

class SelfReleaseTile extends ConsumerWidget {
  const SelfReleaseTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(selfReleaseProvider);
    final release = state.release;
    final newer = state.hasUpdate;
    return SettingsTile(
      key: const ValueKey('settings-self-update'),
      title: l10n.selfUpdatesTitle,
      subtitle: _subtitle(context, state),
      trailing: state.checking
          ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2))
          : newer
          ? Icon(AppIcons.openExternal, size: 18, color: DshColors.of(context).textTertiary)
          : TextButton(
              onPressed: () => unawaited(checkSelfRelease(context, ref)),
              child: Text(state.failure == null ? l10n.selfUpdatesCheck : l10n.selfUpdatesRetry),
            ),
      onTap: state.checking
          ? null
          : () => unawaited(newer && release != null ? openLink(context, ref, release.page) : checkSelfRelease(context, ref)),
    );
  }

  String _subtitle(BuildContext context, SelfReleaseState state) {
    final l10n = context.l10n;
    if (state.checking && state.release == null) return l10n.selfUpdatesChecking;
    if (state.failure != null) return l10n.selfUpdatesFailed;
    if (state.hasUpdate) return l10n.selfUpdatesAvailable(state.release!.label);
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
