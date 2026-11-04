import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../update/self_release.dart';
import '../update/version.dart';
import 'app_info.dart';

/// What About shows of this fork's releases (lib/update/self_release.dart):
/// the last answer, the running build it is compared to, and whether a check
/// is under way. The weekly schedule and the cache live in the checker.
class SelfReleaseState {
  const SelfReleaseState({
    required this.current,
    this.installedLabel = '',
    this.loaded = false,
    this.checking = false,
    this.release,
    this.failure,
  });

  /// The running build ([AppInfo.version]).
  final SelfReleaseVersion current;

  /// The running build as the row shows it: `1.0.0-narwhal`.
  final String installedLabel;

  /// The cached answer was read (nothing automatic runs before that).
  final bool loaded;
  final bool checking;

  /// The latest release; null until an answer arrives.
  final SelfRelease? release;

  /// Why the last check couldn't answer; null when it did.
  final SelfReleaseFailure? failure;

  /// A release newer than [current] is out.
  bool get hasUpdate => release?.isNewerThan(current) ?? false;

  SelfReleaseState copyWith({
    bool? loaded,
    bool? checking,
    SelfRelease? Function()? release,
    SelfReleaseFailure? Function()? failure,
  }) => SelfReleaseState(
    current: current,
    installedLabel: installedLabel,
    loaded: loaded ?? this.loaded,
    checking: checking ?? this.checking,
    release: release == null ? this.release : release(),
    failure: failure == null ? this.failure : failure(),
  );
}

class SelfReleaseController extends Notifier<SelfReleaseState> {
  late Future<void> _loading;

  @override
  SelfReleaseState build() {
    _loading = _load();
    return SelfReleaseState(
      current: SelfReleaseVersion.tryParse(AppInfo.version) ?? const SelfReleaseVersion(AppVersion(0, 0, 0)),
      installedLabel: AppInfo.version.split('+').first,
    );
  }

  /// Completes once the cached answer has been read.
  Future<void> get ready => _loading;

  SelfReleaseChecker get _checker => ref.read(selfReleaseCheckerProvider);

  Future<void> _load() async {
    try {
      final cached = await _checker.readCache();
      if (!ref.mounted) return;
      state = state.copyWith(loaded: true, release: () => cached);
    } on Object {
      // No preferences (widget tests that didn't set them up): nothing cached.
      if (ref.mounted) state = state.copyWith(loaded: true);
    }
  }

  /// How long the shell should wait before the automatic check; null when none
  /// is owed this week.
  Future<Duration?> planAutoCheck() => _checker.planAutoCheck();

  /// Runs the planned check if its moment has arrived.
  Future<void> runAutoCheck() async {
    await ready;
    if (!ref.mounted || state.checking) return;
    state = state.copyWith(checking: true);
    final check = await _checker.runAutoCheck();
    if (!ref.mounted) return;
    if (check == null) {
      state = state.copyWith(checking: false);
      return;
    }
    state = state.copyWith(
      loaded: true,
      checking: false,
      release: () => check.release ?? state.release,
      failure: () => check.failure,
    );
  }

  /// 「Проверить」: whenever the person asks, ignoring the weekly window.
  Future<void> check() async {
    await ready;
    if (!ref.mounted || state.checking) return;
    state = state.copyWith(checking: true, failure: () => null);
    final check = await _checker.check(force: true);
    if (!ref.mounted) return;
    state = state.copyWith(
      loaded: true,
      checking: false,
      release: () => check.release ?? state.release,
      failure: () => check.failure,
    );
  }
}

final selfReleaseProvider = NotifierProvider<SelfReleaseController, SelfReleaseState>(SelfReleaseController.new);
