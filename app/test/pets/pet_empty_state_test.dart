// 桌宠 with no mascot pack in the build (this fork ships none: the art is the
// upstream project's and is not AGPL, see ASSETS.md). Nothing here reads
// assets/pets/: the point is that a build without them still works —
//
// * a pack id stored by an upstream install is dropped on load, not an error;
// * 宠物设置 shows the picker's empty state: the 不显示 cell alone, in the
//   three-column grid, with no mascot names and no 来自 DSH-TUI note;
// * a pet that is chosen but absent from the build draws nothing on the chat
//   page, throws nothing, and leaves the composer alone.

import 'package:dsh_app/pets/pet_mood.dart';
import 'package:dsh_app/pets/pet_prefs.dart';
import 'package:dsh_app/pets/pet_signals.dart';
import 'package:dsh_app/pets/pet_state.dart';
import 'package:dsh_app/ui/chat/composer.dart';
import 'package:dsh_app/ui/pets/pet_picker.dart';
import 'package:dsh_app/ui/pets/pet_settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support.dart';

/// Waits for [PetPrefsController] to read its values (no fake clock here).
Future<void> prefsLoaded(ProviderContainer container) async {
  for (var i = 0; i < 200 && !container.read(petPrefsProvider).loaded; i++) {
    await Future<void>.delayed(const Duration(milliseconds: 5));
  }
  expect(container.read(petPrefsProvider).loaded, isTrue, reason: 'preferences never loaded');
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a pack stored by an upstream install is dropped on load, not an error', () async {
    SharedPreferences.setMockInitialValues({'pet.pack': 'deepy-whale'});
    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(petPrefsProvider);
    await prefsLoaded(container);

    expect(container.read(petPrefsProvider).packId, noPetId, reason: 'mascot packs are not part of this fork');
    expect(container.read(petPrefsProvider).enabled, isFalse);
    expect(container.read(petPrefsProvider).packExplicit, isFalse);
    expect(container.read(currentPetPackProvider), isNull);
  });

  test('nothing shipped: the default is 不显示, whatever the device defaults say', () async {
    expect(builtInPets, isEmpty);
    expect(defaultPetId, noPetId);
    expect(PetPicker.choices, [noPetId]);
  });

  group('宠物设置 without packs', () {
    Future<void> open(WidgetTester tester, {Brightness brightness = Brightness.light}) async {
      usePhoneView(tester);
      await tester.pumpWidget(
        testApp(
          const PetSettingsPage(),
          brightness: brightness,
          overrides: [petPrefsProvider.overrideWith(() => FixedPetPrefs(const PetPrefs(loaded: true)))],
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
    }

    for (final brightness in Brightness.values) {
      testWidgets('the empty state (${brightness.name}): one 不显示 cell, no mascots', (tester) async {
        await open(tester, brightness: brightness);

        expect(tester.takeException(), isNull);
        expect(find.text('不显示'), findsOneWidget);
        expect(find.text('Deepy 小鲸鱼'), findsNothing);
        expect(find.text('鲸娘'), findsNothing);
        // The note described the upstream mascots; with none in the build it is gone.
        expect(find.text('来自 DSH-TUI'), findsNothing);

        // One cell of the picker's three-column row, not a full-width square.
        expect(find.byType(PetPreview), findsOneWidget);
        final row = tester.getRect(find.byKey(const ValueKey('pet-picker-row')));
        final cell = tester.getRect(find.byType(PetPreview));
        expect(cell.width, moreOrLessEquals((row.width - PetPicker.gap * (PetPicker.columns - 1)) / PetPicker.columns, epsilon: 0.5));
        expect(cell.width, lessThan(row.width / 2));
      });
    }

    testWidgets('picking 不显示 is the only choice and leaves the pet off', (tester) async {
      await open(tester);
      final container = ProviderScope.containerOf(tester.element(find.byType(PetSettingsPage)));
      await tester.tap(find.text('不显示'));
      await tester.pump();
      expect(container.read(petPrefsProvider).packId, noPetId);
      expect(container.read(petPrefsProvider).packExplicit, isTrue);
      // Nothing to size or quiet down: the rest of the page stays folded away.
      expect(find.text('安静模式'), findsNothing);
    });
  });

  testWidgets('a chosen pack that is not in the build draws no pet and throws nothing', (tester) async {
    usePhoneView(tester);
    final clock = TestClock();
    await tester.pumpWidget(
      testApp(
        const ChatBottomHarness(),
        overrides: [
          petClockProvider.overrideWithValue(clock.call),
          petPrefsProvider.overrideWith(
            () => FixedPetPrefs(const PetPrefs(packId: 'deepy-whale', loaded: true)),
          ),
          testSignalsProvider.overrideWith(() => TestSignals(PetSignals(lastInteraction: clock.now))),
          // As the app's own signals do (support.dart's petOverrides): the
          // other providers stay out of the real host/session state.
          petSignalsProvider.overrideWith((ref) {
            final s = ref.watch(testSignalsProvider);
            final touched = ref.watch(petInteractionProvider);
            return PetSignals(
              focus: s.focus,
              viewed: s.viewed,
              runs: s.runs,
              pending: s.pending,
              carrying: s.carrying,
              quiet: s.quiet,
              lastInteraction: touched.isAfter(s.lastInteraction) ? touched : s.lastInteraction,
            );
          }),
        ],
      ),
    );
    for (var i = 0; i < 4; i++) {
      await tester.pump();
    }
    await tester.pump(const Duration(milliseconds: 300));

    expect(tester.takeException(), isNull, reason: 'a missing pack is a state, not a crash');
    expect(find.byKey(const ValueKey('pet-body')), findsNothing);
    expect(find.byType(Composer), findsOneWidget);
  });
}
