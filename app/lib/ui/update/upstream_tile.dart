// 设置 → 关于: "dsh-go updates" — the *original* app's releases, reported only.
//
// This build is signed with its own key, so an upstream APK cannot be
// installed over it; the row opens the release page instead of downloading.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../../state/star_prompt.dart' show starLinkOpenerProvider;
import '../../update/upstream.dart';
import '../settings/settings_widgets.dart';
import '../theme/app_icons.dart';
import '../theme/theme.dart';

class UpstreamUpdateTile extends ConsumerStatefulWidget {
  const UpstreamUpdateTile({super.key});

  @override
  ConsumerState<UpstreamUpdateTile> createState() => _UpstreamUpdateTileState();
}

class _UpstreamUpdateTileState extends ConsumerState<UpstreamUpdateTile> {
  UpstreamCheck? _check;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    unawaited(_run(force: false));
  }

  Future<void> _run({required bool force}) async {
    if (mounted) setState(() => _checking = true);
    final check = await ref.read(upstreamCheckerProvider).check(force: force);
    if (!mounted) return;
    setState(() {
      _check = check;
      _checking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final release = _check?.release;
    final newer = release?.isNewer ?? false;
    return SettingsTile(
      key: const ValueKey('settings-upstream'),
      title: l10n.upstreamUpdatesTitle,
      subtitle: _subtitle(context, release),
      trailing: _checking
          ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2))
          : newer
          ? Icon(AppIcons.openExternal, size: 18, color: DshColors.of(context).textTertiary)
          : null,
      onTap: _checking ? null : () => unawaited(_onTap(release, newer)),
    );
  }

  String _subtitle(BuildContext context, UpstreamRelease? release) {
    final l10n = context.l10n;
    if (_checking && release == null) return l10n.upstreamUpdatesChecking;
    if (release == null) return l10n.upstreamUpdatesFailed;
    if (release.isNewer) return l10n.upstreamUpdatesAvailable(release.version.name);
    return l10n.upstreamUpdatesCurrent(upstreamBase.name, release.version.name);
  }

  Future<void> _onTap(UpstreamRelease? release, bool newer) async {
    if (release != null && newer) {
      await _openRelease(release);
      return;
    }
    // Up to date (or unknown): a tap is a forced check.
    await _run(force: true);
    if (!mounted) return;
    if (_check?.failed ?? false) {
      final messenger = ScaffoldMessenger.maybeOf(context);
      messenger?.showSnackBar(SnackBar(content: Text(context.l10n.upstreamUpdatesNoAnswer)));
    }
  }

  Future<void> _openRelease(UpstreamRelease release) async {
    final l10n = context.l10n;
    final open = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.upstreamUpdatesDialogTitle(release.version.name)),
        content: Text(l10n.upstreamUpdatesDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l10n.upstreamUpdatesClose),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l10n.upstreamUpdatesOpenRelease),
          ),
        ],
      ),
    );
    if (open != true || !mounted) return;
    await openLink(context, ref, release.page);
  }
}

/// Opens [url] in the browser; when no browser answers, copies it instead.
Future<void> openLink(BuildContext context, WidgetRef ref, Uri url) async {
  final l10n = context.l10n;
  final messenger = ScaffoldMessenger.maybeOf(context);
  try {
    if (await ref.read(starLinkOpenerProvider)(url)) return;
  } catch (_) {
    // Fall through to copying, as the About page's author links do.
  }
  var copied = true;
  try {
    await Clipboard.setData(ClipboardData(text: url.toString()));
  } catch (_) {
    copied = false;
  }
  if (messenger?.mounted ?? false) {
    messenger!.showSnackBar(
      SnackBar(content: Text(copied ? l10n.shellBrowserUrlCopied : l10n.stateBrowserOpenFailed)),
    );
  }
}
