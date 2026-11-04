import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' show AppLifecycleState, WidgetsBinding;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Brings dsh-go back over a browser sign-in (a Custom Tab on top of its
/// task) once the engine holds the login: the provider's own success page
/// never returns to the app by itself. A no-op without the native side.
final appForegroundProvider = Provider<Future<void> Function()>(
  (ref) => () async {
    try {
      await const MethodChannel('dsh/app').invokeMethod<void>('bringToFront');
    } catch (_) {
      // Tests and hosts without the activity channel.
    }
  },
);

/// Whether this app is the one the person is looking at, as far as polling
/// loops care: [AppLifecycleState.paused] (background), `hidden` and `detached`
/// are not, `resumed` and `inactive` (a system dialog, the shade pulled down)
/// are.
///
/// An unknown lifecycle — no binding yet, a pure unit test, a background
/// isolate — counts as in front: work pauses only on proof that it should.
bool appInForeground() {
  AppLifecycleState? state;
  try {
    state = WidgetsBinding.instance.lifecycleState;
  } catch (_) {
    return true;
  }
  return switch (state) {
    null || AppLifecycleState.resumed || AppLifecycleState.inactive => true,
    AppLifecycleState.paused || AppLifecycleState.hidden || AppLifecycleState.detached => false,
  };
}
