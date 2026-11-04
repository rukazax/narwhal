// The weekly check of this fork's own releases (lib/update/self_release.dart),
// mounted once in the home shell. Draws nothing.
//
// A launch whose last answer is older than a week waits for a moment in the
// next half hour — drawn once and kept in SharedPreferences — and checks then,
// while the app is in front. Going to the background cancels the wait: no
// worker, nothing runs behind the person's back.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/self_release_state.dart';
import '../../update/self_release.dart';

class SelfReleaseHost extends ConsumerStatefulWidget {
  const SelfReleaseHost({super.key});

  @override
  ConsumerState<SelfReleaseHost> createState() => _SelfReleaseHostState();
}

class _SelfReleaseHostState extends ConsumerState<SelfReleaseHost> {
  Timer? _timer;
  late final AppLifecycleListener _lifecycle;
  bool _planning = false;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(onResume: () => unawaited(_plan()), onPause: _cancel);
    unawaited(_plan());
  }

  @override
  void dispose() {
    _cancel();
    _lifecycle.dispose();
    super.dispose();
  }

  void _cancel() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _plan() async {
    if (_planning || !ref.read(selfReleaseRowProvider)) return;
    _planning = true;
    try {
      final wait = await ref.read(selfReleaseProvider.notifier).planAutoCheck();
      if (!mounted) return;
      _cancel();
      if (wait == null) return;
      _timer = Timer(wait, () => unawaited(_run()));
    } finally {
      _planning = false;
    }
  }

  Future<void> _run() async {
    _timer = null;
    if (!mounted) return;
    await ref.read(selfReleaseProvider.notifier).runAutoCheck();
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
