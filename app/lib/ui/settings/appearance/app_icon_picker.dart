// Picks the launcher icon (桌面图标), for the appearance page. The icons
// themselves: android/app/src/main/res (ic_launcher_*).

import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/l10n.dart';
import '../../../state/app_icon_state.dart';
import '../../common/pressable.dart';
import '../../theme/theme.dart';
import '../../common/brief_notice.dart';
import 'launcher_narwhal.dart';

/// The four launcher icons in a row, drawn as the launcher draws them (the
/// system's icon mask), the one on the phone ringed in the accent:
///
/// ```
///   ╭───╮      ╭───╮      ╭───╮      ╭───╮
///  ( ◖● )     │ ◖● │     │ ◖● │     │ ◖● │    a ring [ringGap] off the chosen
///   ╰───╯      ╰───╯      ╰───╯      ╰───╯    icon, in the icon's own shape
///   雾蓝        夜幕        霜白         墨
/// ```
///
/// Equal columns [gap] apart, [padding] on every side; each icon is centred in
/// a square of [extent] (icon + ring room on every side), so choosing moves
/// nothing. Sits in a card (`SettingsSection`) or straight on a page.
class AppIconPicker extends ConsumerWidget {
  const AppIconPicker({super.key, this.padding = const EdgeInsets.all(16)});

  final EdgeInsetsGeometry padding;

  static const gap = 12.0;

  /// The ring round the chosen icon, and the space between it and the icon.
  static const ring = 2.0;
  static const ringGap = 3.0;

  /// Icons are at most this big (a launcher's own size), smaller in narrow columns.
  static const maxIcon = 56.0;

  /// Icon square to label.
  static const labelGap = 8.0;

  /// The icon's side in a column [width] wide.
  static double iconFor(double width) => math.min(maxIcon, width - 2 * (ring + ringGap));

  /// The square an icon of [icon] sits in, ring included.
  static double extent(double icon) => icon + 2 * (ring + ringGap);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appIconProvider).value;
    return Padding(
      padding: padding,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final column = (constraints.maxWidth - gap * (AppIcon.values.length - 1)) / AppIcon.values.length;
          final icon = iconFor(column);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final (i, choice) in AppIcon.values.indexed) ...[
                if (i > 0) const SizedBox(width: gap),
                Expanded(
                  child: _Option(
                    icon: choice,
                    size: icon,
                    mask: state?.mask,
                    selected: state?.current == choice,
                    onTap: state == null || state.current == choice
                        ? null
                        : () => unawaited(_select(context, ref, choice)),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  Future<void> _select(BuildContext context, WidgetRef ref, AppIcon icon) async {
    final l10n = context.l10n;
    final messenger = ScaffoldMessenger.maybeOf(context);
    final ok = await ref.read(appIconProvider.notifier).select(icon);
    if (ok) {
      messenger?.showBriefNotice(l10n.pluginsIconChanged);
    } else {
      messenger
        ?..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.pluginsIconChangeFailed)));
    }
  }
}

class _Option extends StatelessWidget {
  const _Option({
    required this.icon,
    required this.size,
    required this.mask,
    required this.selected,
    required this.onTap,
  });

  final AppIcon icon;
  final double size;
  final List<double>? mask;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final duration = AppMotion.of(context, AppMotion.quick);
    return Semantics(
      selected: selected,
      inMutuallyExclusiveGroup: true,
      child: Pressable(
        // Even the chosen one gives feedback; it just has nothing to do.
        onTap: onTap ?? () {},
        haptic: onTap != null,
        semanticLabel: icon.label,
        child: Column(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(end: selected ? 1 : 0),
              duration: duration,
              curve: AppMotion.std,
              builder: (context, t, child) => CustomPaint(
                key: ValueKey('app-icon-${icon.name}'),
                painter: _RingPainter(
                  mask: mask,
                  icon: size,
                  color: scheme.primary.withValues(alpha: t),
                ),
                child: child,
              ),
              child: SizedBox.square(
                dimension: AppIconPicker.extent(size),
                child: Center(
                  child: AppIconPreview(icon, size: size, mask: mask),
                ),
              ),
            ),
            const SizedBox(height: AppIconPicker.labelGap),
            AnimatedDefaultTextStyle(
              duration: duration,
              style: theme.textTheme.labelMedium!.copyWith(
                color: selected ? scheme.primary : scheme.onSurfaceVariant,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
              child: Text(icon.label, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}

/// The ring: the icon's own outline grown by [AppIconPicker.ringGap], centred
/// on the square the icon sits in.
class _RingPainter extends CustomPainter {
  const _RingPainter({required this.mask, required this.icon, required this.color});

  final List<double>? mask;
  final double icon;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (color.a == 0) return;
    final side = icon + 2 * AppIconPicker.ringGap + AppIconPicker.ring;
    final inset = (size.width - side) / 2;
    canvas.drawPath(
      launcherMaskPath(mask, side).shift(Offset(inset, (size.height - side) / 2)),
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = AppIconPicker.ring
        ..color = color,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.color != color || old.icon != icon || old.mask != mask;
}

/// How each launcher icon is drawn: one drawing for all four styles — the
/// Narwhal on a transparent background, exactly as
/// `res/mipmap-*/ic_launcher*_foreground.png` ships it. The four names stay
/// because each launcher entry is still a separate alias.
class AppIconArt {
  const AppIconArt._();

  /// The mark's body colour; the rest of the palette is `BrandGlyph`.
  Color get body => LauncherNarwhal.color;

  static AppIconArt of(AppIcon icon) => const AppIconArt._();
}

/// [icon] as the launcher shows it: [size] square, cut to [mask] (an outline
/// in 0…1, see [AppIconState.mask]; a rounded square when null). Its background
/// is transparent, so only the Narwhal is drawn — on whatever page colour is
/// behind it, as on the phone.
class AppIconPreview extends StatelessWidget {
  const AppIconPreview(this.icon, {super.key, this.size = AppIconPicker.maxIcon, this.mask});

  final AppIcon icon;
  final double size;
  final List<double>? mask;

  @override
  Widget build(BuildContext context) => CustomPaint(size: Size.square(size), painter: _IconPainter(icon, mask));
}

class _IconPainter extends CustomPainter {
  const _IconPainter(this.icon, this.mask);

  final AppIcon icon;
  final List<double>? mask;

  @override
  void paint(Canvas canvas, Size size) {
    canvas
      ..save()
      ..clipPath(launcherMaskPath(mask, size.width))
      // The visible 72 of the 108 grid, as on the launcher.
      ..scale(size.width / 72)
      ..translate(-18, -18);
    LauncherNarwhal.draw(canvas);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_IconPainter old) => old.icon != icon || old.mask != mask;
}

/// The launcher's icon shape at [side] × [side]: [mask] (a closed outline in
/// 0…1 from the system) or, without one, a rounded square.
Path launcherMaskPath(List<double>? mask, double side) {
  if (mask == null || mask.length < 6) {
    return RoundedSuperellipseBorder(borderRadius: BorderRadius.circular(side * 0.32))
        .getOuterPath(Rect.fromLTWH(0, 0, side, side));
  }
  final path = Path()..moveTo(mask[0] * side, mask[1] * side);
  for (var i = 2; i + 1 < mask.length; i += 2) {
    path.lineTo(mask[i] * side, mask[i + 1] * side);
  }
  return path..close();
}
