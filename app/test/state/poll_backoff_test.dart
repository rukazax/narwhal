// The poll schedule the app's fallback polls run on: a fixed base while
// something changes, doubling to a cap while nothing does, jittered down so
// two devices do not wake together, and back to the base on news.

import 'package:dsh_app/state/poll_backoff.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const base = Duration(seconds: 3);
  const cap = Duration(seconds: 15);

  group('steps', () {
    test('a round that changed nothing doubles the wait up to the cap', () {
      final backoff = PollBackoff(base: base, cap: cap, jitter: 0, seed: 1);
      expect(backoff.delay, base);
      expect(backoff.take(), base);
      expect(backoff.take(), const Duration(seconds: 6));
      expect(backoff.take(), const Duration(seconds: 12));
      expect(backoff.take(), cap);
      // Whatever happens next, the cap holds.
      for (var i = 0; i < 20; i++) {
        expect(backoff.take(), cap);
      }
      expect(backoff.atCap, isTrue);
    });

    test('a change starts the schedule over', () {
      final backoff = PollBackoff(base: base, cap: cap, jitter: 0, seed: 1);
      backoff.take();
      backoff.take();
      expect(backoff.delay, const Duration(seconds: 12));
      backoff.reset();
      expect(backoff.delay, base);
      expect(backoff.rounds, 0);
      expect(backoff.take(), base);
      expect(backoff.rounds, 1);
    });

    test('a base at the cap never grows', () {
      final backoff = PollBackoff(base: cap, cap: cap, jitter: 0, seed: 1);
      expect(backoff.take(), cap);
      expect(backoff.take(), cap);
      expect(backoff.atCap, isTrue);
    });
  });

  group('jitter', () {
    test('a jittered wait is never longer than the cap and never shorter than 80 % of it', () {
      final backoff = PollBackoff(base: base, cap: cap, seed: 7);
      final seen = <Duration>{};
      for (var i = 0; i < 200; i++) {
        backoff.reset();
        final wait = backoff.take();
        expect(wait, lessThanOrEqualTo(base));
        expect(wait, greaterThanOrEqualTo(const Duration(milliseconds: 2400)));
        seen.add(wait);
      }
      // The point of the jitter: not one constant delay for every device.
      expect(seen.length, greaterThan(1));
    });

    test('the jitter is reproducible from the seed', () {
      List<Duration> run() {
        final backoff = PollBackoff(base: base, cap: cap, seed: 42);
        return [for (var i = 0; i < 6; i++) backoff.take()];
      }

      expect(run(), run());
    });

    test('no jitter returns the schedule exactly', () {
      final backoff = PollBackoff(base: base, cap: cap, jitter: 0, seed: 3);
      expect([for (var i = 0; i < 4; i++) backoff.take()], [
        base,
        const Duration(seconds: 6),
        const Duration(seconds: 12),
        cap,
      ]);
    });
  });
}
