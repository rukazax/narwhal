// The one import for UI text: `import '../../l10n/l10n.dart';`
//
//  - In widgets: `context.l10n.chatComposerHint`.
//  - Without a BuildContext (state, services, error mapping): `appL10n.xxx`,
//    which always follows the language the app is showing.
//
// Strings live in lib/l10n/parts/<area>_{zh,en,ru}.arb; tool/l10n_merge.py
// merges them and regenerates lib/l10n/gen/.

import 'package:flutter/widgets.dart';

import 'gen/app_localizations.dart';

export 'gen/app_localizations.dart';

/// The language the app shows: what [AppLocale.resolve] picked from the
/// user's choice and the system languages.
abstract final class AppLocale {
  static const zhCN = Locale('zh', 'CN');
  static const en = Locale('en');
  static const ru = Locale('ru');

  /// Locales MaterialApp offers. zh_CN (not bare zh) keeps CJK glyphs
  /// Chinese on non-Chinese systems (typography.dart「汉字字形」).
  static const supported = [zhCN, en, ru];

  static Locale _locale = zhCN;
  static L10n _l10n = lookupL10n(zhCN);

  /// The locale in use (zh_CN until the app resolves one; tests keep it).
  static Locale get current => _locale;

  static bool get isEnglish => _locale.languageCode == 'en';

  /// True when the UI is Chinese. Russian and English share the Latin data
  /// tables: plugin titles, pet names, number units and media service names.
  static bool get isChinese => _locale.languageCode == 'zh';

  static L10n get l10n => _l10n;

  /// Switches [appL10n] to [locale] (zh_CN, en or ru).
  static void use(Locale locale) {
    final next = switch (locale.languageCode) {
      'en' => en,
      'ru' => ru,
      _ => zhCN,
    };
    if (next == _locale) return;
    _locale = next;
    _l10n = lookupL10n(next);
  }

  /// Chinese for any Chinese system language, Russian for Russian, English for
  /// everything else.
  static Locale resolve(Locale? chosen, List<Locale>? system) {
    if (chosen != null) {
      return switch (chosen.languageCode) {
        'en' => en,
        'ru' => ru,
        _ => zhCN,
      };
    }
    for (final l in system ?? const <Locale>[]) {
      if (l.languageCode == 'zh') return zhCN;
      if (l.languageCode == 'ru') return ru;
      if (l.languageCode == 'en') return en;
    }
    return (system == null || system.isEmpty) ? zhCN : en;
  }
}

/// UI text for code without a BuildContext. Follows the app language.
L10n get appL10n => AppLocale.l10n;

extension L10nContext on BuildContext {
  /// UI text in the app language. Falls back to [appL10n] where the tree has
  /// no L10n delegate (bare MaterialApps in tests).
  L10n get l10n => Localizations.of<L10n>(this, L10n) ?? AppLocale.l10n;
}

extension L10nFormat on L10n {
  /// 「3月5日」/「Mar 5」.
  String monthDay(DateTime d) => commonMonthDay('${d.month}', d.day);
}
