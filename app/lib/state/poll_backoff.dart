import 'dart:math';

/// The delay schedule of a polling loop: start at [base], [factor] times longer
/// after every round that found nothing new, never longer than [cap], and back
/// to [base] as soon as something did change.
///
/// Every delay is jittered *down* by up to [jitter] of itself, so two devices
/// that started together do not wake together, and so a delay never runs past
/// [cap]. Plain Dart (no timers, no binding): the schedule is unit-tested, the
/// caller owns the `Timer`.
class PollBackoff {
  PollBackoff({
    required this.base,
    required this.cap,
    this.factor = 2,
    this.jitter = 0.2,
    int? seed,
  }) : assert(base > Duration.zero, 'a zero base would poll without pause'),
       assert(cap >= base, 'the cap is never reached below the base'),
       assert(factor >= 1),
       assert(jitter >= 0 && jitter < 1, 'jitter is a fraction of the delay'),
       _random = Random(seed),
       _delay = base;

  /// The delay of the first round.
  final Duration base;

  /// The longest delay the schedule reaches.
  final Duration cap;
  final int factor;

  /// How much of a delay may be cut off, 0.2 = down to 80 % of it.
  final double jitter;

  final Random _random;
  Duration _delay;
  int _rounds = 0;

  /// Rounds taken since the last [reset]: 0 before the first [take].
  int get rounds => _rounds;

  /// The delay before jitter that the next [take] starts from.
  Duration get delay => _delay;

  /// The schedule is at [cap] and stays there until [reset].
  bool get atCap => _delay >= cap;

  /// The delay before the next round, and the schedule's next step.
  Duration take() {
    final delay = _jittered();
    if (_delay < cap) {
      final next = _delay * factor;
      _delay = next > cap ? cap : next;
    }
    _rounds++;
    return delay;
  }

  /// Back to [base]: something changed, so look again soon.
  void reset() {
    _delay = base;
    _rounds = 0;
  }

  Duration _jittered() {
    final micros = _delay.inMicroseconds;
    if (jitter <= 0 || micros <= 1) return _delay;
    final least = (micros * (1 - jitter)).round().clamp(1, micros);
    final cut = micros - least;
    return Duration(microseconds: cut <= 0 ? micros : least + _random.nextInt(cut));
  }
}
