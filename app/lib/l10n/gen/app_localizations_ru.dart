// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

  @override
  String get a11yRestoreTitle => 'Автоматически восстанавливать спец. возможности';

  @override
  String get searchKwA11yRestore =>
      'спец. возможности,восстановление,переподключение,автовосстановление,разрешение,ADB,Shizuku,Sui,root';

  @override
  String get a11yRestoreNeedsGrant => 'Требуется авторизация';

  @override
  String get a11yRestoreNotice =>
      'После авторизации спец. возможности будут включены снова, если их отключат в настройках системы. Чтобы прекратить управление телефоном, отключите их в DSH Go.';

  @override
  String get a11yRestoreForceStop => 'После принудительной остановки откройте DSH Go, чтобы восстановить службу.';

  @override
  String get a11yRestoreGrant => 'Авторизовать и включить';

  @override
  String get a11yRestoreGrantShizuku => 'Выдать через Shizuku';

  @override
  String get a11yRestoreGrantShizukuPermission => 'Авторизуйте Shizuku, затем выдайте';

  @override
  String get a11yRestoreGrantAdb => 'Выдать через прямой ADB';

  @override
  String get a11yRestoreRootNote => 'Использует авторизованное root-подключение только для этого разрешения.';

  @override
  String get a11yRestoreSetup => 'Настройте Shizuku или отладку по Wi-Fi';

  @override
  String get a11yRestoreWaiting => 'Разрешите запрос в Shizuku';

  @override
  String get a11yRestoreWaitingSui => 'Разрешите запрос в Sui';

  @override
  String get a11yRestoreComputer => 'Или подключитесь к компьютеру и выполните один раз:';

  @override
  String get a11yRestoreCopy => 'Копировать команду';

  @override
  String get a11yRestoreCopied => 'Команда скопирована';

  @override
  String get accessPickTitle => 'С чем должен помогать DSH Go?';

  @override
  String get accessPickMessage => 'Выберите любое, затем включите каждое';

  @override
  String get accessPickConfirm => 'Включить выбранное';

  @override
  String get accessSkip => 'Пропустить';

  @override
  String get accessFeatureFiles => 'Читать и записывать файлы телефона';

  @override
  String get accessFeatureFilesNeeds => 'Нужен доступ к файлам';

  @override
  String get accessFeaturePet => 'Питомец поверх других приложений';

  @override
  String get accessFeaturePetNeeds => 'Нужно отображение поверх других приложений';

  @override
  String get accessFeaturePhone => 'Управление телефоном';

  @override
  String get accessFeaturePhoneNeeds => 'Нужны спец. возможности и уведомления';

  @override
  String get accessFeatureBackground => 'Работать в фоне';

  @override
  String get accessFeatureBackgroundNeeds => 'Сообщает о завершении задач; нужны уведомления и фоновый доступ';

  @override
  String get accessFeatureVoice => 'Голосовой ввод';

  @override
  String get accessFeatureVoiceNeeds => 'Нужен микрофон';

  @override
  String accessVoiceModel(int size) {
    return 'Работает офлайн; скачает голосовую модель примерно на $size МБ';
  }

  @override
  String get accessVoiceMetered => 'Вы в мобильной сети; загрузка пойдёт через неё';

  @override
  String get accessFilesRiskBody => 'ИИ сможет читать и изменять ваши фото, загрузки и документы.';

  @override
  String accessStepCount(int index, int total) {
    return '$index / $total';
  }

  @override
  String get accessTurnOn => 'Включить';

  @override
  String get accessOpenSettings => 'Открыть настройки';

  @override
  String get accessItsSet => 'Готово';

  @override
  String get accessOpenAgain => 'Открыть снова';

  @override
  String get accessIsOn => 'Вкл.';

  @override
  String get accessNotOnYet => 'Ещё не включено';

  @override
  String get accessDidYouSet => 'Вы включили это там?';

  @override
  String accessWhere(String path) {
    return 'Где: $path';
  }

  @override
  String get accessOpenFailed => 'Не удалось открыть системные настройки';

  @override
  String get accessMicTitle => 'Разрешите микрофон';

  @override
  String get accessMicWhy => 'Для голосового ввода';

  @override
  String get accessStorageTitle => 'Разрешите доступ к файлам';

  @override
  String get accessStorageWhy => 'Позволяет ИИ читать и записывать фото, загрузки и документы';

  @override
  String get accessNotifyTitle => 'Разрешите уведомления';

  @override
  String get accessNotifyWhy => 'Сообщает, когда задача завершилась или нужна ваша помощь';

  @override
  String get accessBatteryTitle => 'Разрешите работу в фоне';

  @override
  String get accessBatteryWhy => 'Задачи продолжаются, когда вы переключаете приложения';

  @override
  String get accessVendorBackgroundWhy => 'Не даёт системе обрывать задачи в фоне';

  @override
  String get accessAutostartTitle => 'Разрешите автозапуск';

  @override
  String get accessAutostartWhy => 'Позволяет DSH Go вернуться, когда система его выгрузит';

  @override
  String accessVivoAutostartPath(String app) {
    return 'Управление разрешениями › Автозапуск › $app';
  }

  @override
  String accessXiaomiAutostartPath(String app) {
    return 'Управление приложениями › $app › Автозапуск';
  }

  @override
  String get accessA11yTitle => 'Включите спец. возможности';

  @override
  String get accessA11yWhy => 'Управление телефоном читает экран и нажимает элементы';

  @override
  String get accessPopupTitle => 'Разрешите всплывающие окна в фоне';

  @override
  String get accessPopupWhy => 'Возвращает вас в DSH Go, когда управление телефоном закончено';

  @override
  String accessVivoPopupPath(String app) {
    return 'Управление разрешениями › $app › Всплывающие окна в фоне';
  }

  @override
  String accessXiaomiPopupPath(String app) {
    return 'Управление приложениями › $app › Другие разрешения › Всплывающие окна при работе в фоне';
  }

  @override
  String get accessOverlayTitle => 'Разрешите отображение поверх других приложений';

  @override
  String get accessOverlayWhy => 'Позволяет питомцу появляться поверх других приложений';

  @override
  String get accessOverlayGreyed => 'Переключатель серый?';

  @override
  String get accessRestrictedTitle => 'Сначала разрешите ограниченные настройки';

  @override
  String get accessRestrictedTap =>
      'В разделе «Спец. возможности» нажмите «DSH Phone Control»; когда появится «Ограниченная настройка», нажмите ОК';

  @override
  String get accessRestrictedMenu =>
      'В разделе «О приложении» нажмите три точки справа вверху и выберите «Разрешить ограниченные настройки»';

  @override
  String get accessRestrictedAdvanced =>
      'В разделе «О приложении» откройте «Дополнительные настройки» и включите «Разрешить ограниченные настройки»';

  @override
  String get accessRestrictedBack => 'Вернитесь в «Спец. возможности» и включите «DSH Phone Control»';

  @override
  String get accessRestrictedHelp => 'Как это сделать';

  @override
  String get accessOpenA11y => 'Открыть спец. возможности';

  @override
  String get accessOpenAppInfo => 'Открыть сведения о приложении';

  @override
  String get accessStateOn => 'Вкл.';

  @override
  String get accessStateOff => 'Выкл.';

  @override
  String get accessStateVisited => 'Открыто';

  @override
  String get accessStateUnknown => 'Настроить';

  @override
  String get accessSummaryAllSet => 'Всё готово';

  @override
  String accessSummaryLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Осталось включить: $count',
      many: 'Осталось включить: $count',
      few: 'Осталось включить: $count',
      one: 'Осталось включить: $count',
    );
    return '$_temp0';
  }

  @override
  String get accessSummaryMessage =>
      'Остальное можно включить в любое время в Настройки › Общие › Системные разрешения';

  @override
  String get accessFinishFailed => 'Не удалось завершить настройку';

  @override
  String accessVoiceDownload(int size) {
    return 'Голосовая модель (около $size МБ) начнёт скачиваться, когда движок будет готов. Следите за этим в Настройки › Общие › Голосовой ввод.';
  }

  @override
  String get accessPageTitle => 'Системные разрешения';

  @override
  String get accessPageSubtitle => 'Что нужно каждой функции от Android';

  @override
  String get activityThinkingUntangle => 'Хм… сейчас разберусь';

  @override
  String get activityThinkingWorkThrough => 'Давайте разберёмся';

  @override
  String get activityThinkingGears => 'Шестерёнки в голове крутятся';

  @override
  String get activityThinkingSecond => 'Секунду';

  @override
  String get activityThinkingSmoking => 'Мозг работает сверхурочно';

  @override
  String get activityThinkingOnIt => 'Думаю, думаю';

  @override
  String get activityThinkingNoRush => 'По одной мысли за раз';

  @override
  String get activityThinkingPonder => 'Дай-ка подумать';

  @override
  String get activityThinkingLogic => 'Разбираю логику';

  @override
  String get activityThinkingBrain => 'Включаю мозг';

  @override
  String get activityThinkingSort => 'Сейчас разберусь';

  @override
  String get activityThinkingMemory => 'Роюсь в памяти';

  @override
  String get activityThinkingStorm => 'Мозговой штурм';

  @override
  String get activityThinkingSavor => 'Хм… дайте осмыслить';

  @override
  String get activityThinkingMoment => 'Минуту, думаю';

  @override
  String get activityThinkingHeadScratch => 'Чешу затылок…';

  @override
  String get activityThinkingPlayOut => 'Посмотрим, куда это приведёт';

  @override
  String get activityThinkingLoading => 'Мысли загружаются';

  @override
  String get activityThinkingMulling => 'Обдумываю';

  @override
  String get activityThinkingBreakDown => 'Хм… разложу по полочкам';

  @override
  String get activityThinkingTrain => 'Поезд мысли отправляется';

  @override
  String get activityThinkingSomething => 'Хм… тут что-то есть';

  @override
  String get activityThinkingJog => 'Разомну идею';

  @override
  String get activityThinkingPicture => 'Стоп, я это вижу';

  @override
  String get activityThinkingBubbles => 'Пузыри мыслей';

  @override
  String get activityThinkingWaves => 'Волны мозга на подходе';

  @override
  String get activityThinkingCoffee => 'Мозг варит кофе';

  @override
  String get activityThinkingDraft => 'Набрасываю в голове';

  @override
  String get activityThinkingComing => 'Ага, вспоминаю';

  @override
  String get activityThinkingBubbling => 'Идеи поднимаются';

  @override
  String get activityThinkingTackle => 'Хм… берёмся';

  @override
  String get activityThinkingSpark => 'Проблеск идеи';

  @override
  String get activityThinkingLogicFirst => 'Сначала разберём логику';

  @override
  String get activityThinkingLocate => 'Уточняю';

  @override
  String get activityThinkingInvestigate => 'Разбираюсь';

  @override
  String get activityThinkingGif => 'thinking.gif';

  @override
  String get activityThinkingLook => 'Дай-ка взгляну';

  @override
  String get activityThinkingInteresting => 'Хм… интересно';

  @override
  String get activityThinkingHands => 'Разогреваю мозг';

  @override
  String get activityThinkingFiveMinutes => 'Пять минут. Задача нешуточная';

  @override
  String get activityThinkingSerious => 'Пора за дело';

  @override
  String get activityThinkingTricky => 'Тут немного сложно';

  @override
  String get activityThinkingAscend => 'Выхожу на новый уровень';

  @override
  String get activityThinkingAlmostPromise => 'Почти готово, обещаю';

  @override
  String get activityThinkingLongWay => 'Пошёл в обход';

  @override
  String get activityThinkingWrapping => 'Завершаю';

  @override
  String get activityThinkingSong => 'Дайте время одной песни';

  @override
  String get activityThinkingBigMove => 'Готовлю главный ход';

  @override
  String get activityThinkingSimple => 'Простой запрос. Или нет?';

  @override
  String get activityThinkingOneMinute => 'Минута, ещё думаю';

  @override
  String get activityThinkingChallenge => 'Вот это вызов';

  @override
  String get activityThinkingDig => 'Копну поглубже';

  @override
  String get activityThinkingNotSimple => 'Тут не всё так просто';

  @override
  String get activityThinkingDeep => 'Ухожу в глубину';

  @override
  String get activityThinkingBurning => 'Нейроны вовсю работают';

  @override
  String get activityThinkingNearlyClear => 'Почти разобрался';

  @override
  String get activityThinkingTwisty => 'Тут есть загогулина…';

  @override
  String get activityThinkingWorkout => 'Тренирую мозг…';

  @override
  String get activityThinkingStay => 'Ещё чуть-чуть, почти';

  @override
  String get activityThinkingCloser => 'Дай-ка продумать';

  @override
  String get activityThinkingThirtySeconds => 'Тридцать секунд, ещё в процессе';

  @override
  String get activityThinkingSoon => 'Потерпите, почти';

  @override
  String get activityThinkingAnotherPass => 'Прогоню ещё раз';

  @override
  String get activityThinkingTrack => 'Всё по плану';

  @override
  String get activityThinkingLead => 'Дело движется';

  @override
  String get activityThinkingCircles => 'Хожу по кругу…';

  @override
  String get activityThinkingAnyMoment => 'Ещё мгновение';

  @override
  String get activityThinkingStillLocate => 'Всё ещё сужаю круг';

  @override
  String get activityWaitingCall => 'Вызываю модель…';

  @override
  String get activityWaitingOnWay => 'Модель уже в пути';

  @override
  String get activityWaitingSpeak => 'Жду хоть слова…';

  @override
  String get activityWaitingWords => 'Подбираю слова';

  @override
  String get activityWaitingAwake => 'Модель уже проснулась?';

  @override
  String get activityWaitingStretch => 'Даю ей размяться';

  @override
  String get activityWaitingYawn => 'Модель зевнула';

  @override
  String get activityWaitingComing => 'Модель: уже иду';

  @override
  String get activityWaitingText => 'Жду первых слов';

  @override
  String get activityWaitingQueue => 'Всё ещё в очереди';

  @override
  String get activityWaitingBrew => 'Что-то заваривается';

  @override
  String get activityWaitingWater => 'Модель отпивает воды';

  @override
  String get activityWaitingWarmup => 'Даю ей прогреться';

  @override
  String get activityWaitingMeditate => 'Модель медитирует';

  @override
  String get activityWaitingBlink => 'Жду, когда моргнёт';

  @override
  String get activityWaitingMoment => 'Говорит: «минуту»';

  @override
  String get activityWritingWords => 'Подбираю слова';

  @override
  String get activityWritingTyping => 'Печатаю';

  @override
  String get activityWritingInspired => 'Слова льются волшебно';

  @override
  String get activityWritingOnIt => 'Пишу, пишу';

  @override
  String get activityWritingCareful => 'Взвешиваю каждое слово';

  @override
  String get activityWritingFlow => 'Всё на одном дыхании';

  @override
  String get activityWritingPlain => 'Говорю простыми словами';

  @override
  String get activityWritingIdeas => 'Облекаю мысли в слова';

  @override
  String get activityWritingKeys => 'Стучу по клавишам';

  @override
  String get activityWritingAlmost => 'Почти дописал';

  @override
  String get activityWritingTell => 'Сейчас расскажу';

  @override
  String get activityWritingFast => 'Пишу как заведённый';

  @override
  String get activityWritingBreeze => 'Слова летят на страницу';

  @override
  String get activityWritingFormat => 'Привожу вёрстку в порядок';

  @override
  String get activityNightAscend => 'Преодолеваю время сна…';

  @override
  String get activityNightHello => 'Ночной привет';

  @override
  String get activityNightOwl => 'Тоже сова?';

  @override
  String get activityNightMoon => 'Встала луна — и я не сплю';

  @override
  String get activityNightSlow => 'Ночной мозг, полегче';

  @override
  String get activityNightChampion => 'Чемпион ночной смены на связи';

  @override
  String get activityNightSleepy => 'Спать хочется, но я справлюсь';

  @override
  String get activityNightMidnight => 'Работаю и после полуночи';

  @override
  String get activityNightOpen => 'Открыт для ночной смены';

  @override
  String get activityNightStars => 'Даже звёзды уснули';

  @override
  String get activityNightDawn => 'Думаю до глубокой ночи';

  @override
  String get activityWeekendChill => 'Немного выходного уюта';

  @override
  String get activityWeekendHere => 'На месте и на выходных!';

  @override
  String get activityWeekendCompany => 'На связи и в выходные';

  @override
  String get activityWeekendOnline => 'В выходные не выключаюсь';

  @override
  String get activityWeekendSneak => 'Тихо думаю в выходные';

  @override
  String get activityWeekendWorking => 'Тоже работаете в выходные?';

  @override
  String get activityWeekendMode => 'Режим выходных включён';

  @override
  String get activityWeekendBugs => 'Выходное исправление багов';

  @override
  String get activityWeekendSkin => 'Выходной облик';

  @override
  String get activityNewYearCheers => 'С Новым годом!';

  @override
  String get activityNewYearDay => 'С Новым годом';

  @override
  String get activityNewYearBugs => 'Новый год — новые баги';

  @override
  String get activityNewYearFirstLine => 'Первая строка кода в году';

  @override
  String get activityNewYearWork => 'За хороший старт';

  @override
  String get activityValentineCode => 'Пишу код и в День святого Валентина';

  @override
  String get activityValentineLove => 'Код — настоящая любовь';

  @override
  String get activityValentineDate => 'Свидания сегодня нет?';

  @override
  String get activityValentineKeyboard => 'Клавиатура — мои розы';

  @override
  String get activityPiDay => 'С Днём числа π';

  @override
  String get activityPiCircle => 'Сегодня особенно круглые круги';

  @override
  String get activityAprilFools => 'С 1 апреля';

  @override
  String get activityAprilBug => 'Этот баг ведь розыгрыш?';

  @override
  String get activityAprilErrors => 'Осторожно, ошибки-розыгрыши';

  @override
  String get activityAprilKidding => 'Шутка, ошибок нет';

  @override
  String get activityLaborWorking => 'Работаю и в Праздник труда';

  @override
  String get activityLaborPride => 'Немного гордости за работу';

  @override
  String get activityLaborSpirit => 'Режим трудяги: по полной';

  @override
  String get activityChildrenDay => 'С Днём защиты детей';

  @override
  String get activityChildrenHeart => 'В душе мы все дети';

  @override
  String get activityChildrenCode => 'Сегодня только милый код';

  @override
  String get activityProgrammerCheers => 'С Днём программиста, 1024';

  @override
  String get activityProgrammerDay => 'Сегодня День программиста';

  @override
  String get activityProgrammer1024 => '1024 — с днём кода';

  @override
  String get activityProgrammerCode => 'Пишу код и в наш праздник';

  @override
  String get activityHalloween => 'С Хэллоуином';

  @override
  String get activityHalloweenTreat => 'Сладость или гадость';

  @override
  String get activityHalloweenCode => 'Код тоже бывает жутким';

  @override
  String get activityChristmasEve => 'С кануном Рождества';

  @override
  String get activityChristmasEveThinking => 'Думаю и в канун Рождества';

  @override
  String get activityChristmasEveGift => 'Сегодня код, завтра подарки';

  @override
  String get activityChristmas => 'С Рождеством';

  @override
  String get activityChristmasCompany => 'С вами на Рождество';

  @override
  String get activityChristmasEgg => 'Рождественская пасхалка';

  @override
  String get activityChristmasReindeer => 'Олень доставляет код';

  @override
  String get activityYearEndEve => 'Канун Нового года';

  @override
  String get activityYearEndLast => 'Последняя мысль в этом году';

  @override
  String get activityYearEndReady => 'Готов к новому году';

  @override
  String get activityYearEndSeeYou => 'До встречи в новом году!';

  @override
  String get activityZodiacRat => 'Крыса';

  @override
  String get activityZodiacOx => 'Бык';

  @override
  String get activityZodiacTiger => 'Тигр';

  @override
  String get activityZodiacRabbit => 'Кролик';

  @override
  String get activityZodiacDragon => 'Дракон';

  @override
  String get activityZodiacSnake => 'Змея';

  @override
  String get activityZodiacHorse => 'Лошадь';

  @override
  String get activityZodiacGoat => 'Коза';

  @override
  String get activityZodiacMonkey => 'Обезьяна';

  @override
  String get activityZodiacRooster => 'Петух';

  @override
  String get activityZodiacDog => 'Собака';

  @override
  String get activityZodiacPig => 'Свинья';

  @override
  String get activityLunarCheers => 'С Лунным Новым годом!';

  @override
  String get activityLunarCode => 'Пишу код и на Новый год';

  @override
  String get activityLunarEnvelope => 'Красные конверты, пожалуйста';

  @override
  String get activityLunarSpring => 'С Праздником весны';

  @override
  String get activityLunarGreeting => 'Новогодние поздравления';

  @override
  String get activityLunarCodeGreeting => 'Код поздравляет с Новым годом';

  @override
  String get activityRareSsr => 'SSR! Редкая пасхалка';

  @override
  String get activityRareUr => 'Дроп UR';

  @override
  String get activityRareLegend => 'Легендарный дроп!';

  @override
  String get activityRareOrange => 'Оранжевый дроп';

  @override
  String get activityRareEgg => 'Вас нашла пасхалка';

  @override
  String get activityRareChosen => 'Избранный момент';

  @override
  String get activityRareHidden => 'Вы нашли скрытое издание';

  @override
  String get activityRareChat => 'Секретный чат открыт';

  @override
  String get activityRareMax => 'Редкость МАКС';

  @override
  String get activityRareLucky => 'Удача на вашей стороне';

  @override
  String get activityRareCritical => 'Критический удар';

  @override
  String get activityRareNextLevel => 'Мышление нового уровня';

  @override
  String get activityFailCrash => 'Ну, что-то пошло не так';

  @override
  String get activityFailOops => 'Упс';

  @override
  String get activityFailRun => 'Не запустилось';

  @override
  String get activityFailTrip => 'Споткнулись';

  @override
  String get activityFailWrong => 'Это неверно';

  @override
  String get activityFailHiccup => 'Небольшая заминка';

  @override
  String get activityFailBroken => 'Не работает';

  @override
  String get activityFailLocal => 'У меня работает';

  @override
  String get activityFailYesterday => 'Вчера работало';

  @override
  String get activityFailTough => 'Непростой случай';

  @override
  String get activityFailCrack => 'Ну, всё развалилось';

  @override
  String get activityFailPressure => 'Чувствуется давление';

  @override
  String get activityFailCareless => 'Немного небрежности';

  @override
  String get activityFailSlip => 'Пальцы соскользнули';

  @override
  String get activityFailTryAgain => 'Попробуем иначе';

  @override
  String get activityFailChance => 'Дайте ещё попытку';

  @override
  String get activityTestGreen => 'Все тесты зелёные';

  @override
  String get activityTestAllGreen => 'Всё зелёное. Отлично';

  @override
  String get activityTestFirstTry => 'С первой попытки!';

  @override
  String get activityTestNoErrors => 'Без ошибок';

  @override
  String get activityTestPassed => 'Прошло!';

  @override
  String get activityTestSolid => 'Выглядит надёжно';

  @override
  String get activityTestRed => 'Красное. Посмотрим, что сломалось';

  @override
  String get activityTestInvestigate => 'Тесты упали. Разбираюсь';

  @override
  String get activityTestStubborn => 'Один упрямый тест';

  @override
  String get activityTestFix => 'Красный свет. Снова чинить';

  @override
  String get activityGitCommitSave => 'Закоммичено. Прогресс сохранён';

  @override
  String get activityGitSaved => 'Прогресс сохранён';

  @override
  String get activityGitCommitRelief => 'Закоммичено. Спокойствие';

  @override
  String get activityGitPushed => 'Отправлено';

  @override
  String get activityGitPushDone => 'Отправлено. Ушло';

  @override
  String get activityGitCodeOut => 'Код отправлен';

  @override
  String get activityInstallDone => 'Зависимости установлены';

  @override
  String get activityInstallInternet => 'Скачал пол-интернета';

  @override
  String get activityInstallPackages => 'Все пакеты на месте';

  @override
  String get activityMilestoneFive => 'Инструменты ×5, втянулся';

  @override
  String get activityMilestoneTen => 'Комбо инструментов ×10';

  @override
  String get activityMilestoneTwenty => 'Инструменты ×20, понеслось';

  @override
  String get activityMilestoneFifty => 'Инструменты ×50, работаю сверхурочно';

  @override
  String get activityRetryWait => 'Подождите, повторяю';

  @override
  String get activityRetryBackoff => 'Отказали. Жду и пробую';

  @override
  String get activityRetryKnock => 'Стучусь ещё раз';

  @override
  String get activityRateLimited => 'Ограничение частоты. Делаю паузу';

  @override
  String get activityRate429 => '429. Пауза, затем повтор';

  @override
  String get activityRateQueue => 'Очередь сегодня большая';

  @override
  String get activityCompactContext => 'Прибираю контекст…';

  @override
  String get activityCompactBag => 'Разбираю рюкзак…';

  @override
  String get activityCompactSpace => 'Освобождаю место';

  @override
  String get activityCompactMemory => 'Обрезаю память';

  @override
  String get activityCompactChats => 'Упаковываю старые чаты';

  @override
  String get activityReminderWater => 'Полчаса. Перерыв на воду?';

  @override
  String get activityReminderTenMinutes => 'Десять минут. Непростая задача';

  @override
  String get activityDiffTitle => 'Изменения раунда';

  @override
  String get activityDiffCopied => 'Патч скопирован';

  @override
  String get activityDiffNoWrap => 'Не переносить строки';

  @override
  String get activityDiffWrap => 'Переносить строки';

  @override
  String get activityDiffCopy => 'Копировать патч';

  @override
  String get activityDiffEmpty => 'Пустой файл, изменений нет';

  @override
  String get activityDiffNewFile => 'Новый файл';

  @override
  String get activityDiffUnknownLines => 'Номера строк неизвестны';

  @override
  String get activityDiffCopyPath => 'Копировать путь';

  @override
  String get activityThinking => 'Думаю';

  @override
  String get activityReplyInterrupted => 'Ответ (прерван)';

  @override
  String get activityWaitingApproval => 'Жду подтверждения';

  @override
  String get activityWaitingAnswer => 'Жду ответа';

  @override
  String get activityWriting => 'Пишу ответ';

  @override
  String get activityThinkingNow => 'Думаю';

  @override
  String get activityRetrying => 'Повторяю';

  @override
  String get activityCompacting => 'Сжимаю контекст';

  @override
  String get activityVerbRun => 'Запуск';

  @override
  String get activityVerbWrite => 'Запись';

  @override
  String get activityVerbEdit => 'Правка';

  @override
  String get activityVerbImage => 'Просмотр изображения';

  @override
  String get activityVerbRead => 'Чтение';

  @override
  String get activityVerbFind => 'Найти';

  @override
  String get activityVerbSearch => 'Поиск';

  @override
  String get activityVerbWebSearch => 'Поиск в интернете';

  @override
  String get activityVerbWebView => 'Просмотр страницы';

  @override
  String get activityVerbSubagent => 'Запуск субагента';

  @override
  String get activityVerbTodo => 'Обновление задач';

  @override
  String get activitySecretHide => 'Скрыть ключ';

  @override
  String get activitySecretShow => 'Показать ключ';

  @override
  String get activitySlashNoMatch => 'Нет такой команды. Отправьте как сообщение';

  @override
  String get activitySlashCommands => 'Команды';

  @override
  String get activitySlashEnterArgs => 'Введите аргументы и отправьте';

  @override
  String get activityStepTitle => 'Детали шага';

  @override
  String get activityStepMissing => 'Этого шага нет в загруженной истории';

  @override
  String get activityStepQuestion => 'Вопрос';

  @override
  String get activityStepSuccess => 'Выполнено';

  @override
  String get activityStepNeedsPermission => 'Нужно разрешение';

  @override
  String get activityTools => 'Инструменты';

  @override
  String get activityStepDispatched => 'Отправлено';

  @override
  String get activityStepExecution => 'Выполнение';

  @override
  String get activityStepLocation => 'Расположение';

  @override
  String get activityStepArguments => 'Аргументы';

  @override
  String get activityStepChanges => 'Изменения';

  @override
  String get activityStepFullScreen => 'Открыть на весь экран';

  @override
  String get activityStepReadContent => 'Прочитано содержимое';

  @override
  String get activityStepWrittenContent => 'Записано содержимое';

  @override
  String get activityStepError => 'Ошибка';

  @override
  String get activityOutput => 'Вывод';

  @override
  String get activityStepResult => 'Результат';

  @override
  String get activityStepDeclined => 'Вы отклонили этот вызов инструмента';

  @override
  String get activityStepNoOutput => 'Нет вывода';

  @override
  String get activityStepStart => 'Начало';

  @override
  String get activityDuration => 'Длительность';

  @override
  String get activityFirstToken => 'Первый токен';

  @override
  String get activityStepGeneration => 'Генерация';

  @override
  String get activityStepSpeed => 'Скорость';

  @override
  String get activityModel => 'Модель';

  @override
  String get activityStepTiming => 'Время';

  @override
  String get activityUsage => 'Использование';

  @override
  String get activityInput => 'Ввод';

  @override
  String get activityStepCacheHit => '  Попадание в кеш';

  @override
  String get activityStepCacheMiss => '  Промах кеша';

  @override
  String get activityStepCacheWrite => '  Запись в кеш';

  @override
  String get activityStepReasoning => '  Рассуждение';

  @override
  String get activityStepAnswer => '  Ответ';

  @override
  String get activityStepThinking => 'Обдумывание';

  @override
  String get activityStepExplanation => 'Пояснение';

  @override
  String get activityStepToolCalls => 'Инструменты, вызванные на этом шаге';

  @override
  String get activityStepProcessing => 'Модель обрабатывает';

  @override
  String get activityApprovalAllowed => 'Разрешено';

  @override
  String get activityApprovalUnanswered => 'Подтверждение не получено';

  @override
  String get activityApprovalAnswered => 'Ответ получен';

  @override
  String get activityToolRead => 'Чтение';

  @override
  String get activityToolWrite => 'Запись';

  @override
  String get activityToolCall => 'Вызвать инструмент';

  @override
  String get activityTraceTitle => 'Траектория раунда';

  @override
  String get activityTraceNotLoaded => 'История этого раунда ещё не загружена';

  @override
  String get activityTraceOutputLimit => 'Достигнут лимит вывода';

  @override
  String get activityTraceEngineRestarted => 'Прервано перезапуском движка';

  @override
  String get activityTraceBlocked => 'Заблокировано';

  @override
  String get activityTraceHeading => 'Траектория раунда  ';

  @override
  String get activityTraceWaiting => 'Ожидает вас';

  @override
  String get activityTraceNoSteps => 'В этом раунде нет шагов с замером времени';

  @override
  String get activityUsageInputIncludesCache => 'Ввод включает попадания в кеш';

  @override
  String get activityCacheHit => 'Попадание в кеш';

  @override
  String get activitySummaryTodo => 'Обновлены задачи';

  @override
  String get activityUsageBalance => 'Баланс DeepSeek';

  @override
  String get activityUsageContext => 'Контекст';

  @override
  String get activityUsageChat => 'Этот чат';

  @override
  String get activityUsageAfterMessage => 'Появится после отправки сообщения';

  @override
  String get activityUsageContextFull => 'Контекст почти заполнен. Отправьте /compact, чтобы сжать его';

  @override
  String get activitySpanZero => '0 с';

  @override
  String get activitySpanTiny => '<0,1 с';

  @override
  String activityUsageContextSemantics(String percent) {
    return 'Использовано контекста: $percent, открыть использование';
  }

  @override
  String activityUsageSystemTokens(String tokens) {
    return 'Система $tokens';
  }

  @override
  String activityUsageToolTokens(String tokens) {
    return 'Инструменты $tokens';
  }

  @override
  String activityUsageMessageTokens(String tokens) {
    return 'Сообщения $tokens';
  }

  @override
  String activityUsageTurns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'всего $count раунда',
      many: 'всего $count раундов',
      few: 'всего $count раунда',
      one: 'всего $count раунд',
    );
    return '$_temp0';
  }

  @override
  String activityUsageCacheWriteTokens(String tokens) {
    return 'Запись в кеш $tokens';
  }

  @override
  String activitySummaryCommands(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выполнено $count команды',
      many: 'Выполнено $count команд',
      few: 'Выполнены $count команды',
      one: 'Выполнена $count команда',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryEditedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изменено $count файла',
      many: 'Изменено $count файлов',
      few: 'Изменено $count файла',
      one: 'Изменён $count файл',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryReadFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Прочитано $count файла',
      many: 'Прочитано $count файлов',
      few: 'Прочитано $count файла',
      one: 'Прочитан $count файл',
    );
    return '$_temp0';
  }

  @override
  String activitySummarySearches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выполнено $count поиска',
      many: 'Выполнено $count поисков',
      few: 'Выполнено $count поиска',
      one: 'Выполнен $count поиск',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryWeb(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count выхода в интернет',
      many: '$count выходов в интернет',
      few: '$count выхода в интернет',
      one: '$count выход в интернет',
    );
    return '$_temp0';
  }

  @override
  String activitySummarySubagents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count вызова субагента',
      many: '$count вызовов субагента',
      few: '$count вызова субагента',
      one: '$count вызов субагента',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryOther(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Другие инструменты: $count вызова',
      many: 'Другие инструменты: $count вызовов',
      few: 'Другие инструменты: $count вызова',
      one: 'Другие инструменты: $count вызов',
    );
    return '$_temp0';
  }

  @override
  String activitySummaryTotal(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Использовано $count инструмента',
      many: 'Использовано $count инструментов',
      few: 'Использовано $count инструмента',
      one: 'Использован $count инструмент',
    );
    return '$_temp0';
  }

  @override
  String activityDiffBlockMarker(int index, int total) {
    return '@@ Изменение $index/$total @@';
  }

  @override
  String activityDiffEditMarker(int index, int total) {
    return 'Изменение $index из $total';
  }

  @override
  String activityTraceSpanSemantics(String title, String detail, String duration) {
    return '$title $detail, длительность $duration';
  }

  @override
  String activityTraceGroupSemantics(String label, String duration) {
    return '$label, длительность $duration';
  }

  @override
  String activityTraceEstimatedCost(String cost) {
    return '$cost (оценка по официальным тарифам)';
  }

  @override
  String activityTraceReasoningTokens(String tokens) {
    return 'Рассуждение: $tokens';
  }

  @override
  String activityStepPosition(int turn, Object step) {
    return 'Раунд $turn · Шаг $step';
  }

  @override
  String activityStepTokenSpeed(String speed) {
    return '$speed токенов/с';
  }

  @override
  String activityStepRetryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count раза',
      many: '$count раз',
      few: '$count раза',
      one: '$count раз',
    );
    return '$_temp0';
  }

  @override
  String activityStepTruncated(String text, int count) {
    return '$text\n… (Показаны только первые ${count}k символов. Скопируйте, чтобы получить весь текст)';
  }

  @override
  String activityStepLiveElapsed(String elapsed, String suffix) {
    return '$elapsed · Выполняется$suffix';
  }

  @override
  String activityStepCopySection(String title) {
    return 'Копировать $title';
  }

  @override
  String activityStepCopiedSection(String title) {
    return 'Скопировано: $title';
  }

  @override
  String activitySlashDescriptionArgs(String description) {
    return '$description · Введите аргументы и отправьте';
  }

  @override
  String activitySpanSecondsText(String seconds) {
    return '$seconds с';
  }

  @override
  String activitySpanSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String activitySpanMinutesSeconds(int minutes, String seconds) {
    return '$minutes мин $seconds с';
  }

  @override
  String activitySpanHoursMinutes(int hours, String minutes) {
    return '$hours ч $minutes мин';
  }

  @override
  String activityCostUnderCent(String symbol) {
    return 'Меньше ${symbol}0,01';
  }

  @override
  String activityCostApprox(String symbol, String amount) {
    return '≈ $symbol$amount';
  }

  @override
  String activitySpanRetries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Повторено $count раза',
      many: 'Повторено $count раз',
      few: 'Повторено $count раза',
      one: 'Повторено $count раз',
    );
    return '$_temp0';
  }

  @override
  String activitySpanToolCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Решено вызвать $count инструмента',
      many: 'Решено вызвать $count инструментов',
      few: 'Решено вызвать $count инструмента',
      one: 'Решено вызвать $count инструмент',
    );
    return '$_temp0';
  }

  @override
  String activityRunningItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'среди $count элемента',
      many: 'среди $count элементов',
      few: 'среди $count элементов',
      one: 'среди $count элемента',
    );
    return '$_temp0';
  }

  @override
  String activityRetryAttempt(int count) {
    return 'Попытка $count';
  }

  @override
  String activityDiffFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String activityDiffFileSemantics(String path, int added, int removed) {
    String _temp0 = intl.Intl.pluralLogic(
      added,
      locale: localeName,
      other: 'добавлено $added строки',
      many: 'добавлено $added строк',
      few: 'добавлено $added строки',
      one: 'добавлена $added строка',
    );
    String _temp1 = intl.Intl.pluralLogic(
      removed,
      locale: localeName,
      other: 'удалено $removed строки',
      many: 'удалено $removed строк',
      few: 'удалено $removed строки',
      one: 'удалена $removed строка',
    );
    return '$path, $_temp0, $_temp1';
  }

  @override
  String activityDiffEditNumber(int edit) {
    return 'Правка $edit';
  }

  @override
  String activityDiffHunkNumber(int index) {
    return 'Изменение $index';
  }

  @override
  String activityDiffFromLine(int line) {
    return 'Со строки $line';
  }

  @override
  String activityDiffEditCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изменено $count раза',
      many: 'Изменено $count раз',
      few: 'Изменено $count раза',
      one: 'Изменено $count раз',
    );
    return '$_temp0';
  }

  @override
  String activityLunarZodiac(String animal) {
    return 'Удачи в год $animal';
  }

  @override
  String activityReminderHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours часа подряд. Отдохнуть?',
      many: '$hours часов подряд. Отдохнуть?',
      few: '$hours часа подряд. Отдохнуть?',
      one: '$hours час подряд. Отдохнуть?',
    );
    return '$_temp0';
  }

  @override
  String get activityStepModelRequest => 'Один запрос к модели';

  @override
  String activityStepModelRequestDetail(String detail) {
    return 'Один запрос к модели · $detail';
  }

  @override
  String activityUsageEstimatedCost(String symbol, String amount) {
    return '≈ $symbol$amount';
  }

  @override
  String activitySlashCommandSemantics(String label, String name) {
    return '$label, /$name';
  }

  @override
  String get activityToolListSeparator => ', ';

  @override
  String get botsFolderGone => 'Эта папка исчезла';

  @override
  String get botsFolderReadFailed => 'Не удалось прочитать эту папку';

  @override
  String get botsFolderOpenFailed => 'Не удалось открыть эту папку';

  @override
  String botsFolderCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count папки',
      many: '$count папок',
      few: '$count папки',
      one: '$count папка',
    );
    return '$_temp0';
  }

  @override
  String get botsWorkingFolder => 'Рабочая папка';

  @override
  String get botsFolderTeamDefault => 'Рабочая папка команды';

  @override
  String get botsFolderRoomDefault => 'Своя папка каждого бота';

  @override
  String get botsFolderHint => 'Папки на подключённом хосте.';

  @override
  String get botsFolderCurrent => 'Текущая папка';

  @override
  String get botsFolderUnavailable => 'Подключение или папка изменились. Откройте заново, чтобы продолжить.';

  @override
  String get botsFolderNoChoices => 'Других папок на хосте нет.';

  @override
  String get botsFolderConfirm => 'Использовать эту рабочую папку?';

  @override
  String get botsFolderRefused =>
      'Хост отклонил эту папку. Возможно, она исчезла, недоступна или защищена. Выберите другую или повторите.';

  @override
  String botsChildCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дочерних агента',
      many: '$count дочерних агентов',
      few: '$count дочерних агента',
      one: '$count дочерний агент',
    );
    return '$_temp0';
  }

  @override
  String get botsCurrentChat => 'Текущий чат';

  @override
  String botsSubagentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count субагента',
      many: '$count субагентов',
      few: '$count субагента',
      one: '$count субагент',
    );
    return '$_temp0';
  }

  @override
  String botsRunningCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count выполняются',
      many: '$count выполняются',
      few: '$count выполняются',
      one: '$count выполняется',
    );
    return '$_temp0';
  }

  @override
  String botsFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count с ошибкой',
      many: '$count с ошибкой',
      few: '$count с ошибкой',
      one: '$count с ошибкой',
    );
    return '$_temp0';
  }

  @override
  String botsNestedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Включая $count дочерних агента',
      many: 'Включая $count дочерних агентов',
      few: 'Включая $count дочерних агента',
      one: 'Включая $count дочернего агента',
    );
    return '$_temp0';
  }

  @override
  String botsBackToParent(String title) {
    return 'Назад к «$title»';
  }

  @override
  String botsTeamMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Команда агентов, $count участника',
      many: 'Команда агентов, $count участников',
      few: 'Команда агентов, $count участника',
      one: 'Команда агентов, $count участник',
    );
    return '$_temp0';
  }

  @override
  String get botsAgentTeam => 'Команда агентов';

  @override
  String botsSubagentRunningCount(int count, int running) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count субагента',
      many: '$count субагентов',
      few: '$count субагента',
      one: '$count субагент',
    );
    String _temp1 = intl.Intl.pluralLogic(
      running,
      locale: localeName,
      other: '$running выполняются',
      many: '$running выполняются',
      few: '$running выполняются',
      one: '$running выполняется',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get botsSubagents => 'Субагенты';

  @override
  String get botsNoSubagents => 'Субагенты не отправлены';

  @override
  String get botsOpenChatFirst => 'Сначала откройте чат';

  @override
  String get botsTeamReadFailed => 'Не удалось загрузить команду';

  @override
  String get botsNoTeamOnHost => 'На этом хосте нет команды агентов';

  @override
  String get botsTeamNotEnabled => 'Команда агентов выключена';

  @override
  String get botsTeamDescription => 'Агенты работают вместе над общей доской задач';

  @override
  String get botsTeamEnabling => 'Включение…';

  @override
  String get botsTeamEnable => 'Включить команду';

  @override
  String botsMembersWorking(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участника работают',
      many: '$count участников работают',
      few: '$count участника работают',
      one: '$count участник работает',
    );
    return '$_temp0';
  }

  @override
  String get botsTeamStandby => 'Все в ожидании';

  @override
  String get botsMembers => 'Участники';

  @override
  String get botsTasks => 'Задачи';

  @override
  String get botsTeamRecordUnreadable => 'Не удалось прочитать запись команды';

  @override
  String get botsMessages => 'Сообщения';

  @override
  String get botsOwner => 'Владелец';

  @override
  String get botsTeamCreateHint => 'Попросите ИИ создать команду в чате';

  @override
  String get botsCurrent => 'Текущая';

  @override
  String get botsNoTasks => 'Задач пока нет';

  @override
  String get botsTodo => 'К выполнению';

  @override
  String get botsUnassigned => 'Без исполнителя';

  @override
  String botsTaskWaitingFor(String dependencies) {
    return 'Ожидание: $dependencies';
  }

  @override
  String get botsWriteOverlap => 'Пересекающиеся области записи';

  @override
  String get botsWaitingDependencies => 'Ожидает зависимости';

  @override
  String get botsReadyToStart => 'Готово к запуску';

  @override
  String get botsTaskId => 'ID';

  @override
  String get botsDependencies => 'Зависимости';

  @override
  String get botsWriteScopes => 'Области записи';

  @override
  String get botsMessagesReadFailed => 'Не удалось загрузить сообщения';

  @override
  String get botsNoMemberMessages => 'Сообщений между участниками пока нет';

  @override
  String get botsMessagesIncomplete => 'Сообщения некоторых участников не загрузились · Повторить';

  @override
  String botsDateTime(String date, String time) {
    return '$date $time';
  }

  @override
  String get botsViewDetails => 'Подробнее';

  @override
  String get botsAdmin => 'Админ';

  @override
  String get botsFullTextChanged => 'Этот разговор изменился';

  @override
  String get botsFullTextReopen => 'Откройте сообщение заново';

  @override
  String get botsFullTextReadFailed => 'Не удалось загрузить полный текст';

  @override
  String get botsShowAll => 'Показать все';

  @override
  String get botsImagePlaceholder => '[Изображение]';

  @override
  String get botsSending => 'Отправка';

  @override
  String get botsWriteOwn => 'Свой вариант';

  @override
  String get botsSubmit => 'Отправить';

  @override
  String botsChooseModelFor(String name) {
    return 'Выберите модель для $name';
  }

  @override
  String get botsModelGreeting => 'Он поздоровается, когда вы выберете';

  @override
  String get botsChooseModel => 'Выбрать модель';

  @override
  String get botsSkipAnswer => 'Пропустить';

  @override
  String get botsBotGone => 'Этот бот исчез';

  @override
  String get botsWaitingModel => 'Выберите модель';

  @override
  String get botsThinking => 'Думает';

  @override
  String get botsMainBot => 'Основной бот';

  @override
  String get botsIdle => 'Без работы';

  @override
  String get botsAnsweredQuestion => 'Вы ответили на его вопрос';

  @override
  String get botsEarlierMessages => 'Более ранние сообщения';

  @override
  String botsComposerHint(String name) {
    return 'Сообщение для $name…';
  }

  @override
  String botsDeleteNamed(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get botsDeleteBotBody => 'Его чаты останутся. Воспоминания перейдут в архив.';

  @override
  String get botsTokensToday => 'Токены за 24 ч';

  @override
  String get botsMemoryUnit => 'Воспоминания';

  @override
  String get botsRoomUnit => 'Групповые чаты';

  @override
  String get botsProfile => 'Профиль';

  @override
  String get botsModel => 'Модель';

  @override
  String get botsBotName => 'Имя';

  @override
  String get botsRole => 'Роль';

  @override
  String get botsWriterExample => 'Например: Писатель';

  @override
  String get botsInstructions => 'Инструкции';

  @override
  String get botsInstructionsHint => 'Как он должен работать';

  @override
  String get botsColor => 'Цвет';

  @override
  String get botsUsage => 'Использование';

  @override
  String get botsUsageScanning => 'Считаем старые чаты. Итоги скоро появятся.';

  @override
  String get botsUsageRefresh => 'Обновить';

  @override
  String get botsToday => 'За 24 часа';

  @override
  String get botsLastWeek => 'За 7 дней';

  @override
  String get botsLastMonth => 'За 30 дней';

  @override
  String botsMonthCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'За 30 дней · $count вызова',
      many: 'За 30 дней · $count вызовов',
      few: 'За 30 дней · $count вызова',
      one: 'За 30 дней · $count вызов',
    );
    return '$_temp0';
  }

  @override
  String get botsFullRecord => 'Полная запись';

  @override
  String get botsEveryToolCall => 'Каждый вызов инструмента';

  @override
  String get botsUnsetMain => 'Снять статус основного';

  @override
  String get botsSetMain => 'Сделать основным';

  @override
  String get botsDeleteBot => 'Удалить бота';

  @override
  String get botsEffortOff => 'Без размышлений';

  @override
  String get botsEffortMinimal => 'Минимально';

  @override
  String get botsEffortLow => 'Низко';

  @override
  String get botsEffortMedium => 'Средне';

  @override
  String get botsEffortHigh => 'Высоко';

  @override
  String get botsEffortMax => 'Максимум';

  @override
  String botsNamedRecord(String name) {
    return '$name · Полная запись';
  }

  @override
  String get botsOrganizingNotes => 'Разбирает заметки';

  @override
  String get botsToolRun => 'выполняет команды';

  @override
  String get botsToolRead => 'смотрит файлы';

  @override
  String get botsToolEdit => 'правит файлы';

  @override
  String get botsToolSearch => 'ищет в интернете';

  @override
  String get botsToolBrowse => 'открывает сайты';

  @override
  String get botsToolMessage => 'связывается с другими ботами';

  @override
  String get botsToolGroup => 'общается с группой';

  @override
  String get botsToolMemory => 'наводит порядок в памяти';

  @override
  String get botsToolRecall => 'просматривает записи';

  @override
  String get botsToolTeam => 'занимается командой';

  @override
  String get botsToolAsk => 'спрашивает вас';

  @override
  String get botsToolWork => 'работает';

  @override
  String get botsJustNow => 'Только что';

  @override
  String botsCountHundredMillion(String value) {
    return '$value млн';
  }

  @override
  String botsCountTenThousand(String value) {
    return '$value тыс.';
  }

  @override
  String get botsModelNotSelected => 'Не выбрана';

  @override
  String botsYourPreview(String preview) {
    return 'Вы: $preview';
  }

  @override
  String botsEventWorking(String name) {
    return '$name начал работу';
  }

  @override
  String botsEventApproval(String name) {
    return '$name ждёт вашего подтверждения';
  }

  @override
  String botsEventDone(String name) {
    return '$name закончил работу';
  }

  @override
  String botsEventStopped(String name) {
    return 'Вы остановили работу $name';
  }

  @override
  String botsEventFailed(String name) {
    return '$name не смог ответить';
  }

  @override
  String botsEventMissed(String name) {
    return '$name не ответил вовремя';
  }

  @override
  String botsEventLookup(String name) {
    return '$name просмотрел свои чаты';
  }

  @override
  String botsEventLookupQuery(String name, String query) {
    return '$name искал в чатах «$query»';
  }

  @override
  String botsEventResumed(String name) {
    return '$name продолжил после перезапуска';
  }

  @override
  String botsEventCut(String name) {
    return '$name остановился: работу прервал очередной перезапуск';
  }

  @override
  String get botsAutomation => 'Автоматизация';

  @override
  String botsAutomationText(String text) {
    return 'Автоматизация: $text';
  }

  @override
  String get botsOtherBot => 'Другой бот';

  @override
  String botsMessageFrom(String name) {
    return 'Сообщение от $name';
  }

  @override
  String botsEventReplied(String name) {
    return '$name ответил';
  }

  @override
  String get botsGroupReplied => 'Ответ в группе';

  @override
  String botsNamedGroupReplied(String name) {
    return 'Ответ в «$name»';
  }

  @override
  String botsEventCalledStop(String name) {
    return '$name остановил работу';
  }

  @override
  String get botsChooseMember => 'Выбрать участника';

  @override
  String get botsMentionMember => 'Упомянуть участника';

  @override
  String get botsRelayUnavailable => 'Боты не работают через Relay';

  @override
  String get botsUseSsh => 'Подключитесь к этому компьютеру по SSH, чтобы использовать ботов';

  @override
  String get botsTeamLoadFailed => 'Не удалось загрузить команду ботов';

  @override
  String botsBotCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count бота',
      many: '$count ботов',
      few: '$count бота',
      one: '$count бот',
    );
    return '$_temp0';
  }

  @override
  String botsRoomCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count группового чата',
      many: '$count групповых чатов',
      few: '$count групповых чата',
      one: '$count групповой чат',
    );
    return '$_temp0';
  }

  @override
  String get botsNewBot => 'Новый бот';

  @override
  String get botsGroupChat => 'Групповой чат';

  @override
  String get botsNewGroup => 'Новая группа';

  @override
  String get botsDuplicateCreated => 'Скопировано. Скоро появится в списке.';

  @override
  String get botsDuplicate => 'Дублировать бота';

  @override
  String get botsDuplicateHint => 'Те же настройки, новый чат и память';

  @override
  String botsDuplicateNamed(String name) {
    return 'Дублировать $name?';
  }

  @override
  String get botsDuplicateBody =>
      'Новый бот сохранит задачу, инструкции и настройки модели, начнёт с чистого чата и личной памяти, а имя получит от хоста. Когда модель будет доступна, он откроется с приветствием.';

  @override
  String get botsChooseModelStart => 'Выберите модель, чтобы начать';

  @override
  String get botsNoChats => 'Чатов пока нет';

  @override
  String botsUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count непрочитанного',
      many: '$count непрочитанных',
      few: '$count непрочитанных',
      one: '$count непрочитанное',
    );
    return '$_temp0';
  }

  @override
  String get botsMainTag => 'Основной';

  @override
  String get botsMemberNeedsApproval => 'Участник ждёт подтверждения';

  @override
  String botsNamedWorking(String name) {
    return '$name работает';
  }

  @override
  String botsNamesWorking(String names) {
    return '$names работают';
  }

  @override
  String botsMemberCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count участника',
      many: '$count участников',
      few: '$count участника',
      one: '$count участник',
    );
    return '$_temp0';
  }

  @override
  String get botsInstall => 'Установить DS Bot';

  @override
  String get botsInstalling => 'Установка';

  @override
  String get botsMemory => 'Память';

  @override
  String get botsEditMemory => 'Изменить память';

  @override
  String get botsAddMemory => 'Добавить в память';

  @override
  String get botsMemoryReplyExample => 'Например: отвечай кратко';

  @override
  String get botsMemoryDraftExample => 'Например: первый черновик к пятнице';

  @override
  String botsMemoryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Память · $count', one: 'Память · 1');
    return '$_temp0';
  }

  @override
  String get botsMemoryReadFailed => 'Не удалось загрузить воспоминания';

  @override
  String get botsSummary => 'Сводка';

  @override
  String get botsNoMemory => 'Воспоминаний пока нет';

  @override
  String get botsTeam => 'Команда';

  @override
  String get botsSelf => 'Вы';

  @override
  String get botsWrittenByYou => 'Написано вами';

  @override
  String get botsNameRequired => 'Введите имя';

  @override
  String get botsRoleHint => 'Что он делает, одной фразой';

  @override
  String get botsNewInstructionsHint => 'Как он должен работать и что учитывать';

  @override
  String get botsAppearance => 'Внешний вид';

  @override
  String get botsCreating => 'Создание';

  @override
  String get botsGroupNameOptional => 'Название группы (необязательно)';

  @override
  String botsMembersSelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Участники · $count выбрано',
      one: 'Участники · 1 выбран',
    );
    return '$_temp0';
  }

  @override
  String get botsPickTwoBots => 'Выберите хотя бы двух ботов';

  @override
  String get botsFullText => 'Полный текст';

  @override
  String botsTextPartial(String count) {
    return 'Показаны первые $count символов';
  }

  @override
  String get botsTextCompletenessUnknown => 'Не удалось убедиться, что текст полный';

  @override
  String get botsRoomGone => 'Этот групповой чат удалён';

  @override
  String botsNamedSpeaking(String name) {
    return '$name говорит';
  }

  @override
  String botsNamedActivity(String name, String activity) {
    return '$name: $activity';
  }

  @override
  String get botsWorking => 'Работает';

  @override
  String get botsDiscussing => 'Обсуждает';

  @override
  String get botsTyping => 'Печатает';

  @override
  String get botsGroupComposerHint => 'Написать всем…';

  @override
  String get botsDecline => 'Отклонить';

  @override
  String get botsAllowOnce => 'Разрешить один раз';

  @override
  String get botsPrivateChat => 'Личный чат';

  @override
  String get botsSetAdmin => 'Сделать админом';

  @override
  String get botsRemoveMember => 'Удалить из группы';

  @override
  String get botsDeleteRoomBody => 'Записи группы останутся. Воспоминания перейдут в архив.';

  @override
  String botsNamedAdmin(String name) {
    return 'Админ $name';
  }

  @override
  String botsRoomWorkingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Работает $count', one: 'Работает 1');
    return '$_temp0';
  }

  @override
  String botsMembersCountTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Участники · $count', one: 'Участники · 1');
    return '$_temp0';
  }

  @override
  String get botsStopMember => 'Остановить';

  @override
  String get botsAddMember => 'Добавить участников';

  @override
  String get botsWhoAnswers => 'Кто отвечает первым';

  @override
  String get botsAdminFirst => 'Сначала админ';

  @override
  String get botsEveryoneInTurn => 'По очереди';

  @override
  String get botsGroupName => 'Название группы';

  @override
  String get botsGroupNotice => 'Объявление группы';

  @override
  String get botsGroupNoticeHint => 'Каждый участник видит это перед ответом';

  @override
  String get botsDeleteGroup => 'Удалить группу';

  @override
  String get botsDiscardTitle => 'Отменить изменения?';

  @override
  String get botsKeepEditing => 'Продолжить редактирование';

  @override
  String get botsDiscard => 'Не сохранять';

  @override
  String get botsProgress => 'Ход работы';

  @override
  String get botsGlyphRun => 'Запуск';

  @override
  String get botsGlyphJobOutput => 'Список фоновых задач';

  @override
  String get botsGlyphJobs => 'Фоновые задачи';

  @override
  String get botsGlyphStopJob => 'Остановить фоновую задачу';

  @override
  String get botsGlyphRead => 'Чтение';

  @override
  String get botsGlyphImage => 'Просмотр изображения';

  @override
  String get botsGlyphDeliver => 'Показ файлов';

  @override
  String get botsGlyphWrite => 'Запись';

  @override
  String get botsGlyphSearch => 'Поиск';

  @override
  String get botsGlyphFindFiles => 'Поиск файлов';

  @override
  String get botsGlyphOpenWeb => 'Открыть страницу';

  @override
  String get botsGlyphMessageAgent => 'Сообщение субагенту';

  @override
  String get botsGlyphInterruptAgent => 'Прервать субагента';

  @override
  String get botsGlyphListModels => 'Список моделей субагентов';

  @override
  String get botsGlyphWorkflow => 'Сценарий';

  @override
  String get botsGlyphLoop => 'Цикл задачи';

  @override
  String get botsGlyphSkill => 'Использовать навык';

  @override
  String get botsGlyphTodo => 'Обновить задачи';

  @override
  String get botsGlyphSetGoal => 'Задать цель';

  @override
  String get botsGlyphViewGoal => 'Показать цель';

  @override
  String get botsGlyphUpdateGoal => 'Обновить цель';

  @override
  String get botsGlyphAsk => 'Задать вопрос';

  @override
  String get botsCommunityEmpty => 'Здесь пока пусто';

  @override
  String get botsCommunityGroups => 'Групповые чаты';

  @override
  String get botsCommunity => 'Сообщество';

  @override
  String get botsForum => 'Форум';

  @override
  String get botsForumSubtitle => 'Спрашивайте, делитесь, общайтесь';

  @override
  String get botsProjectHome => 'Главная страница проекта DSH Go';

  @override
  String get botsOpenSource => 'Проект с открытым кодом';

  @override
  String get botsPluginCatalogFailed => 'Не удалось открыть каталог плагинов';

  @override
  String get botsTapRetry => 'Нажмите, чтобы повторить';

  @override
  String get botsFeaturedPlugins => 'Рекомендуемые плагины';

  @override
  String get botsPluginSource => 'Сведения о плагинах от dshfind';

  @override
  String get botsPromptIdeas => 'Попробуйте';

  @override
  String get botsUpdates => 'Что нового';

  @override
  String get botsLink => 'ссылка';

  @override
  String botsLinkOpenFailed(String host) {
    return 'Не удалось открыть $host';
  }

  @override
  String botsYearMonth(int year, String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'янв',
      '2': 'фев',
      '3': 'мар',
      '4': 'апр',
      '5': 'мая',
      '6': 'июн',
      '7': 'июл',
      '8': 'авг',
      '9': 'сен',
      '10': 'окт',
      '11': 'ноя',
      '12': 'дек',
      'other': '$month',
    });
    return '$_temp0 $year';
  }

  @override
  String get botsCopyGroupNumber => 'Копировать номер группы';

  @override
  String botsQrCodeLabel(String title) {
    return 'QR-код: $title';
  }

  @override
  String get botsFiles => 'Файлы';

  @override
  String get botsEmptyCell => '(пусто)';

  @override
  String botsYesterdayTime(String time) {
    return 'Вчера $time';
  }

  @override
  String get botsOutsideWorkspace => 'Вне рабочей папки';

  @override
  String get botsNotFolder => 'Это не папка';

  @override
  String get botsChatNotFound => 'Чат не найден';

  @override
  String get botsBrowseUnsupported => 'Это подключение не поддерживает просмотр файлов';

  @override
  String get botsWorkspace => 'Рабочая папка';

  @override
  String get botsSearchFiles => 'Искать файлы';

  @override
  String get botsGoUp => 'На уровень выше';

  @override
  String get botsEmptyFolder => 'Папка пуста';

  @override
  String botsFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String botsTruncatedItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Показаны только первые $count элемента',
      many: 'Показаны только первые $count элементов',
      few: 'Показаны только первые $count элемента',
      one: 'Показан только $count элемент',
    );
    return '$_temp0';
  }

  @override
  String get botsMoreActions => 'Ещё';

  @override
  String get botsSearchFailed => 'Не удалось выполнить поиск';

  @override
  String get botsNoResults => 'Ничего не найдено';

  @override
  String get botsCopyPath => 'Копировать путь';

  @override
  String get botsPetOutsideApp => 'Показывать вне приложения';

  @override
  String get botsPetNotAuthorized => 'Нет разрешения';

  @override
  String get botsPetDisplayWhen => 'Когда показывать';

  @override
  String get botsPetWhenActive => 'Когда активен';

  @override
  String get botsPetAlways => 'Всегда';

  @override
  String get botsPetSwitchDisabled => 'Переключатель недоступен';

  @override
  String get botsPetRestrictedSettings => 'Разрешить ограниченные настройки';

  @override
  String get botsPetHiddenToday => 'Скрыт на сегодня';

  @override
  String get botsPetRestore => 'Вернуть';

  @override
  String get botsPetChange => 'Сменить питомца';

  @override
  String get botsPetHideHour => 'Скрыть на 1 час';

  @override
  String get botsPetSettings => 'Настройки питомца';

  @override
  String get botsPetNone => 'Нет';

  @override
  String get botsPets => 'Питомцы';

  @override
  String get botsPetSource => 'Из DSH-TUI';

  @override
  String get botsPetSize => 'Размер';

  @override
  String get botsPetQuiet => 'Тихий режим';

  @override
  String get botsPetQuietSubtitle => 'Только анимация, без пузырей';

  @override
  String get botsPetShowNow => 'Показать сейчас';

  @override
  String botsPetHiddenUntil(String time) {
    return 'Скрыт до $time';
  }

  @override
  String get botsKeyEsc => 'Отправить Esc';

  @override
  String get botsKeyTab => 'Отправить Tab';

  @override
  String get botsKeyLeft => 'Влево';

  @override
  String get botsKeyUp => 'Вверх';

  @override
  String get botsKeyDown => 'Вниз';

  @override
  String get botsKeyRight => 'Вправо';

  @override
  String get botsKeyPipe => 'Пайп';

  @override
  String get botsKeyTilde => 'Тильда';

  @override
  String get botsKeySlash => 'Слэш';

  @override
  String get botsKeyDash => 'Дефис';

  @override
  String get botsTerminal => 'Терминал';

  @override
  String get botsTerminalRename => 'Переименовать терминал';

  @override
  String get botsTerminalName => 'Название терминала';

  @override
  String get botsTerminalRenameFailed => 'Не удалось переименовать';

  @override
  String botsTerminalCloseNamed(String title) {
    return 'Закрыть «$title»?';
  }

  @override
  String get botsTerminalCloseBody => 'Процессы внутри будут завершены';

  @override
  String get botsTerminalUnsupported => 'Терминал недоступен на этом подключении';

  @override
  String get botsTerminalSupportedHosts => 'Доступен на этом телефоне или на SSH-хосте';

  @override
  String get botsTerminalOpening => 'Открытие терминала…';

  @override
  String get botsTerminalNone => 'Нет открытых терминалов';

  @override
  String get botsTerminalNew => 'Новый терминал';

  @override
  String get botsTerminalClose => 'Закрыть терминал';

  @override
  String get botsTerminalChooseShell => 'Выбрать оболочку';

  @override
  String get botsTerminalShellFailed => 'Не удалось загрузить оболочки';

  @override
  String get botsTerminalReading => 'Чтение…';

  @override
  String get botsTerminalDefaultShell => 'Оболочка по умолчанию';

  @override
  String get botsTerminalOtherDevice => 'Ввод с другого устройства';

  @override
  String get botsTerminalTakeOver => 'Перехватить';

  @override
  String get botsTerminalStarting => 'Запуск…';

  @override
  String get botsTerminalConnecting => 'Подключение…';

  @override
  String get botsTerminalDisconnected => 'Отключено';

  @override
  String get botsTerminalReconnect => 'Подключиться снова';

  @override
  String get botsTerminalEnded => 'Завершён';

  @override
  String botsTerminalExitCode(int code) {
    return 'Завершён · Код выхода $code';
  }

  @override
  String get botsTerminalGone => 'Этот терминал уже закрыт';

  @override
  String get botsTerminalLimit => 'Сначала закройте неиспользуемые терминалы';

  @override
  String get botsToolWorkingRun => 'Выполняет команды';

  @override
  String botsToolApprovalRun(String name) {
    return '$name хочет выполнить команды';
  }

  @override
  String get botsToolWorkingRead => 'Просматривает файлы';

  @override
  String botsToolApprovalRead(String name) {
    return '$name хочет просмотреть файлы';
  }

  @override
  String get botsToolWorkingEdit => 'Изменяет файлы';

  @override
  String botsToolApprovalEdit(String name) {
    return '$name хочет изменить файлы';
  }

  @override
  String get botsToolWorkingSearch => 'Ищет в интернете';

  @override
  String botsToolApprovalSearch(String name) {
    return '$name хочет искать в интернете';
  }

  @override
  String get botsToolWorkingBrowse => 'Открывает веб-страницы';

  @override
  String botsToolApprovalBrowse(String name) {
    return '$name хочет открывать веб-страницы';
  }

  @override
  String get botsToolWorkingMessage => 'Связывается с другими ботами';

  @override
  String botsToolApprovalMessage(String name) {
    return '$name хочет связаться с другими ботами';
  }

  @override
  String get botsToolWorkingGroup => 'Общается с группой';

  @override
  String botsToolApprovalGroup(String name) {
    return '$name хочет общаться с группой';
  }

  @override
  String get botsToolWorkingMemory => 'Систематизирует воспоминания';

  @override
  String botsToolApprovalMemory(String name) {
    return '$name хочет систематизировать воспоминания';
  }

  @override
  String get botsToolWorkingRecall => 'Просматривает записи';

  @override
  String botsToolApprovalRecall(String name) {
    return '$name хочет просмотреть записи';
  }

  @override
  String get botsToolWorkingTeam => 'Собирает команду';

  @override
  String botsToolApprovalTeam(String name) {
    return '$name хочет собрать команду';
  }

  @override
  String get botsToolWorkingAsk => 'Готовится задать вопрос';

  @override
  String botsToolApprovalAsk(String name) {
    return '$name хочет вас кое о чём спросить';
  }

  @override
  String get botsToolWorkingWork => 'Работает';

  @override
  String botsToolApprovalWork(String name) {
    return '$name хочет поработать';
  }

  @override
  String get botsEveryone => 'Все';

  @override
  String get botsActivelyRunning => 'Выполняется';

  @override
  String get botsListSeparator => ', ';

  @override
  String get botsNameSeparator => ', ';

  @override
  String get botsGlyphSubagent => 'Субагент';

  @override
  String get botsGlyphWebSearch => 'Веб-поиск';

  @override
  String botsSenderPreview(String name, String preview) {
    return '$name: $preview';
  }

  @override
  String botsAgentSemantics(String title, String state) {
    return '$title, $state';
  }

  @override
  String botsViewMetric(Object label, Object value) {
    return '$label: $value';
  }

  @override
  String get botsEffortXhigh => 'Очень высокое';

  @override
  String get botsRelayLimit => 'Лимит пересылки ботов';

  @override
  String get botsRelayLimitHint =>
      'Пауза после стольких вызовов «бот — бот» с вашего последнего сообщения. Введите целое число от 1 до 200 или оставьте пустым для значения по умолчанию.';

  @override
  String botsRelayLimitDefault(int count) {
    return 'По умолчанию: $count';
  }

  @override
  String get botsRelayLimitInvalid => 'Введите целое число от 1 до 200.';

  @override
  String get botsRelayLimitRestore => 'Вернуть по умолчанию';

  @override
  String get botsRelayLimitConnectionChanged => 'Подключение изменилось. Закройте эту панель и откройте снова.';

  @override
  String get botsMobileUnsupportedTitle => 'DS Bot пока не на телефоне';

  @override
  String get botsMobileApiRequired => 'Пока используйте его в DSH Web';

  @override
  String get botsMobileApiMissing => 'Пока недоступно на телефоне. Используйте в DSH Web';

  @override
  String get botsCreationConnectionChanged =>
      'Подключение изменилось. Откройте форму заново, чтобы создать на текущем хосте.';

  @override
  String get brandXiaomi => 'Xiaomi / Redmi';

  @override
  String get brandHuawei => 'Huawei';

  @override
  String get brandHonor => 'Honor';

  @override
  String get brandOppo => 'OPPO / OnePlus / realme';

  @override
  String get brandSamsung => 'Samsung';

  @override
  String get brandVivoOs => 'vivo / iQOO (OriginOS)';

  @override
  String get brandXiaomiOs => 'Xiaomi / Redmi (HyperOS, MIUI)';

  @override
  String get brandHuaweiOs => 'Huawei / Honor (HarmonyOS, MagicOS)';

  @override
  String get brandOppoOs => 'OPPO / OnePlus / realme (ColorOS)';

  @override
  String get brandSamsungOs => 'Samsung (One UI)';

  @override
  String get brandZhihu => 'Zhihu';

  @override
  String get catalogCurrentChat => 'Текущий чат';

  @override
  String get catalogChatDetails => 'Детали чата';

  @override
  String get catalogChatDetailsSummary => 'Ход, изменения и прогресс';

  @override
  String get catalogArtifacts => 'Файлы результатов';

  @override
  String get catalogArtifactsSummary => 'Просмотр, обмен и сохранение';

  @override
  String get catalogFiles => 'Файлы';

  @override
  String get catalogFilesSummary => 'Обзор и просмотр';

  @override
  String get catalogTerminal => 'Терминал';

  @override
  String get catalogTerminalSummary => 'Терминал рабочей папки';

  @override
  String get catalogExport => 'Экспорт журнала чата';

  @override
  String get catalogExportSummary => 'Сохранить в ZIP';

  @override
  String get catalogJobs => 'Фоновые задачи';

  @override
  String get catalogJobsSummary => 'Смотреть вывод или останавливать задачи';

  @override
  String get catalogPlanGoal => 'План и цель';

  @override
  String get catalogPlanGoalSummary => 'Цели, планы и задачи';

  @override
  String get catalogSkills => 'Навыки';

  @override
  String get catalogSkillsSummary => 'Использование навыков в чатах';

  @override
  String get catalogSubagents => 'Субагенты';

  @override
  String get catalogSubagentsSummary => 'Связи и статус; нажмите, чтобы написать';

  @override
  String get catalogReference => 'Ссылки на файлы и чаты';

  @override
  String get catalogReferenceSummary => 'Используйте @ в поле ввода';

  @override
  String get catalogAutomationSection => 'Автоматизация';

  @override
  String get catalogSchedules => 'Автоматизации';

  @override
  String get catalogSchedulesSummary => 'Задачи по расписанию и повторяющиеся';

  @override
  String get catalogPermission => 'Разрешения';

  @override
  String get catalogPermissionSummary => 'Когда запрашивать подтверждение';

  @override
  String get catalogModels => 'Модели';

  @override
  String get catalogModelsSummary => 'Подписки и свои провайдеры';

  @override
  String get catalogPlugins => 'Плагины';

  @override
  String get catalogPluginsSummary => 'Установленные плагины и магазины';

  @override
  String get catalogCordisSummary => 'Динамические панели от плагинов';

  @override
  String get catalogAgentTeam => 'Команда агентов';

  @override
  String get catalogAgentTeamSummary => 'Участники, доска задач и сообщения';

  @override
  String get catalogCotTranslation => 'Перевод рассуждений';

  @override
  String get catalogCotTranslationSummary => 'Разверните рассуждения и нажмите «Перевести»';

  @override
  String get catalogVoiceInput => 'Голосовой ввод';

  @override
  String get catalogVoiceInputSummary => 'Микрофон в поле ввода';

  @override
  String get catalogCommunitySharingSection => 'Сообщество и обмен';

  @override
  String get catalogForum => 'Форум';

  @override
  String get catalogForumSummary => 'Спрашивайте, делитесь, знакомьтесь';

  @override
  String get catalogCommunity => 'Сообщество';

  @override
  String get catalogCommunitySummary => 'Подборки и групповые чаты';

  @override
  String get catalogBotSummary => 'Команды ботов и групповые чаты';

  @override
  String get catalogShareProfile => 'Поделиться конфигурацией';

  @override
  String get catalogShareProfileSummary => 'Плагины, настройки и навыки';

  @override
  String get catalogSearch => 'Поиск по чатам';

  @override
  String get catalogSearchSummary => 'По названию или содержимому';

  @override
  String get catalogWorkspaces => 'Рабочие папки';

  @override
  String get catalogWorkspacesSummary => 'Добавление и переключение папок';

  @override
  String get catalogRemoteSummary => 'Подключение к компьютеру или серверу';

  @override
  String get catalogPhoneControl => 'Управление телефоном';

  @override
  String get catalogPhoneControlSummary => 'Видит экран и нажимает за вас';

  @override
  String get catalogWebSummary => 'Официальный интерфейс DSH';

  @override
  String get catalogPluginPanel => 'Панель плагина';

  @override
  String get catalogHostPluginMissing => 'На этом хосте нет этого плагина';

  @override
  String get catalogAllFeatures => 'Все функции';

  @override
  String get catalogAllFeaturesSubtitle => 'Все функции DSH Web';

  @override
  String get catalogOpenChatFirst => 'Сначала откройте чат';

  @override
  String get catalogNoOpenChat => 'Чат не открыт';

  @override
  String get catalogOpenChat => 'Открытый чат';

  @override
  String get catalogOpenOrCreateChat => 'Сначала откройте или создайте чат';

  @override
  String get catalogCordisHostClient => 'Бэкенд и интерфейс';

  @override
  String get catalogCordisHostOnly => 'Только бэкенд';

  @override
  String get catalogCordisClientOnly => 'Только интерфейс';

  @override
  String get catalogCordisPluginGone => 'Плагин пропал';

  @override
  String get catalogCordisStopFailed => 'Не удалось остановить';

  @override
  String get catalogCordisRemoveOne => 'Он будет остановлен и удалён.';

  @override
  String get catalogCordisRemove => 'Удалить';

  @override
  String get catalogCordisRemoved => 'Удалено';

  @override
  String get catalogCordisRemoveFailed => 'Не удалось удалить';

  @override
  String get catalogCordisChat => 'Чат';

  @override
  String get catalogCordisMakeup => 'Компоненты';

  @override
  String get catalogCordisStopping => 'Останавливаю…';

  @override
  String get catalogCordisRemoving => 'Удаляю…';

  @override
  String get catalogSeatGone => 'Плагин больше недоступен';

  @override
  String catalogCordisRemoveTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String catalogCordisRemoveVersions(int versions) {
    String _temp0 = intl.Intl.pluralLogic(
      versions,
      locale: localeName,
      other: 'Он будет остановлен, и $versions версии будут удалены.',
      many: 'Он будет остановлен, и $versions версий будут удалены.',
      few: 'Он будет остановлен, и $versions версии будут удалены.',
      one: 'Он будет остановлен, и $versions версия будет удалена.',
    );
    return '$_temp0';
  }

  @override
  String catalogCordisVersionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count версии',
      many: '$count версий',
      few: '$count версии',
      one: '$count версия',
    );
    return '$_temp0';
  }

  @override
  String get catalogToolsSection => 'Инструменты';

  @override
  String get catalogAllSettings => 'Все настройки';

  @override
  String get diagnosticsForAi => 'Разрешить ИИ читать диагностику';

  @override
  String get diagnosticsForAiHint => 'Записать снимок туда, откуда движок его прочитает';

  @override
  String get diagnosticsForAiDone => 'Записано — попросите ИИ «проверить диагностику»';

  @override
  String get diagnosticsForAiFailed => 'Не записано: локальная среда не установлена';

  @override
  String get chatBackgroundTaskNotice => 'Уведомление о фоновой задаче';

  @override
  String get chatBackgroundTaskMessage => 'Сообщение фоновой задачи';

  @override
  String get chatDeclineQuestion => 'Пропустить';

  @override
  String get chatChats => 'Чаты';

  @override
  String get chatViewChatDetails => 'Открыть сведения о чате';

  @override
  String get chatUnsent => 'Не отправлено';

  @override
  String get chatFailedSubmission => 'Не отправлено · Текст сохранён';

  @override
  String get chatEditFailedSubmission => 'Изменить и отправить';

  @override
  String get chatErrReasoningEffortUnsupported =>
      'Эта модель не поддерживает выбранный уровень рассуждений. Измените уровень или модель.';

  @override
  String get chatSteerNextStep => 'Направить · Следующий шаг';

  @override
  String get chatQueuedAfterTurn => 'В очереди · Следующий раунд';

  @override
  String get chatSteering => 'Направление';

  @override
  String get chatQueued => 'В очереди';

  @override
  String get chatStoppingTurn => 'Останавливаю раунд';

  @override
  String get chatSending => 'Отправка';

  @override
  String get chatSendNow => 'Отправить сейчас';

  @override
  String get chatSwitchToSteer => 'Направить вместо этого';

  @override
  String get chatWithdraw => 'Отменить';

  @override
  String get chatContinuedInNewChat => 'Продолжено в новом чате';

  @override
  String get chatReadOriginalImageFailed => 'Не удалось открыть исходное изображение. Повторите попытку.';

  @override
  String get chatRegenerateFailed => 'Не удалось сгенерировать заново';

  @override
  String get chatRegeneratedInNewChat => 'Сгенерировано заново в новом чате';

  @override
  String get chatOpenedInNewChatReattach => 'Открыто в новом чате. Добавьте вложения заново.';

  @override
  String get chatOpenedInNewChat => 'Открыто в новом чате';

  @override
  String chatForkQueuedLeft(String message, int left) {
    String _temp0 = intl.Intl.pluralLogic(
      left,
      locale: localeName,
      other: '$message ($left сообщения остались в очереди)',
      many: '$message ($left сообщений осталось в очереди)',
      few: '$message ($left сообщения остались в очереди)',
      one: '$message ($left сообщение осталось в очереди)',
    );
    return '$_temp0';
  }

  @override
  String get chatReturnToOriginal => 'Вернуться в исходный чат';

  @override
  String chatWaitingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента ждут подтверждения',
      many: '$count элементов ждут подтверждения',
      few: '$count элемента ждут подтверждения',
      one: '$count элемент ждёт подтверждения',
    );
    return '$_temp0';
  }

  @override
  String chatWaitingBackToBottom(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента ждут подтверждения, назад вниз',
      many: '$count элементов ждут подтверждения, назад вниз',
      few: '$count элемента ждут подтверждения, назад вниз',
      one: '$count элемент ждёт подтверждения, назад вниз',
    );
    return '$_temp0';
  }

  @override
  String get chatBackToBottom => 'Вниз';

  @override
  String get chatCreateFailed => 'Не удалось создать чат';

  @override
  String get chatSendMode => 'Режим отправки';

  @override
  String get chatSteer => 'Направить';

  @override
  String get chatSteerHint => 'ИИ увидит это на следующем шаге, без прерывания';

  @override
  String get chatInterruptAndSend => 'Прервать и отправить';

  @override
  String get chatInterruptHint => 'Остановить текущую задачу и заняться этим';

  @override
  String get chatQueue => 'В очередь';

  @override
  String get chatQueueHint => 'Отправить после этого раунда';

  @override
  String get chatWithdrawnEditable => 'Отменено. Измените и отправьте снова.';

  @override
  String get chatWithdrawn => 'Отменено';

  @override
  String chatAttachmentLimit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'До $count вложения на сообщение',
      many: 'До $count вложений на сообщение',
      few: 'До $count вложений на сообщение',
      one: 'До $count вложения на сообщение',
    );
    return '$_temp0';
  }

  @override
  String get chatAttachmentPermission => 'Нет разрешения. Включите его в настройках системы.';

  @override
  String get chatOpenAttachmentFailed => 'Не удалось открыть вложение';

  @override
  String get chatReadFailed => 'Не удалось прочитать';

  @override
  String get chatReadImageFailed => 'Не удалось прочитать изображение';

  @override
  String get chatOpenChatFirst => 'Сначала откройте чат';

  @override
  String get chatTurnCompleted => 'Этот раунд завершён';

  @override
  String get chatTurnError => 'В этом раунде что-то пошло не так';

  @override
  String get chatAnswerHint => 'Введите ответ…';

  @override
  String get chatStarting => 'Запуск';

  @override
  String get chatConnecting => 'Подключение';

  @override
  String get chatDisconnected => 'Нет подключения';

  @override
  String get chatReconnecting => 'Переподключение';

  @override
  String get chatGenerating => 'Генерация';

  @override
  String get chatGoToSettings => 'Открыть настройки';

  @override
  String get chatListeningEllipsis => 'Слушаю…';

  @override
  String get chatTranscribingEllipsis => 'Распознаю…';

  @override
  String get chatConnectToSend => 'Подключитесь к движку, чтобы отправить';

  @override
  String get chatGeneratingSteerHint => 'Генерация · Введите, чтобы направить';

  @override
  String get chatComposerHint => 'Сообщение для DSH…';

  @override
  String get chatStopGenerating => 'Остановить генерацию';

  @override
  String get chatVoiceInput => 'Голосовой ввод';

  @override
  String get chatStopVoiceInput => 'Остановить голосовой ввод';

  @override
  String get chatGoal => 'Цель';

  @override
  String get chatGoalActions => 'Действия с целью';

  @override
  String get chatGoalBlocked => 'Заблокирована';

  @override
  String chatGoalRoundLimit(int rounds, int max) {
    return 'Раунд $rounds / $max';
  }

  @override
  String chatGoalRound(int rounds) {
    return 'Раунд $rounds';
  }

  @override
  String get chatEditGoal => 'Изменить цель';

  @override
  String get chatPauseGoal => 'Пауза';

  @override
  String get chatPauseGoalHint => 'Приостановить автоматический прогресс';

  @override
  String get chatResumeGoal => 'Продолжить';

  @override
  String get chatResumeGoalHint => 'Возобновить автоматический прогресс';

  @override
  String get chatClearGoal => 'Очистить цель';

  @override
  String get chatGoalHint => 'Чего вы хотите достичь?';

  @override
  String get chatClearGoalTitle => 'Очистить цель?';

  @override
  String chatTodoCurrent(String content) {
    return 'Сейчас: $content';
  }

  @override
  String chatTodoNext(String content) {
    return 'Далее: $content';
  }

  @override
  String get chatTodoAllDone => 'Всё готово';

  @override
  String chatTodoSemantics(String count, String label) {
    return 'Задача $count, $label';
  }

  @override
  String get chatCollapseTodos => 'Свернуть список';

  @override
  String get chatExpandTodos => 'Развернуть список';

  @override
  String chatDockFolded(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count строки состояния свёрнуты',
      many: '$count строк состояния свёрнуты',
      few: '$count строки состояния свёрнуты',
      one: '$count строка состояния свёрнута',
    );
    return '$_temp0';
  }

  @override
  String get chatDockSpread => 'Развернуть';

  @override
  String get chatDockFold => 'Свернуть строки состояния';

  @override
  String get chatDockNext => 'Следующая карточка';

  @override
  String get chatDockPrevious => 'Предыдущая карточка';

  @override
  String get chatTodoNotStarted => 'Не начато';

  @override
  String get chatFile => 'Файл';

  @override
  String get chatFolder => 'Папка';

  @override
  String get chatChat => 'Чат';

  @override
  String get chatSubagent => 'Субагент';

  @override
  String get chatRecent => 'Недавние';

  @override
  String get chatMentionSearching => 'Поиск…';

  @override
  String get chatMentionNoFiles => 'Нет подходящих файлов';

  @override
  String get chatMentionNoMatches => 'Нет подходящих файлов или чатов';

  @override
  String get chatQuote => 'Цитата';

  @override
  String get chatOpenFolder => 'Открыть папку';

  @override
  String get chatJustNow => 'Только что';

  @override
  String chatMentionAgeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мин',
      many: '$count мин',
      few: '$count мин',
      one: '$count мин',
    );
    return '$_temp0';
  }

  @override
  String chatMentionAgeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ч',
      many: '$count ч',
      few: '$count ч',
      one: '$count ч',
    );
    return '$_temp0';
  }

  @override
  String chatMentionAgeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count дней',
      few: '$count дня',
      one: '$count день',
    );
    return '$_temp0';
  }

  @override
  String chatMentionAgeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count месяца',
      many: '$count месяцев',
      few: '$count месяца',
      one: '$count месяц',
    );
    return '$_temp0';
  }

  @override
  String chatMentionAgeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count года',
      many: '$count лет',
      few: '$count года',
      one: '$count год',
    );
    return '$_temp0';
  }

  @override
  String get chatMermaidChart => 'Диаграмма Mermaid';

  @override
  String get chatPreview => 'Предпросмотр';

  @override
  String get chatUnwrapLines => 'Отключить перенос строк';

  @override
  String get chatWrapLines => 'Переносить строки';

  @override
  String get chatAlertNote => 'Заметка';

  @override
  String get chatAlertTip => 'Совет';

  @override
  String get chatAlertImportant => 'Важно';

  @override
  String get chatAlertWarning => 'Предупреждение';

  @override
  String get chatAlertCaution => 'Осторожно';

  @override
  String get chatImage => 'Изображение';

  @override
  String get chatImageNotFound => 'Изображение не найдено';

  @override
  String get chatImageOffline => 'Нет подключения к DSH';

  @override
  String get chatImageTooLarge => 'Изображение слишком большое';

  @override
  String get chatImageReadFailed => 'Не удалось прочитать файл';

  @override
  String get chatImageDisplayFailed => 'Не удалось показать';

  @override
  String get chatImageTapToView => 'Нажмите, чтобы открыть';

  @override
  String get chatImageTapToRetry => 'Нажмите, чтобы повторить';

  @override
  String get chatImageUnsupportedAddress => 'Неподдерживаемый адрес';

  @override
  String get chatMermaidNeedsNetwork => 'Нужен интернет';

  @override
  String get chatMermaidSyntaxError => 'Неверный синтаксис диаграммы';

  @override
  String get chatChartPreview => 'Предпросмотр диаграммы';

  @override
  String get chatCopyCode => 'Копировать код';

  @override
  String get chatChartClosed => 'Диаграмма закрыта';

  @override
  String get chatVoiceMicrophoneFailed => 'Не удалось открыть микрофон';

  @override
  String get chatVoicePermissionOff => 'Доступ к микрофону выключен';

  @override
  String get chatVoicePermissionNeeded => 'Для голосового ввода нужен доступ к микрофону';

  @override
  String get chatVoiceNotHeard => 'Не расслышал. Попробуйте ещё раз.';

  @override
  String get chatVoiceTranscriptionFailed => 'Не удалось распознать эту запись';

  @override
  String get chatListening => 'Слушаю';

  @override
  String get chatTranscribing => 'Распознаю';

  @override
  String get chatCancelVoiceInput => 'Отменить голосовой ввод';

  @override
  String get chatViewTurnTrace => 'Показать траекторию раунда';

  @override
  String chatTokensPerSecond(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Примерно $count токена/с',
      many: 'Примерно $count токенов/с',
      few: 'Примерно $count токена/с',
      one: 'Примерно $count токен/с',
    );
    return '$_temp0';
  }

  @override
  String get chatNoTokensStreaming => 'Текст не поступает';

  @override
  String chatCurrentStep(String step) {
    return 'Шаг $step';
  }

  @override
  String chatTodoProgress(int done, int total) {
    return 'Прогресс задач $done/$total';
  }

  @override
  String chatProgress(int done, int total) {
    return 'Прогресс $done/$total';
  }

  @override
  String get chatApproveCommand => 'Разрешить эту команду?';

  @override
  String get chatApproveWrite => 'Разрешить запись этого файла?';

  @override
  String get chatApproveEdit => 'Разрешить правку этого файла?';

  @override
  String get chatApproveWebpage => 'Разрешить открыть эту страницу?';

  @override
  String get chatApproveSearch => 'Разрешить поиск в интернете?';

  @override
  String chatApproveTool(String name) {
    return 'Разрешить «$name»?';
  }

  @override
  String get chatDecline => 'Отклонить';

  @override
  String get chatAllowOnce => 'Разрешить один раз';

  @override
  String get chatAllowForChat => 'Разрешить в чате';

  @override
  String get chatSaveToDownloads => 'Сохранить в Загрузки';

  @override
  String get chatCopyPath => 'Копировать путь';

  @override
  String get chatOpenInDefaultApp => 'Открыть в приложении по умолчанию';

  @override
  String get chatDownloadsFolderHint => 'Папка Downloads/DSH-Go';

  @override
  String chatSavedToDownloadsPath(String path) {
    return 'Сохранено в Загрузки/$path';
  }

  @override
  String chatSavedToPath(String path) {
    return 'Сохранено в $path';
  }

  @override
  String chatDeliveredFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Доставлено $count файла',
      many: 'Доставлено $count файлов',
      few: 'Доставлено $count файла',
      one: 'Доставлен $count файл',
    );
    return '$_temp0';
  }

  @override
  String chatGeneratedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Создано $count файла',
      many: 'Создано $count файлов',
      few: 'Создано $count файла',
      one: 'Создан $count файл',
    );
    return '$_temp0';
  }

  @override
  String chatAllFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Всего $count файла',
      many: 'Всего $count файлов',
      few: 'Всего $count файла',
      one: 'Всего $count файл',
    );
    return '$_temp0';
  }

  @override
  String get chatCollapseFileList => 'Свернуть список файлов';

  @override
  String chatExpandAllFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Развернуть $count файла',
      many: 'Развернуть все $count файлов',
      few: 'Развернуть $count файла',
      one: 'Развернуть $count файл',
    );
    return '$_temp0';
  }

  @override
  String get chatDownloading => 'Скачивание…';

  @override
  String chatDownloadingPercent(int percent) {
    return 'Скачивание… $percent%';
  }

  @override
  String get chatOpening => 'Открытие…';

  @override
  String get chatSavingToDownloads => 'Сохранение в Загрузки…';

  @override
  String get chatOpenInPhoneApp => 'Открыть в приложении на телефоне';

  @override
  String get chatMoreActions => 'Ещё действия';

  @override
  String get chatAlreadyInDownloads => 'Уже в Загрузках на этом телефоне';

  @override
  String get chatArtifactCopyPathOnly => 'Это подключение не читает файлы. Можно скопировать путь.';

  @override
  String get chatReplying => 'Отвечаю';

  @override
  String get chatInterrupted => 'Прервано';

  @override
  String get chatGallery => 'Фото';

  @override
  String get chatTakePhoto => 'Сделать фото';

  @override
  String get chatAddAttachment => 'Добавить изображение или файл';

  @override
  String chatRemoveAttachment(String name) {
    return 'Удалить «$name»';
  }

  @override
  String get chatAutoApproveCommands => 'Разрешать команды автоматически';

  @override
  String get chatAutoApproving => 'Автоподтверждение';

  @override
  String chatViewMoreChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Показать изменения, ещё $count файла',
      many: 'Показать изменения, ещё $count файлов',
      few: 'Показать изменения, ещё $count файла',
      one: 'Показать изменения, ещё $count файл',
    );
    return '$_temp0';
  }

  @override
  String get chatViewChanges => 'Показать изменения';

  @override
  String chatChangedFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изменено $count файла',
      many: 'Изменено $count файлов',
      few: 'Изменено $count файла',
      one: 'Изменён $count файл',
    );
    return '$_temp0';
  }

  @override
  String chatMoreFiles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ещё $count файла',
      many: 'ещё $count файлов',
      few: 'ещё $count файла',
      one: 'ещё $count файл',
    );
    return '$_temp0';
  }

  @override
  String chatFileChangeSemantics(String path, int added, int removed) {
    String _temp0 = intl.Intl.pluralLogic(
      added,
      locale: localeName,
      other: 'добавлено $added строки',
      many: 'добавлено $added строк',
      few: 'добавлено $added строки',
      one: 'добавлена $added строка',
    );
    String _temp1 = intl.Intl.pluralLogic(
      removed,
      locale: localeName,
      other: 'удалено $removed строки',
      many: 'удалено $removed строк',
      few: 'удалено $removed строки',
      one: 'удалена $removed строка',
    );
    return '$path, $_temp0, $_temp1';
  }

  @override
  String get chatNewFileSuffix => '  Новый';

  @override
  String get chatPathCopied => 'Путь скопирован';

  @override
  String chatCommandCompacted(int count, String tokens) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Сжато $count элемента истории (~$tokens токенов)',
      many: 'Сжато $count элементов истории (~$tokens токенов)',
      few: 'Сжато $count элемента истории (~$tokens токенов)',
      one: 'Сжат $count элемент истории (~$tokens токенов)',
    );
    return '$_temp0';
  }

  @override
  String chatCommandPermissionChanged(String name) {
    return 'Переключено на $name';
  }

  @override
  String chatCommandCurrentPermission(String name) {
    return 'Текущие разрешения: $name';
  }

  @override
  String get chatCommandUnknownPermission => 'Нет такого набора разрешений';

  @override
  String get chatCommandFeedbackRequired => 'Добавьте отзыв перед отправкой';

  @override
  String get chatCommandFeedbackSubmitted => 'Отзыв отправлен';

  @override
  String get chatCommandNothingToCompact => 'Пока нечего сжимать';

  @override
  String get chatCommandCompactionCancelled => 'Сжатие отменено';

  @override
  String get chatCommandCompactionBusy => 'Занято. Попробуйте сжать позже.';

  @override
  String get chatCommandCompactedSaveFailed => 'Сжато, но сохранить не удалось';

  @override
  String get chatCommandCompactUsage => '/compact не принимает аргументов';

  @override
  String get chatCommandHistoryChanged => 'Чат изменился. Попробуйте снова.';

  @override
  String get chatCommandCompactionFailed => 'Не удалось сжать. Попробуйте снова.';

  @override
  String get chatCommandCompactionIncomplete => 'Сжатие не завершено. Проверьте чат.';

  @override
  String get chatCommandPlanEnabled => 'Режим планирования включён';

  @override
  String get chatCommandPlanEnabling => 'Режим планирования начнётся со следующего шага';

  @override
  String get chatCommandPlanDisabled => 'Режим планирования выключен';

  @override
  String get chatCommandPlanDisabling => 'Режим планирования завершится на следующем шаге';

  @override
  String get chatCommandPlanCancelled => 'Вход в режим планирования отменён';

  @override
  String get chatCommandPlanInactive => 'Режим планирования выключен';

  @override
  String get chatCommandPlanNoAttachments => 'Нельзя прикреплять файлы при выходе из режима планирования';

  @override
  String get chatCommandNoGoal => 'Цели пока нет';

  @override
  String get chatCommandGoalRequired => 'Добавьте новую цель перед отправкой';

  @override
  String get chatCommandGoalAttachments => 'Прикрепляйте файлы вместе с целью';

  @override
  String get chatCommandGoalCleared => 'Цель очищена';

  @override
  String get chatCommandGoalInvalid => 'Сейчас это невозможно. Проверьте цель.';

  @override
  String get chatCommandGoalExists => 'Цель уже есть. Сначала измените или очистите её.';

  @override
  String get chatCommandGoalCreated => 'Цель задана';

  @override
  String get chatCommandGoalUpdated => 'Цель обновлена';

  @override
  String get chatCommandGoalPaused => 'Цель приостановлена';

  @override
  String get chatCommandGoalResumed => 'Цель возобновлена';

  @override
  String get chatCommandCurrentGoal => 'Текущая цель';

  @override
  String get chatCommandGoalBlocked => 'Требует внимания';

  @override
  String chatCommandGoalSummary(String title, String objective, String status, int rounds, int max) {
    return '$title\n$objective\n$status · Раунд $rounds/$max';
  }

  @override
  String get chatCommandFailed => 'Команда не выполнена';

  @override
  String get chatImageStorageDenied => 'Не удалось сохранить. Доступ к памяти выключен.';

  @override
  String get chatImageCannotSave => 'Не удалось сохранить это изображение';

  @override
  String get chatImageDownloadFailed => 'Не удалось скачать изображение. Попробуйте снова.';

  @override
  String get chatImageSaveFailed => 'Не удалось сохранить. Попробуйте снова.';

  @override
  String get chatImageSavedToPhotos => 'Сохранено в Галерее';

  @override
  String get chatShareFailed => 'Не удалось открыть меню «Поделиться»';

  @override
  String get chatSubmit => 'Отправить';

  @override
  String get chatSelectText => 'Выделить текст';

  @override
  String get chatRegenerate => 'Сгенерировать заново';

  @override
  String get chatBranchFromHere => 'Ответвить отсюда';

  @override
  String get chatEditAndResend => 'Изменить и отправить';

  @override
  String get chatRegenerateHint => 'Сгенерировать заново в новом чате. Исходный останется без изменений.';

  @override
  String get chatBranchHint => 'Продолжить в новом чате. Исходный останется без изменений.';

  @override
  String get chatEditResendHint => 'Переписать в новом чате. Исходный останется без изменений.';

  @override
  String get chatSaveToPhotos => 'Сохранить в Галерею';

  @override
  String get chatCopyAll => 'Копировать всё';

  @override
  String get chatRequestRetrying => 'Запрос не удался, повтор';

  @override
  String chatRequestRetryAttempt(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Запрос не удался, повтор (попытка $count)',
      many: 'Запрос не удался, повтор (попытка $count)',
      few: 'Запрос не удался, повтор (попытка $count)',
      one: 'Запрос не удался, повтор (попытка $count)',
    );
    return '$_temp0';
  }

  @override
  String chatRequestRetryLimit(int count, int max) {
    return 'Запрос не удался, повтор ($count/$max)';
  }

  @override
  String chatSubscriptionExpired(String name) {
    return 'Вход в $name истёк';
  }

  @override
  String get chatProviderKeyMissing => 'Для этого провайдера ещё нет ключа API';

  @override
  String get chatDeepSeekKeyMissing => 'Ключ API DeepSeek ещё не задан';

  @override
  String get chatOutputLimitReached => 'Достигнут лимит вывода';

  @override
  String get chatTurnBlocked => 'Этот раунд заблокирован';

  @override
  String get chatTurnEngineRestarted => 'Движок перезапустился, раунд прерван';

  @override
  String get chatSignInAgain => 'Войдите снова';

  @override
  String chatQuestionsTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count вопроса к вам',
      many: '$count вопросов к вам',
      few: '$count вопроса к вам',
      one: '$count вопрос к вам',
    );
    return '$_temp0';
  }

  @override
  String get chatOneQuestion => 'Вопрос к вам';

  @override
  String get chatMultipleChoices => 'Выберите любые';

  @override
  String get chatCustomAnswer => 'Другой ответ';

  @override
  String get chatCustomAnswerHint => 'Введите свой ответ';

  @override
  String chatQuoteSemantics(String text) {
    return 'Цитата: $text';
  }

  @override
  String get chatRemoveQuote => 'Убрать цитату';

  @override
  String get chatReadOnlySubagent => 'Одноразовый субагент · Только просмотр';

  @override
  String get chatThinkingActive => 'Размышляет';

  @override
  String get chatThinking => 'Размышление';

  @override
  String get chatTranslate => 'Перевести';

  @override
  String get chatTranslationUnavailable => 'Перевод недоступен';

  @override
  String get chatViewOriginal => 'Показать оригинал';

  @override
  String get chatViewTranslation => 'Показать перевод';

  @override
  String get chatTranslating => 'Перевод…';

  @override
  String chatToolFailures(String label, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$label: $count ошибки',
      many: '$label: $count ошибок',
      few: '$label: $count ошибки',
      one: '$label: $count ошибка',
    );
    return '$_temp0';
  }

  @override
  String get chatToolNeedsApproval => 'Для запуска нужно подтверждение';

  @override
  String get chatCommand => 'Команда';

  @override
  String chatToolLineRange(int first, int last) {
    return ' · Строки $first⁠–⁠$last';
  }

  @override
  String get chatParameters => 'Параметры';

  @override
  String get chatOutput => 'Вывод';

  @override
  String get chatResult => 'Результат';

  @override
  String get chatError => 'Ошибка';

  @override
  String get chatChanges => 'Изменения';

  @override
  String get chatContent => 'Содержимое';

  @override
  String get chatNoOutput => 'Нет вывода';

  @override
  String get chatToolDeclined => 'Вызов инструмента отклонён';

  @override
  String get chatToolRunning => 'Выполняется…';

  @override
  String get chatNoDetails => 'Подробностей пока нет';

  @override
  String get chatErrApiKey => 'Ключ API недействителен или истёк';

  @override
  String get chatErrBalance => 'Недостаточно средств';

  @override
  String get chatErrAccountQuota => 'Квота аккаунта исчерпана';

  @override
  String get chatErrRateLimit => 'Слишком много запросов. Повторите позже.';

  @override
  String get chatErrContextLength => 'Чат слишком длинный. Отправьте /compact и повторите.';

  @override
  String get chatErrModelUnavailable => 'Служба модели временно недоступна';

  @override
  String get chatErrModelTimeout => 'Модель не ответила вовремя';

  @override
  String get chatErrModelConnection => 'Служба модели недоступна';

  @override
  String get chatErrModelEmpty => 'Модель вернула пустой ответ';

  @override
  String get chatErrEngineOutdated => 'Для этой модели нужен движок новее';

  @override
  String get chatErrModelUnsupported => 'Эта модель недоступна';

  @override
  String get chatSwitchModel => 'Сменить модель';

  @override
  String get chatErrTurn => 'В этом раунде что-то пошло не так';

  @override
  String chatTurnSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count шага',
      many: '$count шагов',
      few: '$count шага',
      one: '$count шаг',
    );
    return '$_temp0';
  }

  @override
  String chatTurnFootnoteSemantics(String summary) {
    return 'Этот раунд: $summary, открыть траекторию раунда';
  }

  @override
  String chatTurnToolCalls(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count вызова инструментов',
      many: '$count вызовов инструментов',
      few: '$count вызова инструментов',
      one: '$count вызов инструмента',
    );
    return '$_temp0';
  }

  @override
  String chatTurnMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сообщения',
      many: '$count сообщений',
      few: '$count сообщения',
      one: '$count сообщение',
    );
    return '$_temp0';
  }

  @override
  String chatTurnThoughts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count блока размышлений',
      many: '$count блоков размышлений',
      few: '$count блока размышлений',
      one: '$count блок размышлений',
    );
    return '$_temp0';
  }

  @override
  String get chatMe => 'Я';

  @override
  String chatGoalSemantics(String objective) {
    return 'Цель, $objective';
  }

  @override
  String chatGoalStateSemantics(String objective, String state) {
    return 'Цель, $objective, $state';
  }

  @override
  String chatTodoItemSemantics(String content, String state) {
    return '$content, $state';
  }

  @override
  String chatMentionSemantics(String kind, String label) {
    return '$kind: $label';
  }

  @override
  String chatArtifactSemantics(String name, String description) {
    return '$name, $description';
  }

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonRetry => 'Повторить';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonCopied => 'Скопировано';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonSettings => 'Настройки';

  @override
  String get commonBack => 'Назад';

  @override
  String get commonCopy => 'Копировать';

  @override
  String get commonDone => 'Готово';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonInstall => 'Установить';

  @override
  String get commonShare => 'Поделиться';

  @override
  String get commonAdd => 'Добавить';

  @override
  String get commonEdit => 'Изменить';

  @override
  String get commonClear => 'Очистить';

  @override
  String get commonCollapse => 'Свернуть';

  @override
  String get commonEnable => 'Включить';

  @override
  String get commonOpen => 'Открыть';

  @override
  String get commonDetails => 'Подробности';

  @override
  String get commonMore => 'Ещё';

  @override
  String get commonCreate => 'Создать';

  @override
  String get commonSend => 'Отправить';

  @override
  String get commonStop => 'Остановить';

  @override
  String get commonPaste => 'Вставить';

  @override
  String get commonHide => 'Скрыть';

  @override
  String get commonLater => 'Позже';

  @override
  String get commonConfirm => 'Подтвердить';

  @override
  String get commonRename => 'Переименовать';

  @override
  String get commonContinue => 'Продолжить';

  @override
  String get commonNotSet => 'Не задано';

  @override
  String get commonDefault => 'По умолчанию';

  @override
  String get commonSaved => 'Сохранено';

  @override
  String get commonSaveFailed => 'Не удалось сохранить';

  @override
  String get commonSaveFailedRetry => 'Не удалось сохранить. Повторите.';

  @override
  String get commonFailedTryAgain => 'Что-то пошло не так. Повторите.';

  @override
  String get commonEngineUnreachable => 'Движок недоступен';

  @override
  String get commonStorageFull => 'Не хватает места';

  @override
  String get commonConnectionFailed => 'Не удалось подключиться';

  @override
  String get commonCopyLink => 'Копировать ссылку';

  @override
  String get commonOpenWith => 'Открыть в другом приложении';

  @override
  String get commonOpenInWeb => 'Открыть в DSH Web';

  @override
  String get commonUntitledChat => 'Чат без названия';

  @override
  String get commonNewChat => 'Новый чат';

  @override
  String get commonYesterday => 'Вчера';

  @override
  String get commonSignedIn => 'Вы вошли';

  @override
  String get commonSignIn => 'Войти';

  @override
  String get commonSignOut => 'Выйти';

  @override
  String get commonThisPhone => 'Этот телефон';

  @override
  String get commonRemoteHost => 'Удалённый хост';

  @override
  String get commonWeb => 'Web';

  @override
  String get commonFollowSystem => 'Системная';

  @override
  String get commonLight => 'Светлая';

  @override
  String get commonDark => 'Тёмная';

  @override
  String get commonInProgress => 'В процессе';

  @override
  String get commonCompleted => 'Завершено';

  @override
  String get commonStopped => 'Остановлено';

  @override
  String get commonCancelled => 'Отменено';

  @override
  String get commonRunning => 'Работает';

  @override
  String get commonPaused => 'Приостановлено';

  @override
  String get commonDeclined => 'Отклонено';

  @override
  String get commonFailed => 'Ошибка';

  @override
  String get commonStopping => 'Остановка';

  @override
  String get commonWaitingApproval => 'Нужно подтверждение';

  @override
  String get commonWaitingAnswer => 'Нужен ваш ответ';

  @override
  String get commonNotConnected => 'Нет подключения';

  @override
  String get commonInstalled => 'Установлено';

  @override
  String get commonName => 'Название';

  @override
  String get commonStatus => 'Состояние';

  @override
  String get commonVersion => 'Версия';

  @override
  String get commonOther => 'Другое';

  @override
  String get commonPin => 'Закрепить';

  @override
  String get commonReply => 'Ответить';

  @override
  String get commonUpdate => 'Обновить';

  @override
  String get commonViewLogs => 'Показать логи';

  @override
  String commonItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента',
      many: '$count элементов',
      few: '$count элемента',
      one: '$count элемент',
    );
    return '$_temp0';
  }

  @override
  String commonMonthDay(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'янв',
      '2': 'фев',
      '3': 'мар',
      '4': 'апр',
      '5': 'мая',
      '6': 'июн',
      '7': 'июл',
      '8': 'авг',
      '9': 'сен',
      '10': 'окт',
      '11': 'ноя',
      '12': 'дек',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String get engineNewChatDefaultsLast => 'Настройки нового чата (последний выбор)';

  @override
  String get engineNewChatDefaultsFixed => 'Настройки нового чата (фиксированные)';

  @override
  String get engineNewChatUseLast => 'Последний выбор';

  @override
  String get engineNewChatUseFixed => 'Фиксированный по умолчанию';

  @override
  String get engineNewChatDefaultsHint =>
      'Сохраняется на текущем хосте; влияет только на модель и глубину размышлений новых чатов. У разрешений своя отдельная настройка, и временные разрешения сессии в неё не переносятся.';

  @override
  String get engineNewChatDefaultsLegacy =>
      'Этот движок умеет запоминать только последний выбор, а не фиксированные настройки. Он не может подтвердить, что настройки сохранились при смене модели.';

  @override
  String get engineNewChatDefaultsUnsupported => 'На этом хосте нет редактируемых настроек модели по умолчанию';

  @override
  String get engineNewChatDefaultsSelectionUnavailable =>
      'Эта модель или глубина размышлений больше недоступна. Выберите заново.';

  @override
  String get engineNewChatDefaultsInheritedEffort =>
      'Базовые настройки хоста задают глубину размышлений, которую здесь нельзя сбросить для модели без размышлений. Сначала измените конфигурацию хоста.';

  @override
  String get engineNewChatDefaultsSaving => 'Сохранение и проверка настроек…';

  @override
  String get engineNewChatDefaultsUnconfirmed =>
      'Не удалось подтвердить все настройки. Обновите и проверьте модель и глубину размышлений; возможно, их изменили базовые настройки хоста или другой клиент.';

  @override
  String get engineModelDefaultSaveFailed =>
      'Модель этого чата изменилась, но настройки нового чата не сохранились. Проверьте Настройки › Модели и повторите.';

  @override
  String get engineAccountSignedIn => 'Вход в DeepSeek выполнен';

  @override
  String get engineAccountSignOutTitle => 'Выйти из DeepSeek?';

  @override
  String get engineAccountSignOutBusy =>
      'Некоторые задачи используют модели аккаунта. Выход прервёт их сразу. Ваши чаты и файлы останутся.';

  @override
  String get engineAccountSignOutBody =>
      'Модели аккаунта станут недоступны. Ваши чаты, файлы и ключ API останутся. Войти снова можно в любое время.';

  @override
  String get engineAccountSignOutUnknown =>
      'Не удалось проверить, используют ли задачи модели аккаунта. Выход прервёт те, которые используют.';

  @override
  String get engineAccountSignOutFailed => 'Не удалось выйти. Повторите позже.';

  @override
  String get engineAccountTitle => 'Аккаунт';

  @override
  String get engineAccountRefresh => 'Обновить';

  @override
  String get engineAccountDeepSeek => 'Аккаунт DeepSeek';

  @override
  String get engineAccountProfileUnavailable => 'Сейчас не удаётся загрузить данные аккаунта';

  @override
  String get engineAccountBalance => 'Баланс';

  @override
  String get engineAccountBalanceHint => 'Модели аккаунта оплачиваются с баланса';

  @override
  String get engineAccountBalanceEngineOff => 'Запустите движок, чтобы увидеть баланс';

  @override
  String get engineAccountTopUp => 'Пополнить';

  @override
  String get engineAccountUsageDetails => 'Детали использования';

  @override
  String get engineAccountToppedUpBalance => 'Пополненный баланс';

  @override
  String get engineAccountGrantedBalance => 'Начисленный баланс';

  @override
  String get engineAccountBalanceUnavailable => 'Сейчас не удаётся загрузить баланс';

  @override
  String get engineAccountNoKeyNeeded => 'При входе ключ API не нужен';

  @override
  String get engineAccountUnsupported => 'Этот движок не поддерживает вход в аккаунт';

  @override
  String get engineAccountSignInDeepSeek => 'Войти через DeepSeek';

  @override
  String get engineAccountAutoStart => 'При входе движок запустится автоматически';

  @override
  String get engineAccountReplaceKey => 'Заменить ключ';

  @override
  String get engineAccountClearKeyTitle => 'Очистить ключ API?';

  @override
  String get engineAccountClearKeyBody =>
      'Удалит ключ, сохранённый в приложении. Пока движок на этом телефоне работает, ключ в движке тоже будет удалён.';

  @override
  String get engineAccountBrowserFailed => 'Не удалось открыть браузер';

  @override
  String get engineAccountSignInSuccess => 'Вход выполнен';

  @override
  String get engineAccountAlmostReady => 'Почти готово';

  @override
  String get engineAccountStartingEngine => 'Запуск движка';

  @override
  String get engineAccountOpenSignInNext => 'Дальше откроется страница входа';

  @override
  String get engineAccountPreparingSignIn => 'Подготовка входа';

  @override
  String get engineAccountOpenDeepSeekNext => 'Открытие входа в DeepSeek';

  @override
  String get engineAccountFinishInBrowser => 'Завершите вход в браузере';

  @override
  String get engineAccountReturnToDsh => 'Вернитесь в DSH Go после входа';

  @override
  String get engineAccountFinishingSignIn => 'Завершение входа';

  @override
  String get engineAccountSavingSignIn => 'Сохранение данных входа';

  @override
  String get engineAccountAwaitingResult => 'Всё ещё ждём вход';

  @override
  String get engineAccountCopySignInLink => 'Копировать ссылку для входа';

  @override
  String get engineAccountReopenSignIn => 'Открыть вход заново';

  @override
  String get engineAccountCancelSignIn => 'Отменить вход';

  @override
  String get engineAccountSignInLinkCopied => 'Ссылка для входа скопирована';

  @override
  String get engineAccountSigningIn => 'Вход';

  @override
  String get engineAccountSignedOut => 'Вы вышли';

  @override
  String get engineAccountUsageFact => 'Использование оплачивается с баланса аккаунта';

  @override
  String get engineAccountBrowserFact => 'Вход через браузер. DSH никогда не видит ваш пароль';

  @override
  String get engineAccountCredentialsFact => 'Данные входа остаются на этом телефоне';

  @override
  String get engineSubagentTitle => 'Субагент';

  @override
  String get engineAgentLoopTitle => 'Цикл агента';

  @override
  String get engineShellTitle => 'Выполнение команд';

  @override
  String get engineSearchTitle => 'Веб-поиск';

  @override
  String get engineSearchNewApiBadge => 'Новый API';

  @override
  String get engineGeneralTitle => 'Общие';

  @override
  String get engineSettingsTitle => 'Настройки движка';

  @override
  String get engineSettingsReadFailed => 'Не удалось загрузить настройки';

  @override
  String get engineSettingsRun => 'Среда выполнения';

  @override
  String get engineSettingsPlugins => 'Плагины';

  @override
  String get engineSettingsPluginInventory => 'Список плагинов';

  @override
  String get engineSettingsPluginStopped => 'Плагин не запущен';

  @override
  String get engineSettingsEnablePlugin => 'Включите его, чтобы менять настройки';

  @override
  String get engineSettingsNoEditableFields => 'Здесь нечего настраивать';

  @override
  String get engineFieldRestoreDefault => 'Сбросить по умолчанию';

  @override
  String get engineFieldDecrease => 'Уменьшить';

  @override
  String get engineFieldIncrease => 'Увеличить';

  @override
  String get engineFieldRemove => 'Удалить';

  @override
  String get engineFieldShow => 'Показать';

  @override
  String get engineFieldFromEnvironment => 'Задано средой запуска';

  @override
  String get engineFieldItem => 'элемент';

  @override
  String get engineFieldAlreadyAdded => 'Уже добавлено';

  @override
  String get engineFieldEnterName => 'Введите имя';

  @override
  String get engineFieldEnterNumber => 'Введите число';

  @override
  String get engineFieldValue => 'Значение';

  @override
  String get engineFieldNew => 'Новое';

  @override
  String get engineFieldRequired => 'Обязательно';

  @override
  String get engineGeneralMissing => 'На этом хосте нет общих настроек';

  @override
  String get engineSettingsVersionRequired => 'Требуется DSH 0.2.1 или новее';

  @override
  String get engineGeneralWebDisplay => 'Отображение в вебе';

  @override
  String get engineGeneralWebSending => 'Отправка в вебе';

  @override
  String get engineGeneralData => 'Данные';

  @override
  String get engineSubagentModelsTitle => 'Модели субагентов';

  @override
  String get engineChatLogTitle => 'Журналы чатов';

  @override
  String get engineThinkingTranslationTitle => 'Перевод размышлений';

  @override
  String get enginePluginIndexesTitle => 'Индексы магазина плагинов';

  @override
  String get enginePermissionTitle => 'Разрешение';

  @override
  String get engineAgentPresetsTitle => 'Пресеты агентов';

  @override
  String get engineDefaultModelTitle => 'Модель по умолчанию';

  @override
  String get engineWebAppearanceTitle => 'Внешний вид веб-версии';

  @override
  String get engineLanguageTitle => 'Язык';

  @override
  String get engineFieldCommandTimeout => 'Тайм-аут команды';

  @override
  String get engineFieldMaxOutput => 'Лимит вывода';

  @override
  String get engineFieldMaxTimeout => 'Максимальный запрашиваемый тайм-аут';

  @override
  String get engineFieldMaxSpill => 'Лимит spill-файла';

  @override
  String get engineFieldGracePeriod => 'Отсрочка завершения';

  @override
  String get engineFieldDefaultCwd => 'Рабочая папка по умолчанию';

  @override
  String get engineFieldFollowChat => 'Следовать за чатом';

  @override
  String get engineSubagentMaxDepth => 'Максимальная глубина рекурсии';

  @override
  String get engineFieldLayersUnit => 'уров.';

  @override
  String get engineSubagentMaxActive => 'Макс. активных субагентов';

  @override
  String get engineFieldCountUnit => 'шт.';

  @override
  String get engineSubagentAllowModelChoice => 'Разрешить ИИ выбирать модели субагентов';

  @override
  String get engineSubagentAllowedModels => 'Доступные модели';

  @override
  String get engineAgentMaxParallelCalls => 'Параллельных вызовов инструментов за шаг';

  @override
  String get engineFieldSearchProvider => 'Служба поиска';

  @override
  String get engineFieldFetchProvider => 'Служба загрузки веб-страниц';

  @override
  String get engineFieldBaseUrl => 'URL службы';

  @override
  String get engineSearchMaxUses => 'Макс. поисков на запрос';

  @override
  String get engineFieldTimesUnit => 'раз';

  @override
  String get engineSearchHelperModel => 'Вспомогательная модель';

  @override
  String get engineFieldApiVersion => 'Версия API';

  @override
  String get engineFieldMaxTokens => 'Макс. длина вывода';

  @override
  String get engineSearchResultsPerSearch => 'Результатов на поиск';

  @override
  String get engineFieldResultsUnit => 'рез.';

  @override
  String get engineSearchSendOriginalQuestion => 'Добавлять ваш исходный вопрос в поисковые запросы';

  @override
  String get engineChatLogUpload => 'Отправлять журналы чатов в DeepSeek';

  @override
  String get engineTranslationProvider => 'Служба перевода';

  @override
  String get engineTranslationAccountPaid => 'Аккаунт DeepSeek (платно)';

  @override
  String get engineTranslationApiPaid => 'DeepSeek API (платно)';

  @override
  String get engineTranslationTargetLanguage => 'Целевой язык';

  @override
  String get engineTranslationFollowLanguage => 'Как язык интерфейса';

  @override
  String get engineTranslationLanguageHint => 'Введите auto или код языка, например zh, en или ja';

  @override
  String get enginePluginIndexSources => 'Источники индексов';

  @override
  String get enginePluginIndexUrl => 'URL индекса';

  @override
  String get engineFieldHttpUrlHint => 'URL, начинающийся с http:// или https://';

  @override
  String get enginePermissionNewChat => 'Разрешения для новых чатов';

  @override
  String get engineAgentDefaultPreset => 'Пресет агента по умолчанию';

  @override
  String get engineProviderTitle => 'Провайдер';

  @override
  String get engineModelTitle => 'Модель';

  @override
  String get engineFieldReasoningEffort => 'Глубина размышлений';

  @override
  String get engineGeneralShowCodingView => 'Показывать режим кода';

  @override
  String get engineGeneralWorkDetails => 'Детали работы';

  @override
  String get engineFieldCompact => 'Компактно';

  @override
  String get engineFieldStandard => 'Обычно';

  @override
  String get engineFieldDetailed => 'Подробно';

  @override
  String get engineFieldVerbose => 'Максимально подробно';

  @override
  String get engineGeneralCollapseTiming => 'Когда сворачивать детали работы';

  @override
  String get engineGeneralOnCompletion => 'По завершении';

  @override
  String get engineGeneralOnNewMessage => 'При новом сообщении';

  @override
  String get engineGeneralPerformanceUsage => 'Производительность и использование';

  @override
  String get engineGeneralLinkOpening => 'Открывать ссылки в';

  @override
  String get engineGeneralAppSidebar => 'Боковая панель приложения';

  @override
  String get engineGeneralDefaultBrowser => 'Браузер по умолчанию';

  @override
  String get engineGeneralBusySend => 'Отправка, пока ИИ работает';

  @override
  String get engineGeneralQueueSend => 'В очередь';

  @override
  String get engineGeneralSteerSend => 'Скорректировать';

  @override
  String get engineFieldTheme => 'Тема';

  @override
  String get engineFieldFontSize => 'Размер текста';

  @override
  String get engineFieldCodeFontSize => 'Размер шрифта кода';

  @override
  String get engineFieldTerminalFontSize => 'Размер шрифта терминала';

  @override
  String get engineFieldTextFont => 'Шрифт текста';

  @override
  String get engineFieldCodeFont => 'Шрифт кода';

  @override
  String get engineFieldTerminalFont => 'Шрифт терминала';

  @override
  String get engineFieldInterfaceLanguage => 'Язык интерфейса';

  @override
  String get engineFieldSecondsUnit => 'с';

  @override
  String get engineFieldBytesUnit => 'байт';

  @override
  String get engineFieldGreaterThanZero => 'Больше 0';

  @override
  String get engineFieldEnterNumeric => 'Введите число';

  @override
  String get engineFieldEnterInteger => 'Введите целое число';

  @override
  String get engineFieldInvalidFormat => 'Неверный формат';

  @override
  String get engineFieldAddress => 'Адрес';

  @override
  String get engineFieldToken => 'Токен';

  @override
  String get engineFieldService => 'Служба';

  @override
  String get engineFieldTimeout => 'Тайм-аут';

  @override
  String get engineFieldQuantity => 'Количество';

  @override
  String get engineFieldMaxUses => 'Макс. использований';

  @override
  String get engineFieldMaxRetries => 'Макс. повторов';

  @override
  String get engineFieldConcurrency => 'Параллельность';

  @override
  String get engineFieldInterval => 'Интервал';

  @override
  String get engineFieldPrompt => 'Промпт';

  @override
  String get engineFieldSystemPrompt => 'Системный промпт';

  @override
  String get engineFieldTemperature => 'Температура';

  @override
  String get engineFieldDebugMode => 'Режим отладки';

  @override
  String get engineFieldVerboseLogs => 'Подробные логи';

  @override
  String get engineFieldPath => 'Путь';

  @override
  String get engineFieldCwd => 'Рабочая папка';

  @override
  String get engineFieldCommand => 'Команда';

  @override
  String get engineFieldArguments => 'Аргументы';

  @override
  String get engineFieldEnvironment => 'Переменные среды';

  @override
  String get engineFieldHeaders => 'Заголовки';

  @override
  String get engineFieldProxy => 'Прокси';

  @override
  String get engineFieldAuto => 'Авто';

  @override
  String get engineFieldEnabled => 'Включено';

  @override
  String get engineFieldOn => 'Вкл.';

  @override
  String get engineFieldOff => 'Выкл.';

  @override
  String get engineFieldLow => 'Низкая';

  @override
  String get engineFieldMedium => 'Средняя';

  @override
  String get engineFieldHigh => 'Высокая';

  @override
  String get engineFieldMax => 'Максимум';

  @override
  String get engineFieldNone => 'Нет';

  @override
  String get engineFieldModified => 'Изменено';

  @override
  String get engineFieldLocked => 'Задано файлом конфигурации';

  @override
  String get engineFieldSharedWithModel => 'Общее с моделями';

  @override
  String get engineFieldNotConfigured => 'Не настроено';

  @override
  String get engineFieldConfigured => 'Настроено';

  @override
  String get engineSettingsMissing => 'На этом хосте такой настройки нет';

  @override
  String get engineSettingsPluginDisabled => 'Нужный плагин не включён';

  @override
  String get engineSettingsReadOnly => 'Настройки движка доступны только для чтения';

  @override
  String get engineSubagentSavedUnavailable => 'Сохранено, но сейчас недоступно';

  @override
  String get engineSubagentKeepOneModel => 'Оставьте хотя бы одну модель';

  @override
  String get engineSubagentLimits => 'Ограничения';

  @override
  String get engineSubagentModelSelection => 'Выбор модели';

  @override
  String get engineSubagentPickFirstModel => 'Выберите модель для применения';

  @override
  String get engineSubagentReadModelsFailed => 'Не удалось загрузить модели';

  @override
  String get engineSubagentNoModels => 'Моделей пока нет';

  @override
  String get engineSubagentConnectModel => 'Добавить провайдера';

  @override
  String get engineSearchDeepSeek => 'Поиск DeepSeek';

  @override
  String get engineSearchNewApi => 'Новый API поиска';

  @override
  String get engineProviderDeleteBody =>
      'Провайдер и его API-ключ будут удалены. Чатам, которые им пользуются, понадобится другая модель.';

  @override
  String get engineProviderReadFailed => 'Не удалось загрузить провайдеров';

  @override
  String get engineProviderGone => 'Этот провайдер удалён';

  @override
  String get engineProviderProtocol => 'Протокол';

  @override
  String get engineProviderEnterKey => 'Введите API-ключ';

  @override
  String get engineProviderIssues => 'Проблемы';

  @override
  String get engineProviderRejectedConfig => 'Движок отклонил некоторые настройки';

  @override
  String get engineProviderConnection => 'Подключение';

  @override
  String get engineProviderDefaultUrl => 'URL по умолчанию';

  @override
  String get engineProviderKeyNotRequired => 'Не требуется';

  @override
  String get engineProviderNoModels => 'Моделей пока нет';

  @override
  String get engineProviderWebConfigured => 'Настроено в DSH Web. Здесь можно посмотреть или удалить';

  @override
  String get engineProviderDelete => 'Удалить провайдера';

  @override
  String get engineProviderConfigFile => 'Задано файлом конфигурации движка. Здесь его нельзя удалить';

  @override
  String get engineProviderTesting => 'Проверка';

  @override
  String get engineProviderTestConnection => 'Проверить подключение';

  @override
  String get engineProviderKeyFirst => 'Сначала введите API-ключ';

  @override
  String get engineProviderNoDiscoveredModels => 'Сервис не вернул ни одной модели. Добавьте их вручную.';

  @override
  String get engineProviderNeedModel => 'Добавьте хотя бы одну модель';

  @override
  String get engineProviderEdit => 'Изменить провайдера';

  @override
  String get engineProviderAdd => 'Добавить провайдера';

  @override
  String get engineProviderBasicInfo => 'Основные сведения';

  @override
  String get engineProviderNameHint => 'напр. Мой шлюз';

  @override
  String get engineProviderCompatibleProtocol => 'Совместимый протокол';

  @override
  String get engineProviderKeepStoredKey => 'Сохранено. Оставьте пустым, чтобы не менять';

  @override
  String get engineProviderSaving => 'Сохранение';

  @override
  String get engineProviderWaitingEngine => 'Ожидание движка';

  @override
  String get engineProviderFetchingModels => 'Загрузка моделей';

  @override
  String get engineProviderFetchModels => 'Загрузить модели';

  @override
  String get engineProviderAddManually => 'Добавить вручную';

  @override
  String get engineProviderManualModel => 'Добавить модель вручную';

  @override
  String get engineProviderModelId => 'ID модели';

  @override
  String get engineProviderSelectModels => 'Выбрать модели';

  @override
  String get engineProviderSearchModels => 'Поиск моделей';

  @override
  String get engineProviderDeselectAll => 'Снять выбор со всех';

  @override
  String get engineProviderSelectAll => 'Выбрать все';

  @override
  String get engineProviderNoMatchingModels => 'Подходящих моделей нет';

  @override
  String get engineProviderAlreadyAdded => 'Добавлено';

  @override
  String get engineProviderReady => 'Готово';

  @override
  String get engineProviderMissingKey => 'Нет API-ключа';

  @override
  String get engineProviderMisconfigured => 'Неверная конфигурация';

  @override
  String get engineProviderInactive => 'Не включено';

  @override
  String get engineProviderConfiguredInWeb => 'Настроено в Web';

  @override
  String get engineProvidersTitle => 'Модели';

  @override
  String get engineProvidersNotConnected => 'Нет подключения к движку';

  @override
  String get engineProvidersStartEngine => 'Запустите движок, чтобы добавлять провайдеров';

  @override
  String get engineProvidersUnsupported => 'Этот хост не поддерживает своих провайдеров';

  @override
  String get engineProvidersNotConfiguredHere => 'Не настроено на этом хосте';

  @override
  String get engineProvidersSigningIn => 'Вход…';

  @override
  String get engineProvidersSignInOrKey => 'Войдите или введите API-ключ';

  @override
  String get engineProvidersOfficial => 'Официальные';

  @override
  String get engineProvidersSubscription => 'Подписки';

  @override
  String get engineProvidersCustom => 'Свои';

  @override
  String get engineProvidersCompatibleHint => 'Сервисы, совместимые с OpenAI и Anthropic';

  @override
  String get engineProvidersReadOnly => 'Настройки движка доступны только для чтения. Добавить провайдеров нельзя';

  @override
  String get engineSubscriptionSignOutBody => 'Его модели исчезнут из выбора моделей.';

  @override
  String get engineSubscriptionNoModels => 'Нет моделей';

  @override
  String get engineSubscriptionModelsFailed => 'Не удалось загрузить модели';

  @override
  String get engineSubscriptionPreparing => 'Подготовка…';

  @override
  String get engineSubscriptionCancelled => 'Вход отменён';

  @override
  String get engineSubscriptionIncomplete => 'Вход не завершён';

  @override
  String get engineSubscriptionWaitingSignIn => 'Ожидание входа…';

  @override
  String get engineSubscriptionReopen => 'Открыть заново';

  @override
  String get engineSubscriptionCode => 'Код подтверждения';

  @override
  String get engineSubscriptionWaitingVerification => 'Ожидание проверки…';

  @override
  String get engineSubscriptionCopyCode => 'Копировать код';

  @override
  String get engineSubscriptionOpenVerification => 'Открыть проверку';

  @override
  String get engineSubscriptionPasteRedirect => 'Вставьте URL перенаправления';

  @override
  String get engineSubscriptionPasteCode => 'Вставьте код авторизации';

  @override
  String get engineSubscriptionPasteHere => 'Вставьте здесь';

  @override
  String get engineSubscriptionConfirm => 'Подтвердить';

  @override
  String get engineSubscriptionTryAgain => 'Повторить';

  @override
  String engineAccountWelcome(String name) {
    return 'Добро пожаловать, $name';
  }

  @override
  String engineLayerCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count уровня',
      many: '$count уровней',
      few: '$count уровня',
      one: '$count уровень',
    );
    return '$_temp0';
  }

  @override
  String engineFieldDefaultValue(String value) {
    return 'По умолчанию: $value';
  }

  @override
  String engineFieldDefaultValueUnit(String value, String unit) {
    return 'По умолчанию: $value $unit';
  }

  @override
  String engineFieldCurrentValue(String value) {
    return 'Сейчас: $value';
  }

  @override
  String engineFieldRemoveItem(String name) {
    return 'Удалить $name';
  }

  @override
  String engineFieldAddItem(String item) {
    return 'Добавить $item';
  }

  @override
  String engineFieldItemIndex(int index) {
    return 'Элемент $index';
  }

  @override
  String engineFieldByteCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count байта',
      many: '$count байт',
      few: '$count байта',
      one: '$count байт',
    );
    return '$_temp0';
  }

  @override
  String engineFieldHours(String value) {
    return '$value ч';
  }

  @override
  String engineFieldMinutes(String value) {
    return '$value мин';
  }

  @override
  String engineFieldSeconds(String value) {
    return '$value с';
  }

  @override
  String engineFieldMilliseconds(String value) {
    return '$value мс';
  }

  @override
  String engineFieldPositiveMax(String max) {
    return 'Больше 0, до $max';
  }

  @override
  String engineFieldMin(String min) {
    return 'Не меньше $min';
  }

  @override
  String engineFieldMaxBound(String max) {
    return 'Не больше $max';
  }

  @override
  String engineFieldBelowMin(String min) {
    return 'Должно быть не меньше $min';
  }

  @override
  String engineFieldAboveMax(String max) {
    return 'Должно быть не больше $max';
  }

  @override
  String engineFieldMultiple(String step) {
    return 'Должно быть кратно $step';
  }

  @override
  String engineFieldMinCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не меньше $count символа',
      many: 'Не меньше $count символов',
      few: 'Не меньше $count символа',
      one: 'Не меньше $count символа',
    );
    return '$_temp0';
  }

  @override
  String engineFieldMaxCharacters(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не больше $count символа',
      many: 'Не больше $count символов',
      few: 'Не больше $count символа',
      one: 'Не больше $count символа',
    );
    return '$_temp0';
  }

  @override
  String engineSubagentUnavailableProvider(String provider) {
    return '$provider · Сейчас недоступно';
  }

  @override
  String engineProviderDeleteTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String engineProviderDeleteFailed(String error) {
    return 'Не удалось удалить: $error';
  }

  @override
  String engineProviderModelCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Модели · $count',
      many: 'Моделей · $count',
      few: 'Модели · $count',
      one: 'Модель · $count',
    );
    return '$_temp0';
  }

  @override
  String engineProviderContext(String size) {
    return 'Контекст $size';
  }

  @override
  String engineProviderTestPassed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Подключено · найдено $count модели',
      many: 'Подключено · найдено $count моделей',
      few: 'Подключено · найдено $count модели',
      one: 'Подключено · найдена $count модель',
    );
    return '$_temp0';
  }

  @override
  String engineProviderCompletedUrl(String url) {
    return 'Готово: $url';
  }

  @override
  String engineProviderSaveFailed(String error) {
    return 'Не удалось сохранить: $error';
  }

  @override
  String engineProviderCandidateCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Всего $count',
      many: 'Всего $count',
      few: 'Всего $count',
      one: 'Всего $count',
    );
    return '$_temp0';
  }

  @override
  String engineProviderAddModels(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Добавить $count модели',
      many: 'Добавить $count моделей',
      few: 'Добавить $count модели',
      one: 'Добавить $count модель',
    );
    return '$_temp0';
  }

  @override
  String engineProviderModels(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count модели',
      many: '$count моделей',
      few: '$count модели',
      one: '$count модель',
    );
    return '$_temp0';
  }

  @override
  String engineProvidersSummary(int total, int ready) {
    String _temp0 = intl.Intl.pluralLogic(
      total,
      locale: localeName,
      other: '$total провайдера',
      many: '$total провайдеров',
      few: '$total провайдера',
      one: '$total провайдер',
    );
    return '$_temp0 · готово: $ready';
  }

  @override
  String engineProvidersAccount(String name) {
    return 'Аккаунт · $name';
  }

  @override
  String engineProvidersSignedInAccount(String account) {
    return 'Вход выполнен · $account';
  }

  @override
  String engineSubscriptionSignIn(String provider) {
    return 'Войти в $provider';
  }

  @override
  String engineSubscriptionSignOutTitle(String provider) {
    return 'Выйти из $provider?';
  }

  @override
  String engineSubscriptionSignOutFailed(String error) {
    return 'Не удалось выйти: $error';
  }

  @override
  String engineSubscriptionCodeSemantics(String code) {
    return 'Код подтверждения $code';
  }

  @override
  String engineFieldItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента',
      many: '$count элементов',
      few: '$count элемента',
      one: '$count элемент',
    );
    return '$_temp0';
  }

  @override
  String engineFieldUseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count раза',
      many: '$count раз',
      few: '$count раза',
      one: '$count раз',
    );
    return '$_temp0';
  }

  @override
  String engineFieldResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count результата',
      many: '$count результатов',
      few: '$count результата',
      one: '$count результат',
    );
    return '$_temp0';
  }

  @override
  String engineFieldMinCharactersDecimal(String bound) {
    return 'Не меньше $bound символов';
  }

  @override
  String engineFieldMaxCharactersDecimal(String bound) {
    return 'Не больше $bound символов';
  }

  @override
  String engineLayerValue(String value) {
    return '$value уровней';
  }

  @override
  String engineFieldEnterPositiveRange(String max) {
    return 'Введите число больше 0 и не больше $max';
  }

  @override
  String engineFieldEnterBoundedRange(String min, String max) {
    return 'Введите число от $min до $max';
  }

  @override
  String get engineModelTokenLimits => 'Лимиты токенов';

  @override
  String get engineModelContextLength => 'Длина контекста';

  @override
  String get engineModelContextOverrideHint =>
      'Пустое поле — значение из каталога. Большее значение движок учитывает при оценке заполнения контекста и сжатия.';

  @override
  String get engineModelMaxOutput => 'Максимальный вывод';

  @override
  String engineModelDefaultSize(String size) {
    return 'По умолчанию: $size';
  }

  @override
  String get engineModelCapabilities => 'Возможности';

  @override
  String get engineModelInputType => 'Ввод';

  @override
  String get engineModelInputText => 'Текст';

  @override
  String get engineModelInputTextImage => 'Текст + изображение';

  @override
  String get engineModelThinking => 'Размышления';

  @override
  String get engineModelVision => 'Зрение';

  @override
  String get engineModelLevels => 'Доступные уровни';

  @override
  String get engineModelNeedLevel => 'Выберите хотя бы один уровень';

  @override
  String get engineFieldEditOnWeb => 'Изменить этот элемент в вебе';

  @override
  String get engineSettingsHostChanged => 'Хост изменился. Откройте настройки заново, чтобы редактировать.';

  @override
  String get engineSecretTargetChanged => 'Это поле изменилось. Откройте его заново, чтобы редактировать.';

  @override
  String engineSettingsGroupCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count настройки',
      many: '$count настроек',
      few: '$count настройки',
      one: '$count настройка',
    );
    return '$_temp0';
  }

  @override
  String get featuresCordisSubtitle => 'Динамические плагины · Очищаются при перезапуске движка';

  @override
  String get featuresCordisUnavailable => 'Cordis здесь недоступен';

  @override
  String get featuresCordisRemoteUnavailable => 'Недоступно через DSH Remote';

  @override
  String get featuresCordisReadFailed => 'Не удалось загрузить плагины';

  @override
  String get featuresCordisEmpty => 'Динамических плагинов пока нет';

  @override
  String get featuresCordisEmptyHint => 'Созданные плагины появятся здесь';

  @override
  String get featuresCurrentChat => 'Текущий чат';

  @override
  String get featuresOtherChats => 'Другие чаты';

  @override
  String featuresPresetDefaultSet(String name) {
    return 'Новые чаты будут использовать «$name»';
  }

  @override
  String get featuresPresetDefaultFailed => 'Не удалось сделать пресетом по умолчанию';

  @override
  String featuresPresetDeleteTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get featuresPresetDeleteHint => 'Он станет недоступен для новых чатов. Существующие чаты не изменятся.';

  @override
  String get featuresDeleted => 'Удалено';

  @override
  String get featuresDeleteFailed => 'Не удалось удалить';

  @override
  String get featuresPresetAlreadyDefault => 'По умолчанию для новых чатов';

  @override
  String get featuresPresetSetDefault => 'Использовать для новых чатов';

  @override
  String get featuresPresetViewConfig => 'Показать конфигурацию';

  @override
  String get featuresPresetDuplicate => 'Дублировать пресет';

  @override
  String get featuresPresetDefaultDeleteHint => 'Сначала назначьте другой пресет по умолчанию для новых чатов';

  @override
  String get featuresAgentPresets => 'Пресеты агента';

  @override
  String get featuresAgentPresetsSubtitle => 'Инструменты и поведение для новых чатов';

  @override
  String get featuresNew => 'Новый';

  @override
  String get featuresPresetsReadFailed => 'Не удалось загрузить пресеты агента';

  @override
  String get featuresLoadFailed => 'Не удалось загрузить';

  @override
  String get featuresNewChatDefault => 'По умолчанию для новых чатов';

  @override
  String get featuresEmptyDocument => '(Пусто)';

  @override
  String get featuresReadFailed => 'Не удалось прочитать';

  @override
  String featuresTodayTime(String time) {
    return 'Сегодня, $time';
  }

  @override
  String featuresTomorrowTime(String time) {
    return 'Завтра, $time';
  }

  @override
  String featuresYesterdayTime(String time) {
    return 'Вчера, $time';
  }

  @override
  String featuresScheduleSummaryNext(String rule, String time) {
    return '$rule · Далее $time';
  }

  @override
  String get featuresEnded => 'Завершено';

  @override
  String featuresScheduleSummaryEnded(String time) {
    return 'Завершено · Выполнялось $time';
  }

  @override
  String featuresJobElapsed(String span) {
    return 'Выполняется $span';
  }

  @override
  String featuresJobDuration(String span) {
    return 'Заняло $span';
  }

  @override
  String get featuresPermissionReadOnly => 'Только чтение';

  @override
  String get featuresPermissionWorkspaceWrite => 'Запись в рабочую папку';

  @override
  String get featuresPermissionFullAccess => 'Полный доступ';

  @override
  String get featuresPermissionAutoReview => 'Автопроверка';

  @override
  String get featuresPermissionCustom => 'Свои';

  @override
  String get featuresPermissionReadOnlyHint => 'Просмотр файлов без изменений';

  @override
  String get featuresPermissionWorkspaceWriteHint =>
      'Изменение файлов в рабочей папке; перед выходом за её пределы спросит';

  @override
  String get featuresPermissionFullAccessHint => 'Выполнять без вопросов';

  @override
  String get featuresPermissionAutoReviewHint => 'Модель проверяет каждое действие и спрашивает при сомнении';

  @override
  String get featuresPresetStandard => 'Обычный режим';

  @override
  String get featuresPresetPtc => 'Режим PTC';

  @override
  String get featuresPresetMinimal => 'Минимальный режим';

  @override
  String get featuresPresetCreator => 'Режим создателя';

  @override
  String get featuresPresetStandardDescription => 'Код, файлы и исследование для большинства задач';

  @override
  String get featuresPresetPtcDescription => 'Пакетные вызовы инструментов, затем фильтрация, анализ и сводка';

  @override
  String get featuresPresetMinimalDescription => 'Только терминал и просмотр изображений, для тестов и сравнения';

  @override
  String get featuresPresetCreatorDescription => 'Агент пишет плагины для настройки DSH';

  @override
  String featuresHostUnreachable(String name) {
    return 'Не удаётся подключиться к «$name»';
  }

  @override
  String featuresHostConnecting(String name) {
    return 'Подключение к «$name»…';
  }

  @override
  String get featuresJobs => 'Фоновые задачи';

  @override
  String get featuresJobsSubtitle => 'Очищаются при перезапуске движка';

  @override
  String get featuresJobsReadFailed => 'Не удалось загрузить фоновые задачи';

  @override
  String get featuresJobsEmpty => 'Фоновых задач нет';

  @override
  String get featuresJobsEmptyHint => 'Здесь появятся такие команды, как dev-серверы';

  @override
  String featuresJobsEndedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Завершено · $count',
      many: 'Завершено · $count',
      few: 'Завершено · $count',
      one: 'Завершено · $count',
    );
    return '$_temp0';
  }

  @override
  String get featuresJobStopTitle => 'Остановить эту задачу?';

  @override
  String get featuresJobAlreadyEnded => 'Эта задача уже завершена';

  @override
  String get featuresJobStopFailed => 'Не удалось остановить';

  @override
  String get featuresJobOutput => 'Вывод задачи';

  @override
  String get featuresOutput => 'Вывод';

  @override
  String featuresJobRecentLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Последние $count строки',
      many: 'Последние $count строк',
      few: 'Последние $count строки',
      one: 'Последняя $count строка',
    );
    return '$_temp0';
  }

  @override
  String get featuresJobOutputSubject => 'Вывод задачи DSH';

  @override
  String get featuresJobOutputReadFailed => 'Не удалось прочитать вывод';

  @override
  String get featuresJobOutputWaiting => 'Ожидание вывода…';

  @override
  String get featuresJobOutputEmpty => 'Вывода нет';

  @override
  String get featuresPermissionAutoTitle => 'Включить автопроверку?';

  @override
  String get featuresPermissionAutoWarning => 'Модель сама решает, разрешать ли каждое действие. Она может ошибиться.';

  @override
  String get featuresSwitchFailed => 'Не удалось переключить';

  @override
  String get featuresPermissions => 'Разрешения';

  @override
  String get featuresPermissionsSubtitle => 'Выберите, когда спрашивать перед выполнением команд или изменением файлов';

  @override
  String get featuresPermissionsReadFailed => 'Не удалось загрузить разрешения';

  @override
  String get featuresPermissionCustomHint => 'Выбор пресета заменит ваши настройки разрешений';

  @override
  String get featuresModuleInstructions => 'Инструкции рабочей папки';

  @override
  String get featuresModuleTime => 'Учёт времени';

  @override
  String get featuresModuleBash => 'Инструмент команд Bash';

  @override
  String get featuresModulePersistentBash => 'Постоянный инструмент Bash';

  @override
  String get featuresModulePowerShell => 'Инструмент команд PowerShell';

  @override
  String get featuresModuleFiles => 'Инструмент чтения и записи файлов';

  @override
  String get featuresModuleFileSearch => 'Инструмент поиска файлов';

  @override
  String get featuresModuleJobs => 'Инструмент фоновых задач';

  @override
  String get featuresModuleSchedule => 'Инструмент автоматизации';

  @override
  String get featuresModuleLocalSkills => 'Загрузка локальных навыков';

  @override
  String get featuresModuleSkillTool => 'Инструмент загрузки навыков';

  @override
  String get featuresModuleGoalCommand => 'Команда управления целями';

  @override
  String get featuresModuleGoalTool => 'Инструмент управления целями';

  @override
  String get featuresModulePlan => 'Режим плана';

  @override
  String get featuresModuleCompaction => 'Сжатие контекста';

  @override
  String get featuresModuleCompactCommand => 'Команда сжатия контекста';

  @override
  String get featuresModuleAskUser => 'Инструмент «Спросить пользователя»';

  @override
  String get featuresModuleTodo => 'Инструмент списка задач';

  @override
  String get featuresModuleWeb => 'Инструмент веб-поиска и загрузки';

  @override
  String get featuresModulePresent => 'Инструмент передачи файлов';

  @override
  String get featuresModuleCordis => 'Инструмент поиска в API плагинов';

  @override
  String get featuresModuleSubagent => 'Инструмент делегирования субагентам';

  @override
  String get featuresModuleSubagentControl => 'Инструмент управления субагентами';

  @override
  String get featuresModuleWorkflow => 'Инструмент рабочих процессов';

  @override
  String get featuresModulePluginManager => 'Инструмент управления плагинами';

  @override
  String get featuresModulePluginMarket => 'Инструмент магазина плагинов';

  @override
  String get featuresModuleToolCalls => 'Стиль вызова инструментов';

  @override
  String get featuresModuleTerminal => 'Постоянная служба терминала';

  @override
  String get featuresModulePersona => 'Персона агента';

  @override
  String get featuresGroupDelegation => 'Делегирование субагентам';

  @override
  String get featuresGroupTerminal => 'Постоянный терминал';

  @override
  String get featuresPresetIdRequired => 'Введите ID';

  @override
  String get featuresPresetIdLength => 'До 40 символов';

  @override
  String get featuresPresetIdFormat => 'Строчные буквы, цифры и дефисы';

  @override
  String get featuresPresetIdTaken => 'Этот ID уже занят';

  @override
  String featuresPresetCopyName(String name) {
    return 'Копия $name';
  }

  @override
  String get featuresPresetBasedOn => 'На основе';

  @override
  String get featuresNameRequired => 'Введите название';

  @override
  String get featuresCreatorOpenFailed => 'Не удалось открыть режим создания';

  @override
  String get featuresPresetNameHint => 'Например: Ревью кода';

  @override
  String get featuresPresetId => 'ID';

  @override
  String get featuresPresetIdHint => 'Строчные буквы, цифры и дефисы';

  @override
  String get featuresPresetDescription => 'Описание';

  @override
  String get featuresPresetDescriptionHint => 'Опишите назначение одним предложением';

  @override
  String get featuresPresetConfigReadFailed => 'Не удалось загрузить конфигурацию пресета';

  @override
  String get featuresPresetCreateTitle => 'Новый пресет агента';

  @override
  String get featuresPresetDuplicateTitle => 'Дублировать пресет агента';

  @override
  String get featuresPresetEditTitle => 'Изменить пресет агента';

  @override
  String get featuresCreatorOpening => 'Открываю режим создания';

  @override
  String get featuresWaitingEngine => 'Жду движок';

  @override
  String get featuresCreatorUnavailable => 'Режим создания недоступен';

  @override
  String get featuresPresetStartUpdate => 'Начать обновление';

  @override
  String get featuresPresetStartCreate => 'Начать создание';

  @override
  String get featuresPresetSystemPrompt => 'Системный промпт';

  @override
  String get featuresPresetSystemPromptHint => 'Кто вы и как работаете';

  @override
  String get featuresPresetReplaceSystemPrompt => 'Заменить системный промпт целиком';

  @override
  String get featuresPresetTools => 'Инструменты';

  @override
  String get featuresSkills => 'Навыки';

  @override
  String get featuresPresetContextModes => 'Контекст и режимы';

  @override
  String get featuresCronMinute => 'Минуты';

  @override
  String get featuresCronHour => 'Часы';

  @override
  String get featuresDate => 'Дата';

  @override
  String get featuresCronMonth => 'Месяц';

  @override
  String get featuresCronWeekday => 'День недели';

  @override
  String get featuresCronRequired => 'Введите Cron-выражение из 5 полей';

  @override
  String get featuresCronWhitespace => 'Без пробелов в начале и конце';

  @override
  String featuresCronFieldCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ожидалось 5 полей, получено $count',
      many: 'Ожидалось 5 полей, получено $count',
      few: 'Ожидалось 5 полей, получено $count',
      one: 'Ожидалось 5 полей, получено $count',
    );
    return '$_temp0';
  }

  @override
  String featuresCronInvalidField(int index, String name) {
    return 'Поле $index ($name) неверно';
  }

  @override
  String get featuresWeekdayMon => 'Пн';

  @override
  String get featuresWeekdayTue => 'Вт';

  @override
  String get featuresWeekdayWed => 'Ср';

  @override
  String get featuresWeekdayThu => 'Чт';

  @override
  String get featuresWeekdayFri => 'Пт';

  @override
  String get featuresWeekdaySat => 'Сб';

  @override
  String get featuresWeekdaySun => 'Вс';

  @override
  String get featuresMonthJan => 'Январь';

  @override
  String get featuresMonthFeb => 'Февраль';

  @override
  String get featuresMonthMar => 'Март';

  @override
  String get featuresMonthApr => 'Апрель';

  @override
  String get featuresMonthMay => 'Май';

  @override
  String get featuresMonthJun => 'Июнь';

  @override
  String get featuresMonthJul => 'Июль';

  @override
  String get featuresMonthAug => 'Август';

  @override
  String get featuresMonthSep => 'Сентябрь';

  @override
  String get featuresMonthOct => 'Октябрь';

  @override
  String get featuresMonthNov => 'Ноябрь';

  @override
  String get featuresMonthDec => 'Декабрь';

  @override
  String featuresWeekdayName(String day) {
    return '$day';
  }

  @override
  String featuresCronWeekdayRange(String first, String last) {
    return '$first–$last';
  }

  @override
  String featuresCronEveryDay(String months) {
    return 'Каждый день$months';
  }

  @override
  String featuresCronMonthDays(String days, String months) {
    return 'Ежемесячно $days$months';
  }

  @override
  String featuresCronMonthDaysAndWeekdays(String days, String weekdays, String months) {
    return 'Ежемесячно $days, если $weekdays$months';
  }

  @override
  String featuresCronMonthDaysOrWeekdays(String days, String weekdays, String months) {
    return 'Ежемесячно $days или $weekdays$months';
  }

  @override
  String featuresCronHourRange(String first, String last) {
    return 'С $first по $last';
  }

  @override
  String get featuresEveryMinute => 'Каждую минуту';

  @override
  String featuresCronEveryMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Каждые $count минуты',
      many: 'Каждые $count минут',
      few: 'Каждые $count минуты',
      one: 'Каждую $count минуту',
    );
    return '$_temp0';
  }

  @override
  String get featuresEveryHour => 'Каждый час';

  @override
  String featuresCronHourlyMinutes(String minutes) {
    return 'В $minutes-ю минуту каждого часа';
  }

  @override
  String featuresCronHoursEveryMinute(String hours) {
    return 'Каждую минуту в часы $hours';
  }

  @override
  String featuresCronHoursEveryMinutes(String hours, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Каждые $count минуты в часы $hours',
      many: 'Каждые $count минут в часы $hours',
      few: 'Каждые $count минуты в часы $hours',
      one: 'Каждую $count минуту в часы $hours',
    );
    return '$_temp0';
  }

  @override
  String featuresCronEveryHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Каждые $count часа',
      many: 'Каждые $count часов',
      few: 'Каждые $count часа',
      one: 'Каждый $count час',
    );
    return '$_temp0';
  }

  @override
  String featuresCronHoursMinutes(String hours, String minutes) {
    return 'В $minutes-ю минуту в часы $hours';
  }

  @override
  String get featuresRepeatDaily => 'Ежедневно';

  @override
  String get featuresRepeatWeekdays => 'По будням';

  @override
  String get featuresRepeatWeekly => 'Еженедельно';

  @override
  String get featuresRepeatMonthly => 'Ежемесячно';

  @override
  String get featuresRepeatInterval => 'Интервал';

  @override
  String get featuresRepeatOnce => 'Один раз';

  @override
  String get featuresRepeatAdvanced => 'Дополнительно';

  @override
  String get featuresIntervalSeconds => 'Секунды';

  @override
  String get featuresZoneUnavailable => 'Часовой пояс недоступен';

  @override
  String get featuresChooseDay => 'Выберите хотя бы один день';

  @override
  String get featuresIntervalMinimum => 'Интервал должен быть не меньше 1';

  @override
  String get featuresMinimumMinute => 'Не меньше 1 минуты';

  @override
  String get featuresTimeDoesNotExist => 'Такого времени в этом часовом поясе нет';

  @override
  String get featuresChooseFutureTime => 'Выберите время в будущем';

  @override
  String get featuresCronNeverRuns => 'Это выражение никогда не срабатывает';

  @override
  String featuresRuleDaily(String time) {
    return 'Каждый день в $time';
  }

  @override
  String featuresRuleWeekdays(String time) {
    return 'По будням в $time';
  }

  @override
  String featuresRuleWeekends(String time) {
    return 'По выходным в $time';
  }

  @override
  String featuresRuleWeekly(String days, String time) {
    return 'По $days в $time';
  }

  @override
  String featuresRuleMonthly(String days, String time) {
    return 'Ежемесячно $days в $time';
  }

  @override
  String get featuresRepeat => 'Повтор';

  @override
  String get featuresChat => 'Чат';

  @override
  String get featuresWorkspace => 'Рабочая папка';

  @override
  String get featuresInstructionRequired => 'Введите инструкции';

  @override
  String featuresScheduleSaveError(String reason) {
    return 'Не удалось сохранить: $reason';
  }

  @override
  String featuresScheduleCreateError(String reason) {
    return 'Не удалось создать: $reason';
  }

  @override
  String get featuresScheduleNameHint => 'Например: Напоминание о планёрке';

  @override
  String get featuresScheduleInstruction => 'Инструкции';

  @override
  String get featuresScheduleInstructionHint => 'Например: Суммируй вчерашние коммиты';

  @override
  String get featuresScheduleRunTime => 'Время запуска';

  @override
  String get featuresScheduleOpenChat => 'Открыть чат';

  @override
  String get featuresScheduleEditTitle => 'Изменить автоматизацию';

  @override
  String get featuresScheduleCreateTitle => 'Новая автоматизация';

  @override
  String get featuresScheduleSaving => 'Сохранение';

  @override
  String get featuresScheduleCreating => 'Создание в чате';

  @override
  String get featuresTime => 'Время';

  @override
  String get featuresNotSelected => 'Не выбрано';

  @override
  String featuresMonthDaysLabel(String days) {
    return 'День $days';
  }

  @override
  String get featuresTimeZone => 'Часовой пояс';

  @override
  String get featuresScheduleRunLocation => 'Запускать в';

  @override
  String get featuresJustCreatedChat => 'Только что созданный чат';

  @override
  String get featuresModel => 'Модель';

  @override
  String get featuresRequestRefused => 'Движок не принял этот запрос';

  @override
  String get featuresScheduleNotFound => 'Эта автоматизация больше не существует';

  @override
  String get featuresScheduleEndedError => 'Эта автоматизация завершена, её нельзя изменить';

  @override
  String get featuresScheduleConflict => 'Автоматизация только что изменилась. Вернитесь и повторите.';

  @override
  String get featuresScheduleInvalidPrompt => 'Введите название и инструкции. Название — до 120 символов.';

  @override
  String get featuresScheduleInvalidTime => 'Неверное время запуска';

  @override
  String get featuresScheduleIntervalTooShort => 'Интервал должен быть не меньше 1 минуты';

  @override
  String get featuresScheduleTimeOutOfRange => 'Время вне допустимого диапазона';

  @override
  String get featuresScheduleSubagentError => 'Этот чат не может принимать автоматизации';

  @override
  String get featuresEvery => 'Каждые';

  @override
  String get featuresCronExpression => 'Cron-выражение';

  @override
  String get featuresCronFieldGuide => 'Мин  Час  День  Мес  День недели';

  @override
  String featuresZoneTimeSuffix(String city) {
    return ' (время $city)';
  }

  @override
  String get featuresScheduleNextLocal => 'Следующие запуски (время этого телефона)';

  @override
  String get featuresScheduleNext => 'Следующие запуски';

  @override
  String featuresMonthDayChoice(int day) {
    return 'День $day';
  }

  @override
  String get featuresZonesCommon => 'Популярные';

  @override
  String get featuresZonesAll => 'Все';

  @override
  String get featuresZoneSearchHint => 'Поиск городов, часовых поясов или смещений UTC';

  @override
  String get featuresZonesNoMatch => 'Нет подходящих часовых поясов';

  @override
  String get featuresZoneUTC => 'Всемирное координированное время';

  @override
  String get featuresZoneShanghai => 'Шанхай';

  @override
  String get featuresZoneUrumqi => 'Урумчи';

  @override
  String get featuresZoneHongKong => 'Гонконг';

  @override
  String get featuresZoneMacau => 'Макао';

  @override
  String get featuresZoneTaipei => 'Тайбэй';

  @override
  String get featuresZoneTokyo => 'Токио';

  @override
  String get featuresZoneSeoul => 'Сеул';

  @override
  String get featuresZoneSingapore => 'Сингапур';

  @override
  String get featuresZoneKualaLumpur => 'Куала-Лумпур';

  @override
  String get featuresZoneBangkok => 'Бангкок';

  @override
  String get featuresZoneHoChiMinh => 'Хошимин';

  @override
  String get featuresZoneJakarta => 'Джакарта';

  @override
  String get featuresZoneManila => 'Манила';

  @override
  String get featuresZoneKolkata => 'Колката';

  @override
  String get featuresZoneDubai => 'Дубай';

  @override
  String get featuresZoneJerusalem => 'Иерусалим';

  @override
  String get featuresZoneLondon => 'Лондон';

  @override
  String get featuresZoneDublin => 'Дублин';

  @override
  String get featuresZoneLisbon => 'Лиссабон';

  @override
  String get featuresZoneParis => 'Париж';

  @override
  String get featuresZoneBerlin => 'Берлин';

  @override
  String get featuresZoneMadrid => 'Мадрид';

  @override
  String get featuresZoneRome => 'Рим';

  @override
  String get featuresZoneAmsterdam => 'Амстердам';

  @override
  String get featuresZoneZurich => 'Цюрих';

  @override
  String get featuresZoneStockholm => 'Стокгольм';

  @override
  String get featuresZoneWarsaw => 'Варшава';

  @override
  String get featuresZoneAthens => 'Афины';

  @override
  String get featuresZoneIstanbul => 'Стамбул';

  @override
  String get featuresZoneMoscow => 'Москва';

  @override
  String get featuresZoneCairo => 'Каир';

  @override
  String get featuresZoneJohannesburg => 'Йоханнесбург';

  @override
  String get featuresZoneLagos => 'Лагос';

  @override
  String get featuresZoneNewYork => 'Нью-Йорк';

  @override
  String get featuresZoneToronto => 'Торонто';

  @override
  String get featuresZoneChicago => 'Чикаго';

  @override
  String get featuresZoneDenver => 'Денвер';

  @override
  String get featuresZonePhoenix => 'Финикс';

  @override
  String get featuresZoneLosAngeles => 'Лос-Анджелес';

  @override
  String get featuresZoneVancouver => 'Ванкувер';

  @override
  String get featuresZoneAnchorage => 'Анкоридж';

  @override
  String get featuresZoneMexicoCity => 'Мехико';

  @override
  String get featuresZoneBogota => 'Богота';

  @override
  String get featuresZoneLima => 'Лима';

  @override
  String get featuresZoneSantiago => 'Сантьяго';

  @override
  String get featuresZoneSaoPaulo => 'Сан-Паулу';

  @override
  String get featuresZoneBuenosAires => 'Буэнос-Айрес';

  @override
  String get featuresZoneHonolulu => 'Гонолулу';

  @override
  String get featuresZoneAuckland => 'Окленд';

  @override
  String get featuresZoneSydney => 'Сидней';

  @override
  String get featuresZoneMelbourne => 'Мельбурн';

  @override
  String get featuresZoneBrisbane => 'Брисбен';

  @override
  String get featuresZonePerth => 'Перт';

  @override
  String get featuresScheduleCreated => 'Создано';

  @override
  String get featuresSchedulesReadFailed => 'Не удалось загрузить автоматизации';

  @override
  String get featuresSchedulesEmpty => 'Автоматизаций пока нет';

  @override
  String get featuresSchedulesEmptyHint => 'Отправьте в чат и запускайте автоматически по расписанию';

  @override
  String get featuresScheduleNewTask => 'Новая автоматизация';

  @override
  String get featuresSchedulesNoMatch => 'Нет подходящих автоматизаций';

  @override
  String get featuresSchedulesNoActive => 'Нет активных автоматизаций';

  @override
  String get featuresSchedulesNoEnded => 'Нет завершённых автоматизаций';

  @override
  String get featuresSchedules => 'Автоматизации';

  @override
  String get featuresSchedulesSubtitle => 'Отправка в исходный чат по расписанию';

  @override
  String get featuresSchedulesSearch => 'Поиск автоматизаций';

  @override
  String featuresSchedulesAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Всего $count',
      many: 'Всего $count',
      few: 'Всего $count',
      one: 'Всего $count',
    );
    return '$_temp0';
  }

  @override
  String get featuresScheduleUntitled => 'Автоматизация без названия';

  @override
  String get featuresScheduleSent => 'Отправлено в чат';

  @override
  String get featuresView => 'Открыть';

  @override
  String get featuresSendFailed => 'Не удалось отправить';

  @override
  String get featuresScheduleDeleteTitle => 'Удалить эту автоматизацию?';

  @override
  String get featuresScheduleDeleteHint =>
      'Будущие запуски прекратятся, история запусков удалится. Исходный чат останется как есть.';

  @override
  String get featuresScheduleDeleted => 'Автоматизация удалена';

  @override
  String get featuresScheduleActive => 'Активна';

  @override
  String get featuresScheduleRun => 'Запуск';

  @override
  String get featuresScheduleNextRun => 'Следующий';

  @override
  String get featuresScheduleLastRun => 'Последний';

  @override
  String get featuresScheduleRule => 'Правило';

  @override
  String get featuresScheduleLinkedChat => 'Связанный чат';

  @override
  String get featuresScheduleChatDeleted => 'Чат удалён';

  @override
  String get featuresScheduleEdit => 'Изменить автоматизацию';

  @override
  String get featuresScheduleRunNow => 'Запустить сейчас';

  @override
  String get featuresScheduleHistory => 'История запусков';

  @override
  String get featuresScheduleNeverRun => 'Запусков пока нет';

  @override
  String get featuresScheduleHistoryUnavailable => 'История недоступна';

  @override
  String get featuresScheduleHistoryReadFailed => 'Не удалось загрузить историю запусков';

  @override
  String get featuresScheduleDelete => 'Удалить автоматизацию';

  @override
  String featuresExportSavedTo(String path) {
    return 'Сохранено в $path';
  }

  @override
  String get featuresExportTitle => 'Экспорт журналов чата';

  @override
  String get featuresExportSubtitle => 'ZIP для отзыва или резервной копии';

  @override
  String get featuresExportUnavailable => 'Экспорт недоступен через это подключение';

  @override
  String get featuresExportRemoteHint =>
      'Журналы недоступны через DSH Remote. Экспортируйте их из DSH Web на компьютере.';

  @override
  String get featuresExportShareHint => 'Прикрепите к отзыву или отправьте себе';

  @override
  String get featuresExportSaveDownloads => 'Сохранить в Загрузки';

  @override
  String get featuresExportDownloadsHint => 'Сохранить в Downloads/DSH-Go';

  @override
  String get featuresExportContents => 'Все записи и вложения из этого чата и его субагентов';

  @override
  String get featuresSkillUseHere => 'Использовать в чате';

  @override
  String get featuresSkillUseNew => 'Новый чат';

  @override
  String get featuresSkillsCallHint => 'Введите /имя-навыка, чтобы использовать';

  @override
  String get featuresSkillsReadFailed => 'Не удалось загрузить навыки';

  @override
  String get featuresSkillsEmpty => 'В этом чате пока нет навыков';

  @override
  String get featuresSkillsEmptyHint => 'Навыки из .dsh/skills появятся здесь';

  @override
  String get featuresSkillsSourceHint => 'Из папок навыков проекта и ~/.dsh';

  @override
  String featuresSkillUsage(String usage) {
    return 'Для: $usage';
  }

  @override
  String get featuresSkillManual => 'Только вручную';

  @override
  String featuresArtifactsSemantic(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выходные файлы, $count файла, показать все',
      many: 'Выходные файлы, $count файлов, показать все',
      few: 'Выходные файлы, $count файла, показать все',
      one: 'Выходные файлы, $count файл, показать все',
    );
    return '$_temp0';
  }

  @override
  String get featuresArtifactsTitle => 'Выходные файлы';

  @override
  String featuresArtifactsAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Всего $count',
      many: 'Всего $count',
      few: 'Всего $count',
      one: 'Всего $count',
    );
    return '$_temp0';
  }

  @override
  String featuresArtifactsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String get featuresArtifactsNoFiles => 'Файлов пока нет';

  @override
  String featuresArtifactsTotal(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла · Доставленные и созданные',
      many: '$count файлов · Доставленные и созданные',
      few: '$count файла · Доставленные и созданные',
      one: '$count файл · Доставленные и созданные',
    );
    return '$_temp0';
  }

  @override
  String get featuresArtifactsEmpty => 'Выходных файлов пока нет';

  @override
  String get featuresArtifactsEmptyHint => 'Здесь появятся файлы, доставленные или созданные ИИ';

  @override
  String get featuresListSeparator => ', ';

  @override
  String featuresErrorReason(String title, String reason) {
    return '$title: $reason';
  }

  @override
  String featuresYearDate(int year, String date) {
    return '$date $year';
  }

  @override
  String featuresDateWeekdayTime(String date, String week, String time) {
    return '$week, $date $time';
  }

  @override
  String featuresDateWeekday(String date, String day) {
    return '$day, $date';
  }

  @override
  String featuresOnceDescription(String rule, String date, String time) {
    return '$rule · $date $time';
  }

  @override
  String featuresCronMonthSuffix(String months) {
    return ' ($months)';
  }

  @override
  String featuresRuleIntervalSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Каждые $count секунды',
      many: 'Каждые $count секунд',
      few: 'Каждые $count секунды',
      one: 'Каждую $count секунду',
    );
    return '$_temp0';
  }

  @override
  String featuresRuleIntervalMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Каждые $count минуты',
      many: 'Каждые $count минут',
      few: 'Каждые $count минуты',
      one: 'Каждую $count минуту',
    );
    return '$_temp0';
  }

  @override
  String featuresRuleIntervalHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Каждые $count часа',
      many: 'Каждые $count часов',
      few: 'Каждые $count часа',
      one: 'Каждый $count час',
    );
    return '$_temp0';
  }

  @override
  String featuresSchedulesActiveCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'Активных: $count', one: 'Активных: 1');
    return '$_temp0';
  }

  @override
  String featuresSchedulesEndedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Завершённых: $count',
      one: 'Завершённых: 1',
    );
    return '$_temp0';
  }

  @override
  String featuresScheduleRetention(int days, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Последние $days дня',
      many: 'Последние $days дней',
      few: 'Последние $days дня',
      one: 'Последний $days день',
    );
    String _temp1 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'до $count записи',
      many: 'до $count записей',
      few: 'до $count записей',
      one: 'до $count записи',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String featuresScheduleRetentionUnknown(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Последние $days дня',
      many: 'Последние $days дней',
      few: 'Последние $days дня',
      one: 'Последний $days день',
    );
    return '$_temp0, предел записей недоступен';
  }

  @override
  String featuresArtifactsDeliveredTurn(int turn) {
    return 'Раунд $turn · Передано';
  }

  @override
  String featuresArtifactsGeneratedTurn(int turn) {
    return 'Раунд $turn · Создано';
  }

  @override
  String featuresPresetCreateRequest(String name, String id, String directory) {
    return 'Создать пресет агента «$name» ($id): запишите эти два файла дословно в рабочую папку, затем установите каталог `$directory` через install_bundle из plugin_manager. Больше ничего не делайте.\n\n';
  }

  @override
  String featuresPresetUpdateRequest(String name, String id, String replacing, String directory) {
    return 'Обновить пресет агента «$name» ($id): запишите эти два файла дословно в рабочую папку. Удалите бандл `$replacing` через plugin_manager, затем установите каталог `$directory` через install_bundle. Больше ничего не делайте.\n\n';
  }

  @override
  String featuresZoneThisPhone(String city) {
    return '$city · Этот телефон';
  }

  @override
  String get featuresPermissionResetHint => 'Значение по умолчанию для новых чатов больше не действует';

  @override
  String get featuresPermissionResetDefault => 'Вернуть по умолчанию';

  @override
  String get fileImageName => 'изображение';

  @override
  String get fileSharedText => 'Общий текст.txt';

  @override
  String get fileChatFallback => 'чат';

  @override
  String get hubSessionDetails => 'Детали чата';

  @override
  String get hubTerminal => 'Терминал';

  @override
  String get hubSessionNoTurns => 'Пока нет завершённых раундов';

  @override
  String get hubSessionElapsed => 'Время';

  @override
  String get hubSessionSteps => 'Шаги';

  @override
  String get hubSessionChangedFiles => 'Изменённые файлы';

  @override
  String get hubSessionTrajectoryHint => 'Здесь появятся шаги и время каждого раунда';

  @override
  String get hubSessionLoadEarlier => 'Загрузить прошлые раунды';

  @override
  String get hubSessionError => 'Ошибка';

  @override
  String get hubSessionInterrupted => 'Прервано';

  @override
  String get hubSessionOutputLimit => 'Достигнут лимит вывода';

  @override
  String get hubSessionNoChanges => 'Пока нет изменённых файлов';

  @override
  String get hubSessionShellChangesHint => 'Файлы, изменённые командами оболочки, здесь не показаны';

  @override
  String get hubSessionChanges => 'Изменения в чате';

  @override
  String get hubSessionChangesNote =>
      'Учитываются только изменения из загруженной истории, сделанные инструментами write и edit';

  @override
  String get hubSessionNoGoal => 'Пока нет цели и задач';

  @override
  String get hubSessionGoalHint => 'Для сложных дел ИИ составляет список задач. Следите за их ходом здесь';

  @override
  String get hubSessionGoal => 'Цель';

  @override
  String get hubSessionPlanMode => 'Режим планирования';

  @override
  String get hubSessionPlanSwitching => 'Переключение режима планирования';

  @override
  String get hubSessionPlanHint => 'ИИ сначала планирует, не изменяя файлы';

  @override
  String get hubSessionTodos => 'Задачи';

  @override
  String get hubSessionNotStarted => 'Не начато';

  @override
  String get hubSessionTurnUsage => 'Использование по раундам';

  @override
  String get hubSessionNoSubagents => 'Субагенты не запускались';

  @override
  String get hubSessionDelegations => 'История делегирования';

  @override
  String get hubTabTrajectory => 'Траектория';

  @override
  String get hubTabChanges => 'Изменения';

  @override
  String get hubTabFiles => 'Файлы';

  @override
  String get hubTabProgress => 'Ход работы';

  @override
  String get hubTabContext => 'Контекст';

  @override
  String get hubTabSubagents => 'Субагенты';

  @override
  String get hubPlugins => 'Плагины';

  @override
  String get hubSettingsFullAccessTitle => 'Включить полный доступ?';

  @override
  String get hubSettingsFullAccessBody => 'ИИ не будет спрашивать перед выполнением команд и изменением файлов.';

  @override
  String get hubSettingsStorageTitle => 'Разрешить ИИ доступ к файлам телефона?';

  @override
  String get hubSettingsStorageAllow => 'Разрешить доступ';

  @override
  String get hubSettingsStorageDenied =>
      'Доступ к памяти не предоставлен. Разрешите «Доступ ко всем файлам» для DSH Go в настройках системы и повторите попытку.';

  @override
  String get hubSettingsRestartRequired => 'Вступит в силу после перезапуска движка';

  @override
  String get hubSettingsRestartNow => 'Перезапустить';

  @override
  String get hubSettingsInterface => 'Интерфейс';

  @override
  String get hubSettingsChat => 'Чат';

  @override
  String get hubSettingsPhoneFiles => 'Доступ к файлам телефона';

  @override
  String get hubSettingsPhoneFilesHint => 'ИИ может читать и записывать данные в памяти телефона';

  @override
  String get hubSettingsVisualReplies => 'Визуальные ответы';

  @override
  String get hubSettingsVisualRepliesHint => 'Графики, сравнения и варианты для нажатия';

  @override
  String get hubSettingsPhoneControl => 'Управление телефоном';

  @override
  String get hubSettingsPreferences => 'Личные предпочтения';

  @override
  String get hubSettingsAppearance => 'Оформление';

  @override
  String get hubSettingsChatTextSize => 'Размер текста в чате';

  @override
  String get hubSettingsCollapseSteps => 'Сворачивать шаги после завершения';

  @override
  String get hubSettingsWebPhoneLayoutHint => 'Подгонять DSH Web под экран телефона';

  @override
  String get hubSettingsEngine => 'Локальный движок';

  @override
  String get hubSettingsProviders => 'Модели';

  @override
  String get hubSettingsShareConfig => 'Поделиться конфигурацией';

  @override
  String get hubSettingsAllFeatures => 'Все функции';

  @override
  String get hubSettingsCommunity => 'Сообщество';

  @override
  String get hubSettingsLicenses => 'Лицензии открытого кода';

  @override
  String get hubSettingsAccount => 'Аккаунт DeepSeek';

  @override
  String get hubSettingsSigningIn => 'Вход…';

  @override
  String get hubSettingsInvalidKey => 'Неверный ключ API. Не удалось проверить баланс';

  @override
  String get hubSettingsNoApiKey => 'Ключ API не задан';

  @override
  String get hubSettingsApiKeyHint => 'Добавьте ключ API, чтобы начать общение';

  @override
  String get hubSettingsSignInAccount => 'Войти в DeepSeek';

  @override
  String get hubSettingsOrApiKey => 'Или добавьте ключ API';

  @override
  String get hubPluginShare => 'Поделиться плагином';

  @override
  String get hubPluginDetails => 'О плагине';

  @override
  String get hubPluginFeatured => 'Рекомендовано на dshfind';

  @override
  String get hubPluginWebOnly => 'Только для веба';

  @override
  String get hubPluginStars => 'Звёзды';

  @override
  String get hubPluginSource => 'Источник';

  @override
  String get hubPluginInstalledVersion => 'Установленная версия';

  @override
  String get hubPluginRequiresDsh => 'Требуется DSH';

  @override
  String get hubPluginPackageName => 'Имя пакета';

  @override
  String get hubPluginHomepage => 'Домашняя страница';

  @override
  String get hubPluginRepository => 'Репозиторий';

  @override
  String get hubPluginManageTitle => 'Управление плагином';

  @override
  String get hubPluginManage => 'Управлять';

  @override
  String get hubPluginSafeModeInstall => 'Нельзя установить в безопасном режиме';

  @override
  String get hubPluginInstallCommand => 'Получить команду установки';

  @override
  String get hubPluginInstallComputer => 'Установить на компьютер';

  @override
  String get hubPluginInstalling => 'Установка…';

  @override
  String get hubPluginAllowBuilds => 'Разрешить скрипты и повторить';

  @override
  String get hubPluginRetryInstall => 'Повторить установку';

  @override
  String get hubPluginOfficial => 'Официальный DSH';

  @override
  String get hubPluginNotLoaded => 'Не удалось загрузить';

  @override
  String get hubPluginComponents => 'Компоненты';

  @override
  String get hubPluginSafeModeRemove => 'Удаление недоступно в безопасном режиме';

  @override
  String get hubPluginRemoveCommand => 'Получить команду удаления';

  @override
  String get hubPluginRemoveComputer => 'Удалить на компьютере';

  @override
  String get hubPluginUninstall => 'Удалить';

  @override
  String hubSessionTurns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count раунда',
      many: '$count раундов',
      few: '$count раунда',
      one: '$count раунд',
    );
    return '$_temp0';
  }

  @override
  String hubSessionTurnsRunning(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count раунда · Выполняется',
      many: '$count раундов · Выполняется',
      few: '$count раунда · Выполняется',
      one: '$count раунд · Выполняется',
    );
    return '$_temp0';
  }

  @override
  String hubSessionStepCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count шага',
      many: '$count шагов',
      few: '$count шага',
      one: '$count шаг',
    );
    return '$_temp0';
  }

  @override
  String hubSessionWaitTime(String duration) {
    return 'Ожидал вас $duration';
  }

  @override
  String hubSessionTurn(int turn) {
    return 'Раунд $turn';
  }

  @override
  String hubSessionFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изменено $count файла',
      many: 'Изменено $count файлов',
      few: 'Изменены $count файла',
      one: 'Изменён $count файл',
    );
    return '$_temp0';
  }

  @override
  String hubSessionEditCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Изменено $count раза',
      many: 'Изменено $count раз',
      few: 'Изменено $count раза',
      one: 'Изменено $count раз',
    );
    return '$_temp0';
  }

  @override
  String hubSessionTurnOf(int turn, int total) {
    return 'Раунд $turn / $total';
  }

  @override
  String hubSessionCacheHit(String percent) {
    return '$percent из кэша';
  }

  @override
  String get hubSessionBlocked => 'Заблокировано';

  @override
  String hubSessionBlockedReason(String reason) {
    return 'Заблокировано: $reason';
  }

  @override
  String hubSessionTodoSemantics(String content, String status) {
    return '$content, $status';
  }

  @override
  String get hubSettingsStorageBody =>
      'ИИ может читать и изменять ваши фото, загрузки и документы. Движок перезапустится один раз.';

  @override
  String hubSettingsBalance(String amount) {
    return 'Баланс $amount';
  }

  @override
  String hubSettingsBalanceLow(String amount) {
    return 'Баланс $amount · Мало средств';
  }

  @override
  String hubSettingsAccountSemantics(String title, String subtitle) {
    return 'Аккаунт: $title, $subtitle';
  }

  @override
  String hubSettingsHostSemantics(String name, String status) {
    return 'Удалённый хост: $name, $status';
  }

  @override
  String get hubSettingsApiKey => 'API-ключ DeepSeek';

  @override
  String hubPluginBrowserFailed(String address) {
    return 'Не удалось открыть браузер. Откройте $address вручную';
  }

  @override
  String hubPluginYearMonth(int year, String month) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'янв.',
      '2': 'февр.',
      '3': 'мар.',
      '4': 'апр.',
      '5': 'мая',
      '6': 'июн.',
      '7': 'июл.',
      '8': 'авг.',
      '9': 'сент.',
      '10': 'окт.',
      '11': 'нояб.',
      '12': 'дек.',
      'other': '$month',
    });
    return '$_temp0 $year';
  }

  @override
  String hubPluginUpdateTo(String version) {
    return 'Обновить до $version';
  }

  @override
  String hubPluginInstallOn(String host) {
    return 'Установить на $host';
  }

  @override
  String hubPluginComponentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count компонента',
      many: '$count компонентов',
      few: '$count компонента',
      one: '$count компонент',
    );
    return '$_temp0';
  }

  @override
  String get hubPluginComponentSeparator => ', ';

  @override
  String get hubGroupAi => 'ИИ';

  @override
  String get hubGroupCapabilities => 'Возможности';

  @override
  String get hubGroupGeneral => 'Общие';

  @override
  String get hubGroupHosts => 'Хосты';

  @override
  String get hubGroupHelp => 'Помощь и о приложении';

  @override
  String get hubPersonalization => 'Персонализация';

  @override
  String get hubPersonalizationAboutYou => 'О вас';

  @override
  String get hubPersonalizationReplies => 'Ответы';

  @override
  String get hubPersonalizationWorkStyle => 'Стиль работы';

  @override
  String get hubPrivacy => 'Приватность и общий доступ';

  @override
  String get hubPrivacySharing => 'Общий доступ';

  @override
  String get hubInterfaceHome => 'Главная';

  @override
  String get hubInterfaceWebHint => 'Собственное веб-приложение DSH';

  @override
  String get hubInterfaceOpenWeb => 'Открыть веб-приложение';

  @override
  String get hubInterfacePhoneLayout => 'Макет для телефона';

  @override
  String get hubTableTint => 'Заливка таблиц';

  @override
  String get hubTableTintFollow => 'Тема';

  @override
  String get hubTableTintFill => 'С заливкой';

  @override
  String get hubTableTintNone => 'Простой';

  @override
  String get hubTableTintFillHint => 'Чередование строк, удобнее читать длинные таблицы';

  @override
  String get hubTableTintFollowHint => 'Заливка только в шапке, остальное как в ответе';

  @override
  String get hubTableTintNoneHint => 'Только линии сетки, самый лёгкий';

  @override
  String get hubAbout => 'О DSH Go';

  @override
  String get hubAboutAuthor => 'Автор DSH Go';

  @override
  String get hubAboutBilibili => 'Профиль в Bilibili';

  @override
  String get hubAboutX => 'Профиль в X';

  @override
  String get hubAboutGithub => 'Профиль в GitHub';

  @override
  String get hubAboutNewVersion => 'Доступно обновление';

  @override
  String get hubValueSet => 'Задано';

  @override
  String get hubValueOff => 'Выкл.';

  @override
  String get hubValueOneStep => 'Остался один шаг';

  @override
  String get hubValueAllowed => 'Разрешено';

  @override
  String get hubValueNeedsSetup => 'Настроить';

  @override
  String hubValueHosts(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count хоста',
      many: '$count хостов',
      few: '$count хоста',
      one: '$count хост',
    );
    return '$_temp0';
  }

  @override
  String hubValuePlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count плагина',
      many: '$count плагинов',
      few: '$count плагина',
      one: '$count плагин',
    );
    return '$_temp0';
  }

  @override
  String get hubEngineStartup => 'Запуск';

  @override
  String get hubThemeLightDark => 'Светлая и тёмная';

  @override
  String get hubPermissionPhone => 'Телефон';

  @override
  String get hubPermissionPhoneConfirm => 'Подтверждение управления телефоном';

  @override
  String get hubHardwareEnterSends => 'Отправка клавишей Enter';

  @override
  String get hubHardwareEnterSendsHint =>
      'Если включено, Shift+Enter переносит строку. Экранная клавиатура сохраняет переносы; Ctrl/⌘+Enter отправляет всегда.';

  @override
  String get hubQuickPanel => 'Быстрые действия свайпом влево';

  @override
  String get hubQuickPanelSwipe => 'Открывать свайпом влево';

  @override
  String get hubQuickPanelSwipeHint =>
      'Смахните справа налево по чату. Блоки кода, таблицы и другой контент с горизонтальной прокруткой не затрагиваются.';

  @override
  String get hubQuickPanelItems => 'Что показывает';

  @override
  String get hubQuickPanelItemsNone => 'Ничего не выбрано: свайп влево не откроет панель';

  @override
  String get launchScreenTitle => 'Экран запуска';

  @override
  String get launchDefault => 'По умолчанию';

  @override
  String get launchCustom => 'Свой';

  @override
  String get launchFit => 'Вписать';

  @override
  String get launchFitFill => 'Заполнить';

  @override
  String get launchFitCenter => 'По центру';

  @override
  String get launchBackground => 'Фон';

  @override
  String get launchBackdropAuto => 'Авто';

  @override
  String get launchBackdropEdge => 'Из изображения';

  @override
  String get launchBackdropWhite => 'Белый';

  @override
  String get launchBackdropBlack => 'Чёрный';

  @override
  String get launchReplace => 'Заменить изображение или видео';

  @override
  String get launchPreview => 'Предпросмотр';

  @override
  String get launchFooter =>
      'Изображения и анимации до 8 МБ, видео до 30 МБ. Проигрывается один раз при холодном запуске; коснитесь, чтобы пропустить.';

  @override
  String get launchChanged => 'Экран запуска изменён';

  @override
  String launchChangedSize(String size) {
    return 'Экран запуска изменён · $size';
  }

  @override
  String get launchTooLarge => 'Изображение больше 8 МБ';

  @override
  String get launchOverLimit => 'Файл больше 30 МБ';

  @override
  String get launchUnsupported => 'Используйте PNG, JPEG, WebP, GIF или MP4';

  @override
  String get launchUnreadable => 'Не удалось прочитать этот файл';

  @override
  String get launchUnavailable => 'Не удалось открыть фотографии';

  @override
  String get launchBroken => 'Не читается';

  @override
  String get iconShortcutRow => 'Ярлык с изображением';

  @override
  String get iconShortcutRowSubtitle => 'Своё изображение на главном экране';

  @override
  String get iconShortcutPick => 'Выбрать изображение';

  @override
  String get iconShortcutChange => 'Другое изображение';

  @override
  String get iconShortcutHint => 'Перетащите или сожмите, чтобы подогнать';

  @override
  String get iconShortcutName => 'Название';

  @override
  String get iconShortcutAdd => 'Добавить на главный экран';

  @override
  String get iconShortcutNote =>
      'Android не позволяет приложению использовать любое изображение как иконку, поэтому создаётся отдельный ярлык, открывающий DSH Go. Некоторые главные экраны добавляют на его угол небольшой значок.';

  @override
  String get iconShortcutAdded => 'Добавлено на главный экран';

  @override
  String get iconShortcutConfirm => 'Подтвердите в появившемся окне';

  @override
  String get iconShortcutNoDialog =>
      'Окно не появилось? Разрешите DSH Go создавать ярлыки на главном экране в настройках системы.';

  @override
  String get iconShortcutSettings => 'Настройки';

  @override
  String get iconShortcutUnsupported => 'Этот главный экран не поддерживает ярлыки';

  @override
  String get iconShortcutFailed => 'Не удалось добавить. Попробуйте позже.';

  @override
  String get searchKwLaunchScreen => 'заставка,запуск,анимация запуска,экран открытия';

  @override
  String get searchKwIconShortcut => 'ярлык,своя иконка,изображение на главном экране';

  @override
  String get liveThinking => 'Размышляет';

  @override
  String get liveWorking => 'Работает';

  @override
  String get liveJuggling => 'Субагенты работают';

  @override
  String get liveSweeping => 'Сжимает контекст';

  @override
  String liveRunsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чата работает',
      many: '$count чатов работают',
      few: '$count чата работают',
      one: '$count чат работает',
    );
    return '$_temp0';
  }

  @override
  String get liveChipThinking => 'Размышляет';

  @override
  String get liveChipWorking => 'Работает';

  @override
  String get liveChipJuggling => 'Помощники';

  @override
  String get liveChipSweeping => 'Сжатие';

  @override
  String get liveChipApproval => 'Подтвердите';

  @override
  String get liveChipQuestion => 'Ответьте';

  @override
  String get liveChipDone => 'Готово';

  @override
  String get liveChipFailed => 'Ошибка';

  @override
  String get livePublicRunning => 'DSH работает';

  @override
  String get livePublicWaiting => 'DSH ждёт вас';

  @override
  String get livePublicDone => 'DSH завершил';

  @override
  String get livePublicFailed => 'В DSH произошла ошибка';

  @override
  String get liveSettingsTitle => 'Живая активность';

  @override
  String get liveSettingsSwitch => 'Показывать живую активность';

  @override
  String get liveSettingsSubtitle =>
      'Пока DSH работает, ждёт вас или управляет телефоном: значок в строке состояния и на экране блокировки, а на телефонах с «островком» — и там';

  @override
  String get liveSettingsFooter =>
      'Android 16 Live Updates. Показывается на Xiaomi HyperOS 3.1+, OPPO / OnePlus ColorOS 16, Honor MagicOS 10 и Pixel; vivo Atomic Island и Samsung Now Bar открыты только для приложений-партнёров.';

  @override
  String get liveUnsupported => 'Система этого телефона пока не поддерживает живые активности';

  @override
  String get liveBlockedTitle => 'Живые активности для DSH Go отключены';

  @override
  String get liveBlockedText =>
      'Включите живые активности для DSH Go в настройках системы (на некоторых телефонах это «Показывать в Live-оповещениях»)';

  @override
  String get localeTitle => 'Язык';

  @override
  String get localeSystem => 'Системный';

  @override
  String get localeZh => '简体中文';

  @override
  String get localeEn => 'English';

  @override
  String get localeRu => 'Русский';

  @override
  String get localEnvChooseTitle => 'Где запускать DSH?';

  @override
  String get localEnvChooseMessage => 'Это можно изменить позже в настройках';

  @override
  String localEnvThisPhoneDetail(int storage, int memory) {
    return '$storage МБ хранилища · $memory МБ памяти';
  }

  @override
  String localEnvThisPhoneDetailShort(int memory) {
    return '$memory МБ памяти во время работы';
  }

  @override
  String localEnvLowStorage(int needed) {
    return 'Нужно около $needed МБ свободного места';
  }

  @override
  String get localEnvRemoteDetail => 'DSH на вашем компьютере или сервере';

  @override
  String get localEnvRecommended => 'Рекомендуется';

  @override
  String get localEnvInstallTitle => 'Установить на этот телефон';

  @override
  String get localEnvInstallMessage => 'Запускать DSH прямо на этом телефоне';

  @override
  String localEnvFactStorage(int storage) {
    return 'Около $storage МБ хранилища';
  }

  @override
  String localEnvFactMemory(int memory) {
    return 'Около $memory МБ памяти во время работы';
  }

  @override
  String get localEnvUseRemote => 'Использовать удалённый хост';

  @override
  String get localEnvNotInstalled => 'На этом телефоне не установлено';

  @override
  String get localEnvUninstall => 'Удалить среду';

  @override
  String get localEnvUninstallHint => 'Освободить место';

  @override
  String get localEnvUninstallTitle => 'Удалить среду?';

  @override
  String get localEnvUninstallBody =>
      'Чаты, рабочие папки, плагины, настройки, настройки интерфейса и навыки на этом телефоне будут удалены.';

  @override
  String get localEnvUninstallConfirm => 'Удалить';

  @override
  String get localEnvUninstallFailed => 'Не удалось удалить. Повторите попытку.';

  @override
  String get localEnvPhoneNeedsRuntime => 'Доступно после установки на этот телефон';

  @override
  String get localEnvSignInNeedsRuntime => 'Нужен DSH на этом телефоне';

  @override
  String get localEnvSignInInstallFirst => 'Установите его, чтобы войти';

  @override
  String get marketSectionOfficial => 'Официальные';

  @override
  String get marketSectionAdapted => 'Для DSH Go';

  @override
  String get marketSectionAll => 'Все';

  @override
  String get marketSectionLoading => 'Загрузка…';

  @override
  String get marketSectionFailed => 'Официальный каталог не загрузился';

  @override
  String get marketSectionEmpty => 'Пока пусто';

  @override
  String get marketTierOfficial => 'Официальный';

  @override
  String get marketTierAdapted => 'Для DSH Go';

  @override
  String get marketRiskMedium => 'Средний риск';

  @override
  String get marketRiskHigh => 'Высокий риск';

  @override
  String get marketFlagInstallScripts => 'Запускает скрипты установки';

  @override
  String get marketFlagInstallScriptsBody =>
      'Запускает собственные скрипты пакета при установке (preinstall, install или postinstall)';

  @override
  String get marketFlagNativeCode => 'Нативный код';

  @override
  String get marketFlagNativeCodeBody =>
      'Содержит скомпилированный нативный код (.node, binding.gyp или бинарники), который нельзя прочитать как исходники';

  @override
  String get marketFlagShell => 'Выполняет команды';

  @override
  String get marketFlagShellBody => 'Код запускает системные команды (child_process)';

  @override
  String get marketFlagNetwork => 'Доступ в сеть';

  @override
  String get marketFlagNetworkBody => 'Код делает сетевые запросы (fetch, http, WebSocket)';

  @override
  String get marketFlagFilesystem => 'Запись вне рабочей папки';

  @override
  String get marketFlagFilesystemBody => 'Пишет по путям вне рабочей папки';

  @override
  String get marketFlagObfuscated => 'Сложно проверить';

  @override
  String get marketFlagObfuscatedBody =>
      'Содержит большие минифицированные или обфусцированные файлы; непонятно, что они делают';

  @override
  String get marketFlagNotAdapted => 'Не для DSH Go';

  @override
  String get marketFlagNotAdaptedBody =>
      'Не объявляет нативный протокол DSH Go, поэтому нативных экранов в приложении нет';

  @override
  String get marketFlagOtherBody => 'Ещё одна особенность, найденная автопроверками';

  @override
  String get marketChecksTitle => 'Автоматические проверки';

  @override
  String get marketChecksClean => 'Рискованных особенностей не найдено';

  @override
  String get marketChecksNote => 'Особенности, найденные автопроверками; это не значит, что плагин вредоносный';

  @override
  String marketCheckedOn(String date) {
    return 'Проверено $date';
  }

  @override
  String marketScreenshot(int index) {
    return 'Скриншот $index';
  }

  @override
  String marketRiskConfirmTitle(String name) {
    return 'У «$name» есть рискованные особенности';
  }

  @override
  String get marketRiskConfirmAction => 'Всё равно установить';

  @override
  String get marketPinnedVersion => 'Закреплённая версия';

  @override
  String get marketRequiresApp => 'Требуется DSH Go';

  @override
  String marketNeedsApp(String version) {
    return 'Нужен DSH Go $version или новее';
  }

  @override
  String get marketUpdateAvailable => 'Доступно обновление';

  @override
  String get marketBlockedTitle => 'Эта версия отозвана';

  @override
  String marketBlockedMessage(String version) {
    return 'Установленная версия $version отозвана из каталога плагинов. Рекомендуем её удалить.';
  }

  @override
  String get marketBlockedRow => 'Отозванная версия: рекомендуем удалить';

  @override
  String get marketBlockedBadge => 'Отозвана';

  @override
  String get marketVerifying => 'Проверяю версию…';

  @override
  String get marketMismatchTitle => 'Проверка версии не прошла';

  @override
  String marketMismatchMessage(String version) {
    return 'Версия $version на npm — не тот пакет, который проверил каталог плагинов. Ничего не установлено.';
  }

  @override
  String get marketSubmit => 'Предложить плагин';

  @override
  String get marketSubmitHint => 'На GitHub; появится в каталоге после автопроверок';

  @override
  String marketLinkNotFound(String name) {
    return '«$name» нет в каталоге плагинов';
  }

  @override
  String get marketVerificationUnavailableTitle => 'Не удалось проверить версию';

  @override
  String get marketVerificationUnavailableBody =>
      'npm не вернул данные о целостности. Установка не началась. Проверьте подключение и повторите.';

  @override
  String marketCombinedCount(int count) {
    return '$count плагинов';
  }

  @override
  String get mediaGenerateTile => 'Создать';

  @override
  String get mediaAiGenerated => 'Создано ИИ';

  @override
  String mediaCostEstimate(String amount) {
    return 'Около $amount';
  }

  @override
  String mediaSavedCount(int count) {
    return 'Сохранено в Галерею: $count';
  }

  @override
  String get mediaRegenerate => 'Создать заново';

  @override
  String get mediaCopyPrompt => 'Копировать запрос';

  @override
  String get mediaFileGone => 'Файл исчез';

  @override
  String get mediaKindImage => 'Изображение';

  @override
  String get mediaKindVideo => 'Видео';

  @override
  String get mediaTitleImage => 'Новое изображение';

  @override
  String get mediaTitleVideo => 'Новое видео';

  @override
  String get mediaOpenElsewhere => 'Открыть в другом приложении';

  @override
  String get mediaShowInFiles => 'Показать в файлах';

  @override
  String get mediaGenerating => 'Создание';

  @override
  String get mediaCancelled => 'Отменено';

  @override
  String get mediaNotGenerated => 'Не создано';

  @override
  String mediaPartial(int done, int total) {
    return '$done из $total';
  }

  @override
  String mediaCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изображения',
      many: '$count изображений',
      few: '$count изображения',
      one: '$count изображение',
    );
    return '$_temp0';
  }

  @override
  String mediaSeconds(int seconds) {
    return '$seconds с';
  }

  @override
  String mediaImageOf(int index, int count) {
    return 'Изображение $index из $count';
  }

  @override
  String mediaPageOf(int index, int count) {
    return '$index / $count';
  }

  @override
  String get mediaErrorPolicyInput => 'Описание не прошло проверку контента';

  @override
  String get mediaErrorPolicyOutput => 'Результат не прошёл проверку контента';

  @override
  String get mediaErrorAuth => 'Сервис не авторизован';

  @override
  String get mediaErrorBalance => 'Недостаточно средств';

  @override
  String get mediaErrorQuota => 'Лимит на сегодня исчерпан';

  @override
  String get mediaErrorUnavailable => 'Сервис пока недоступен';

  @override
  String get mediaErrorExpired => 'Результат просрочен';

  @override
  String get mediaErrorGeneric => 'Не удалось создать';

  @override
  String get mediaVary => 'Вариация';

  @override
  String get mediaEdit => 'Изменить';

  @override
  String get mediaRevise => 'Доработать';

  @override
  String get mediaUpscale => 'Увеличить разрешение';

  @override
  String get mediaMakeVideo => 'Сделать видео';

  @override
  String get mediaDetailModel => 'Модель';

  @override
  String get mediaDetailSize => 'Размер';

  @override
  String get mediaDetailCost => 'Стоимость';

  @override
  String get mediaDetailProvenance => 'Происхождение';

  @override
  String get mediaDetailFile => 'Файл';

  @override
  String mediaOriginalPrompt(String text) {
    return 'Исходный: $text';
  }

  @override
  String get mediaProvenanceC2pa => 'C2PA';

  @override
  String get mediaProvenanceImplicit => 'Встроенная';

  @override
  String get mediaProvenanceVisible => 'Видимая метка';

  @override
  String get mediaModeExit => 'Выйти из режима создания';

  @override
  String mediaModeLabel(String summary) {
    return 'Настройки создания: $summary';
  }

  @override
  String get mediaParamModel => 'Модель';

  @override
  String get mediaParamAspect => 'Пропорции';

  @override
  String get mediaParamCount => 'Количество';

  @override
  String get mediaParamQuality => 'Качество';

  @override
  String get mediaParamDuration => 'Длительность';

  @override
  String get mediaQualityAuto => 'Авто';

  @override
  String get mediaQualityStandard => 'Обычное';

  @override
  String get mediaQualityHigh => 'HD';

  @override
  String get mediaQuality4k => '4K';

  @override
  String get mediaQualityLevelLow => 'Низкое';

  @override
  String get mediaQualityLevelMedium => 'Среднее';

  @override
  String get mediaQualityLevelHigh => 'Высокое';

  @override
  String get mediaModelPick => 'Выбрать';

  @override
  String get mediaPickModelFirst => 'Сначала выберите модель';

  @override
  String mediaPricePerImage(String price) {
    return '$price / изображение';
  }

  @override
  String mediaPricePerSecond(String price) {
    return '$price / с';
  }

  @override
  String get mediaManageModels => 'Управлять';

  @override
  String get mediaHintImage => 'Опишите картинку…';

  @override
  String get mediaHintVideo => 'Опишите сцену и кадр…';

  @override
  String get mediaHintEdit => 'Как изменить…';

  @override
  String get mediaFirstFrame => 'Первый';

  @override
  String get mediaLastFrame => 'Последний';

  @override
  String get mediaNoLastFrame => 'Эта модель не принимает последний кадр';

  @override
  String get mediaNoRefs => 'Эта модель не принимает референсные изображения';

  @override
  String mediaRefLimit(int count) {
    return 'До $count референсных изображений';
  }

  @override
  String get mediaNoDescription => 'Сначала опишите';

  @override
  String get mediaDescriptionTooLong => 'Слишком длинно для создания. Сократите описание';

  @override
  String get mediaInstallTitle => 'Изображения и видео';

  @override
  String get mediaInstallBody => 'На этом хосте ещё нет плагина изображений и видео';

  @override
  String get mediaInstallAction => 'Установить на этот хост';

  @override
  String get mediaUnavailableTitle => 'Режим создания недоступен';

  @override
  String get mediaUnavailableBody =>
      'Плагин изображений и видео на этом хосте несовместим. Нужное по-прежнему можно описать в чате.';

  @override
  String get mediaUnavailableAction => 'Управление плагинами';

  @override
  String get mediaSettingsTitle => 'Изображения и видео';

  @override
  String get searchKwMediaGeneration =>
      'генерация изображений,текст в изображение,генерация видео,ИИ-арт,создать изображения,создать видео';

  @override
  String get mediaSettingsDefaults => 'По умолчанию';

  @override
  String get mediaSettingsLegacyDefault => 'Старая общая настройка по умолчанию';

  @override
  String get mediaSettingsLegacyDefaultHint =>
      'Настройка из 0.2.x; используется, если у типа нет своей настройки по умолчанию';

  @override
  String get mediaSettingsLegacyDefaultStale => 'Её сервис недоступен; очистите её, чтобы создание не сорвалось';

  @override
  String get mediaSettingsLegacyDefaultClear => 'Очистить старую общую настройку';

  @override
  String get mediaSettingsDefaultModel => 'Модель по умолчанию';

  @override
  String get mediaSettingsDefaultFooterLegacy =>
      'У более старого плагина одна модель по умолчанию; обновите его, чтобы задавать изображения и видео отдельно.';

  @override
  String get mediaSettingsDefaultsFooter =>
      'Выберите модель по умолчанию для изображений и для видео; оставьте «Авто», чтобы брать первую доступную.';

  @override
  String get mediaSettingsNoVideoModels => 'В каталоге этого хоста пока нет видеомоделей';

  @override
  String get mediaSettingsServices => 'Сервисы';

  @override
  String get mediaSettingsAddService => 'Добавить сервис';

  @override
  String get mediaSettingsAddServiceHint => 'Начните с пресета провайдера: адрес, протокол и модели заполнятся сами';

  @override
  String mediaSettingsServiceLimit(int count) {
    return 'До $count сервисов';
  }

  @override
  String get mediaSettingsNoServices => 'Сервисов пока нет. Добавьте провайдера, чтобы создавать изображения и видео.';

  @override
  String get mediaSettingsNoModels => 'Модели не выбраны';

  @override
  String get mediaSettingsKeyMissing => 'Нет API-ключа';

  @override
  String get mediaSettingsCatalogMissing =>
      'Плагин на этом хосте не предоставляет каталог моделей. Существующие сервисы можно редактировать, но добавить новый и выбрать модель по умолчанию пока нельзя.';

  @override
  String get mediaSettingsCatalogBroken =>
      'Каталог моделей не читается (возможно, версия несовместима). Существующие сервисы можно редактировать, но добавить новый и выбрать модель по умолчанию пока нельзя.';

  @override
  String get mediaSettingsCatalogEmpty =>
      'В каталоге моделей пока нет моделей. Существующие сервисы можно редактировать, но добавить новый и выбрать модель по умолчанию пока нельзя.';

  @override
  String get mediaSettingsNoPresets => 'В этом каталоге пока нет сервисов для добавления.';

  @override
  String get mediaSettingsLimits => 'Лимиты запросов';

  @override
  String get mediaSettingsLimitsHint =>
      'Ограничивает изображения и байты на запрос; по умолчанию действуют жёсткие лимиты плагина';

  @override
  String get mediaSettingsMaxImages => 'Изображений на запрос';

  @override
  String get mediaSettingsMaxImageBytes => 'Максимум байт на оригинал';

  @override
  String get mediaSettingsMaxResponseBytes => 'Максимум байт ответа провайдера';

  @override
  String get mediaSettingsMaxTotalImageBytes => 'Максимум байт изображений на запрос';

  @override
  String get mediaSettingsMaxVideoBytes => 'Максимум байт видео';

  @override
  String get mediaSettingsBudget => 'Защита от расходов';

  @override
  String get mediaSettingsDailyBudget => 'Дневной бюджет (юани)';

  @override
  String get mediaSettingsDailyBudgetHint =>
      'Сбрасывается по шанхайской дате; когда бюджет исчерпан, генерация приостанавливается';

  @override
  String get mediaSettingsUnknownPriceHold => 'Резерв на запрос при неизвестной цене (юани)';

  @override
  String get mediaSettingsUnknownPriceHoldHint => 'Резервируется на каждый запрос; это не лимит списания у провайдера';

  @override
  String get mediaSettingsApiKey => 'API-ключ';

  @override
  String get mediaSettingsReuseKey => 'Использовать тот же ключ';

  @override
  String get mediaSettingsReuseKeyHint =>
      'Изображения и видео одного провайдера могут использовать один API-ключ — вводить его снова не нужно.';

  @override
  String get mediaSettingsReuseKeyNone => 'Других сервисов этого провайдера пока нет.';

  @override
  String get mediaSettingsReuseKeyShared => 'Общий';

  @override
  String get mediaSettingsModels => 'Модели';

  @override
  String get mediaSettingsModelsEmpty => 'В каталоге нет моделей для этого протокола';

  @override
  String get mediaSettingsModelKeepOne => 'Оставьте хотя бы одну модель';

  @override
  String get mediaSettingsModelMissing => 'Нет в каталоге';

  @override
  String get mediaSettingsAdvanced => 'Дополнительно';

  @override
  String get mediaSettingsBaseUrl => 'Базовый URL API';

  @override
  String get mediaSettingsBaseUrlInvalid => 'Адрес должен начинаться с https://';

  @override
  String get mediaSettingsProvider => 'ID провайдера';

  @override
  String get mediaSettingsKeyRef => 'Имя учётных данных';

  @override
  String get mediaSettingsKeyRefInvalid => 'Только буквы, цифры и подчёркивания';

  @override
  String get mediaSettingsResponseFormat => 'Формат ответа';

  @override
  String get mediaSettingsResponseFormatAuto => 'По протоколу';

  @override
  String get mediaSettingsServiceId => 'ID сервиса';

  @override
  String get mediaSettingsServiceGone => 'Этот сервис удалён';

  @override
  String get mediaSettingsServiceGoneBody =>
      'Возможно, его удалили в другом месте. Вернитесь, чтобы добавить его снова.';

  @override
  String get mediaSettingsDelete => 'Удалить сервис';

  @override
  String mediaSettingsDeleteTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get mediaSettingsDeleteBody =>
      'Удаляется только запись сервиса на этом хосте; API-ключ сохраняется. Значения по умолчанию, указывавшие на него, тоже сбрасываются.';

  @override
  String get mediaSettingsNoImageModels => 'В каталоге пока нет моделей изображений';

  @override
  String get mediaSettingsNoAvailableService => 'Пока нет готового сервиса (добавьте его и введите ключ)';

  @override
  String get mediaSettingsNoImageService => 'Пока нет готового сервиса изображений (добавьте его и введите ключ)';

  @override
  String get mediaSettingsNoVideoService => 'Пока нет готового сервиса видео (добавьте его и введите ключ)';

  @override
  String get mediaSettingsKeyExternal => 'Управляется другой настройкой; здесь только ссылка';

  @override
  String get mediaSettingsEnabledHint => 'Отключает этот сервис для генерации';

  @override
  String get nearbyThisChat => 'Этот чат';

  @override
  String get nearbyPermissionTitle => 'Разрешения для этого чата';

  @override
  String nearbyNewChatDefault(String name) {
    return 'Новые чаты: $name';
  }

  @override
  String get nearbySetAsDefault => 'Использовать для новых чатов';

  @override
  String get nearbyManageModels => 'Управление моделями';

  @override
  String nearbyPermissionPill(String name) {
    return 'Разрешения для этого чата: $name';
  }

  @override
  String get nearbyChange => 'Изменить';

  @override
  String get performanceTitle => 'Производительность';

  @override
  String get performanceAuto => 'Авто';

  @override
  String get performanceFull => 'Полная';

  @override
  String get performanceLight => 'Лёгкая';

  @override
  String get performanceAutoHint => 'Подбирать эффекты под это устройство';

  @override
  String get performanceFullHint => 'Оставить размытие и анимацию';

  @override
  String get performanceLightHint => 'Меньше постоянных эффектов и нагрузки';

  @override
  String get performanceChoiceHint => 'Выбор питомца и движка важнее';

  @override
  String get performanceCooling => 'Снижаю эффекты, пока устройство не остынет';

  @override
  String get performanceEffects => 'Эффекты интерфейса';

  @override
  String get performanceBlur => 'Стеклянное размытие';

  @override
  String get performanceAnimations => 'Анимация интерфейса';

  @override
  String get performanceSystemMotion => 'Также учитывает системную настройку «Убрать анимацию»';

  @override
  String get performanceFollowMode => 'Следовать режиму производительности';

  @override
  String get performanceRemoteHint => 'Подключитесь к компьютеру или серверу, чтобы снизить нагрузку на телефон';

  @override
  String get performanceRefresh => 'Частота обновления';

  @override
  String get performanceRefreshMax => 'Макс.';

  @override
  String get performanceRefreshSystem => 'Системная';

  @override
  String get performanceRefreshHint =>
      'Авто: максимальная при прокрутке, снижается в покое; Системная: решает система.';

  @override
  String get searchKwRefreshRate => 'частота обновления высокая частота 120Hz 90Hz плавность';

  @override
  String get petActionSending => 'Отправка…';

  @override
  String get petActionTargetChanged => 'Хост изменён. Откройте быстрый вопрос снова; текст сохранён.';

  @override
  String get petActionSendFailed => 'Не удалось отправить. Текст сохранён; попробуйте снова.';

  @override
  String get petActionBusy => 'Этот чат занят. Выберите «Новый чат».';

  @override
  String get petActionVoiceMissing => 'Сначала скачайте офлайн-модель голоса в приложении.';

  @override
  String get petActionVoiceTitle => 'Голос для быстрого вопроса';

  @override
  String get petActionVoiceReturn => 'Назад к питомцу';

  @override
  String get petActionVoiceStop => 'Завершить запись';

  @override
  String get petActionVoiceStart => 'Записать';

  @override
  String get phoneDiagnosticsCollecting => 'Сбор…';

  @override
  String get phoneDiagnosticsPacking => 'Упаковка…';

  @override
  String get phoneDiagnosticsSharing => 'Открываем меню «Поделиться»…';

  @override
  String get phoneDiagnosticsSaving => 'Сохранение в «Загрузки»…';

  @override
  String get phoneDiagnosticsShare => 'Поделиться пакетом диагностики';

  @override
  String get phoneDiagnosticsShareHint => 'Приложить к отчёту об ошибке';

  @override
  String get phoneDiagnosticsSave => 'Сохранить в «Загрузки»';

  @override
  String get phoneDiagnosticsSaveHint => 'Сохранить в Downloads/DSH-Go';

  @override
  String get phoneDiagnosticsNote =>
      'Включает версии, данные устройства, журналы и последний сбой. Без ключей API и токенов.';

  @override
  String get phoneDiagnosticsExport => 'Экспорт пакета диагностики';

  @override
  String get phoneSafeMode => 'Безопасный режим';

  @override
  String get phoneEngineStartingSafeEllipsis => 'Запуск в безопасном режиме…';

  @override
  String get phoneEngineStartingEllipsis => 'Запуск…';

  @override
  String get phoneEngineTidyingFilesEllipsis => 'Приводим в порядок файлы плагинов…';

  @override
  String get phoneEngineStoppingEllipsis => 'Остановка…';

  @override
  String get phoneEngineStoppedNextSafe => 'Остановлен · Следующий запуск в безопасном режиме';

  @override
  String get phoneEngineInstallingRuntime => 'Установка среды выполнения…';

  @override
  String get phoneEngineRuntimeNotInstalled => 'Среда выполнения не установлена';

  @override
  String get phoneEngineErrorSeeLogs => 'Ошибка движка. Подробности в журнале.';

  @override
  String get phoneEngineTitle => 'Локальный движок';

  @override
  String get phoneEngineLocal => 'Движок этого телефона';

  @override
  String get phoneEngineLogs => 'Журналы';

  @override
  String get phoneEngineAutoStart => 'Запускать при открытии DSH Go';

  @override
  String get phoneEngineKeepAlive => 'Работа в фоне';

  @override
  String get phoneEngineKeepAliveHint => 'Не давать Android останавливать движок';

  @override
  String get phoneEngineDiagnostics => 'Диагностика';

  @override
  String get phoneEngineDiagnosticsHint => 'Сведения о среде и отчёты об ошибках';

  @override
  String get phoneEngineRuntime => 'Среда выполнения';

  @override
  String get phoneEngineArchitecture => 'Архитектура';

  @override
  String get phoneEngineStopTitle => 'Остановить движок?';

  @override
  String get phoneEngineStopBody => 'Активные чаты прервутся. Запустить снова можно в любой момент.';

  @override
  String get phoneEngineInstallRuntime => 'Установить среду';

  @override
  String get phoneEngineStartAgain => 'Запустить снова';

  @override
  String get phoneEngineStart => 'Запустить';

  @override
  String get phoneEngineRestart => 'Перезапустить';

  @override
  String get phoneEngineResetFailed => 'Не удалось сбросить';

  @override
  String get phoneEngineReset => 'Сбросить среду';

  @override
  String get phoneEngineResetHint => 'Удалить чаты и файлы, затем распаковать заново';

  @override
  String get phoneEngineResetTitle => 'Сбросить среду выполнения?';

  @override
  String get phoneEngineKeepUiSkills => 'Сохранить настройки интерфейса и навыки';

  @override
  String get phoneEngineKeepPluginsSettings => 'Сохранить плагины и настройки';

  @override
  String get phoneEngineDeleteReset => 'Удалить и сбросить';

  @override
  String get phoneEngineNotInstalled => 'Не установлена';

  @override
  String get phoneEngineInstalling => 'Установка';

  @override
  String get phoneEngineStoppedSafe => 'Остановлен · Безопасный режим';

  @override
  String get phoneEngineStartingSafe => 'Запуск в безопасном режиме';

  @override
  String get phoneEngineStarting => 'Запуск';

  @override
  String get phoneEngineTidyingFiles => 'Приводим в порядок файлы плагинов';

  @override
  String get phoneEngineRunningProbation => 'Работает · Пробный запуск';

  @override
  String get phoneEngineStartupFailed => 'Не удалось запустить';

  @override
  String get phoneEngineCrashed => 'Сбой';

  @override
  String get phoneEngineKilled => 'Остановлен Android';

  @override
  String get phoneEngineError => 'Что-то пошло не так';

  @override
  String get phoneEngineRuntimeCorrupt => 'Встроенная среда выполнения повреждена. Переустановите DSH.';

  @override
  String get phoneEngineExited => 'Движок неожиданно завершился';

  @override
  String get phoneEngineRuntimeMissing => 'Среда выполнения ещё не установлена';

  @override
  String get phoneEngineSafeUnsupported => 'Эта среда не поддерживает безопасный режим. Обновите DSH.';

  @override
  String get phoneEngineRuntimeIncomplete => 'Встроенная среда выполнения неполная. Переустановите DSH.';

  @override
  String get phoneLogEmpty => 'Журналов пока нет';

  @override
  String get phoneLogShareTitle => 'Журналы движка DSH';

  @override
  String get phoneLogCopyAll => 'Копировать всё';

  @override
  String get phoneBackgroundAllow => 'Разрешить доступ';

  @override
  String get phoneToolScreen => 'Чтение экрана';

  @override
  String get phoneToolCollect => 'Прокрутка и сбор';

  @override
  String get phoneToolTap => 'Нажатие';

  @override
  String get phoneToolType => 'Ввод';

  @override
  String get phoneToolScroll => 'Свайп';

  @override
  String get phoneToolKey => 'Нажатие клавиши';

  @override
  String get phoneToolTapCoordinates => 'Нажатие по координатам';

  @override
  String get phoneToolHandoff => 'Передача вам';

  @override
  String get phoneToolOpenApp => 'Открыть приложение';

  @override
  String get phoneToolListApps => 'Просмотр приложений';

  @override
  String get phoneToolIntent => 'Системное действие';

  @override
  String get phoneToolNotify => 'Отправить уведомление';

  @override
  String get phoneToolClipboard => 'Буфер обмена';

  @override
  String get phoneToolAction => 'Действие';

  @override
  String get phoneDecisionContinued => 'Вы продолжили';

  @override
  String get phoneDecisionDone => 'Выполнено';

  @override
  String get phoneDecisionAllowed => 'Вы разрешили';

  @override
  String get phoneDecisionPauseExpired => 'Пауза затянулась';

  @override
  String get phoneDecisionBlocked => 'Заблокировано';

  @override
  String get phoneDecisionTimeout => 'Тайм-аут';

  @override
  String get phoneDecisionUnavailable => 'Недоступно';

  @override
  String get phoneDecisionScreenChanged => 'Экран изменился';

  @override
  String get phoneDecisionFailed => 'Не сработало';

  @override
  String get phoneActionLogTitle => 'Журнал действий';

  @override
  String get phoneActionLogSubtitle => 'Записывает действия, но не содержимое экрана';

  @override
  String get phoneActionLogRefresh => 'Обновить';

  @override
  String get phoneActionLogEmpty => 'Действий пока нет';

  @override
  String get phoneActionLogEmptyHint => 'Здесь появятся все шаги DSH на вашем телефоне';

  @override
  String get phoneAppRuleDeny => 'Не трогать';

  @override
  String get phoneAppRuleConfirm => 'Каждый шаг';

  @override
  String get phoneAppRuleNormal => 'Как обычно';

  @override
  String get phoneAppRuleDenyHint => 'Без чтения экрана и нажатий. По умолчанию для банковских и платёжных приложений.';

  @override
  String get phoneAppRuleConfirmHint => 'Можно читать. Спрашивает перед нажатием или вводом.';

  @override
  String get phoneAppRuleNormalHint => 'Спрашивает только перед важными действиями, например отправкой';

  @override
  String get phoneAppRulesTitle => 'Правила для приложений';

  @override
  String get phoneAppRulesSubtitle =>
      'Приложения не из списка работают как обычно. Важные действия всё равно требуют подтверждения.';

  @override
  String get phoneAppRulesUnavailable => 'Не удалось прочитать правила для приложений';

  @override
  String get phoneTryLater => 'Повторите позже';

  @override
  String get phoneAppRulesChanged => 'Как обычно · Изменено вами';

  @override
  String get phoneAppRulesAdd => 'Добавить приложение';

  @override
  String get phoneAppRulesAddHint => 'Добавить по имени пакета';

  @override
  String get phoneSensitiveActionsNote => 'Пароли, коды подтверждения, платежи и системные настройки — за вами';

  @override
  String get phoneAppRulesSaveFailed => 'Не удалось сохранить. Повторите позже.';

  @override
  String get phoneAppRulesAcceptRisk => 'Всё равно изменить';

  @override
  String get phoneAppRulesPackage => 'Имя пакета';

  @override
  String get phoneAppRulesPackageHint => 'Его можно найти в Настройках → Приложения → Сведения о приложении';

  @override
  String get phoneDndRequiresAndroid => 'Требуется Android 14 или новее';

  @override
  String get phoneDndHiddenScreen => 'Работает на скрытом экране';

  @override
  String get phoneNotReadyYet => 'Ещё не готово';

  @override
  String get phoneActionFailedLater => 'Не удалось выполнить. Повторите позже.';

  @override
  String get phoneDndDisabled => 'Режим без помех выключен';

  @override
  String get phoneDndEnabled => 'Режим без помех включён';

  @override
  String get phoneDndShizukuPermissionFailed =>
      'Разрешение не выдано. Разрешите DSH Go в разделе «Управление приложениями» Shizuku.';

  @override
  String get phoneDndPairedConnect => 'Сопряжено. Нажмите «Подключиться».';

  @override
  String get phoneDndTitle => 'Режим без помех';

  @override
  String get phoneDndSubtitle => 'Работает на скрытом экране, пока вы пользуетесь телефоном';

  @override
  String get phoneDndUnsupported => 'Для этой функции нужен Android 14 или новее.';

  @override
  String get phoneDndRequirements => 'Требования';

  @override
  String get phoneDndKeepUnlocked => 'Держите экран включённым и разблокированным.';

  @override
  String get phoneDndReactivate => 'Включите заново после перезагрузки телефона.';

  @override
  String get phoneDndKeepDebugging =>
      'При работе через Shizuku или прямой ADB оставайтесь в Wi-Fi с включённой отладкой по Wi-Fi.';

  @override
  String get phoneReady => 'Готово';

  @override
  String get phoneDndDirectAdb => 'Прямой ADB';

  @override
  String get phoneDndChannels => 'Канал';

  @override
  String get phoneDndShizukuFor => 'Телефоны с приложением Shizuku';

  @override
  String get phoneDndSuiFor => 'Модуль Sui на Magisk или KernelSU';

  @override
  String get phoneDndRootFor => 'Телефоны с root';

  @override
  String get phoneDndAdbFor => 'Без лишних приложений, через отладку по Wi-Fi';

  @override
  String get phoneDndStateInUse => 'Используется';

  @override
  String get phoneDndStateNotReady => 'Не готово';

  @override
  String get phoneDndStateUsable => 'Готово';

  @override
  String get phoneDndStateNeedsGrant => 'Нужно разрешение';

  @override
  String get phoneDndStateNotRunning => 'Не работает';

  @override
  String get phoneDndStateNotInstalled => 'Не установлено';

  @override
  String get phoneDndStateNotFound => 'Не найдено';

  @override
  String get phoneDndStateViaSui => 'Через Sui';

  @override
  String get phoneDndStateWaiting => 'Ожидание';

  @override
  String get phoneDndStateDisconnected => 'Нет подключения';

  @override
  String get phoneDndStateNotPaired => 'Не сопряжено';

  @override
  String get phoneDndShizukuViaSui => 'На этом телефоне интерфейс Shizuku предоставляет Sui. Используйте Sui.';

  @override
  String get phoneDndSuiMissing =>
      'Sui не найден. Установите модуль Sui в Magisk или KernelSU, перезагрузите телефон и вернитесь сюда.';

  @override
  String get phoneDndSuiRunning => 'Интерфейс Sui доступен';

  @override
  String get phoneDndSuiStopped =>
      'Интерфейс Sui недоступен. Проверьте, что модуль Sui включён, перезагрузите телефон и повторите.';

  @override
  String get phoneDndSuiAllSet => 'Sui готов.';

  @override
  String get phoneDndSuiPermissionFailed =>
      'Не удалось запросить разрешение у Sui. Проверьте, что модуль Sui включён, и повторите.';

  @override
  String get phoneDndRootWaiting => 'Ожидание root. Ответьте на запрос менеджера root.';

  @override
  String get phoneDndRootConnected =>
      'Root подключён. Если соединение потеряется, выберите его здесь снова; DSH Go сам запрашивает root только при включённом выше «Держать канал root».';

  @override
  String get phoneDndRootConnectedKept =>
      'Root подключён. Если соединение потеряется, DSH Go сам снова запросит root у менеджера.';

  @override
  String get phoneDndRootRetry => 'Запросить root снова';

  @override
  String get phoneDndInstallShizuku =>
      'Сначала установите Shizuku (бесплатный, с открытым кодом). Если вы пользуетесь Ice Box или Brevent, он может уже быть у вас.';

  @override
  String get phoneDndOpenShizukuSite => 'Открыть сайт Shizuku';

  @override
  String get phoneDndStartShizuku =>
      'Откройте Shizuku и выполните «Запуск через отладку по Wi-Fi» (нужен Wi-Fi). Страница обновится, когда вы вернётесь.';

  @override
  String get phoneDndGrantShizukuHint => 'Shizuku запущен. Теперь разрешите DSH Go использовать его.';

  @override
  String get phoneDndGrantShizuku => 'Разрешить DSH Go';

  @override
  String get phoneDndShizukuAllSet => 'Shizuku готов.';

  @override
  String get phoneDndShizukuInstalled => 'Shizuku установлен';

  @override
  String get phoneDndShizukuRunning => 'Shizuku запущен';

  @override
  String get phoneDndShizukuGranted => 'DSH Go разрешён';

  @override
  String get phoneDndShizukuCompatibility => 'В этой версии Android есть проблемы совместимости с официальным Shizuku.';

  @override
  String get phoneDndWirelessDebuggingOn => 'Отладка по Wi-Fi включена';

  @override
  String get phoneDndPaired => 'Сопряжено';

  @override
  String get phoneDndConnected => 'Подключено';

  @override
  String get phoneDndDeveloperOptionsStep =>
      'Включите «Для разработчиков»: нажмите «Номер сборки» 7 раз в «О телефоне». На Xiaomi нажмите «Версия ОС» в «Моё устройство → Подробная информация и характеристики»; на vivo — «Версия ПО».';

  @override
  String get phoneDndWirelessDebuggingStep =>
      'Включите «Отладка по Wi-Fi» в разделе «Для разработчиков», подключившись к Wi-Fi. Обычно этот раздел находится в «Система» или «Дополнительные настройки».';

  @override
  String get phoneDndStartPairingStep => 'Вернитесь сюда и нажмите «Начать сопряжение». DSH пришлёт уведомление.';

  @override
  String get phoneDndGetPairingCodeStep =>
      'В разделе «Отладка по Wi-Fi» нажмите «Сопряжение устройства с помощью кода» — появится 6-значный код.';

  @override
  String get phoneDndEnterPairingCodeStep =>
      'Откройте шторку уведомлений и введите код в уведомлении DSH. После сопряжения нажмите «Подключиться».';

  @override
  String get phoneDndStartPairing => 'Начать сопряжение';

  @override
  String get phoneDndPairingNotificationSent => 'Уведомление отправлено. Возьмите код в разделе «Отладка по Wi-Fi».';

  @override
  String get phoneDndManualEntry => 'Ввести вручную';

  @override
  String get phoneDndConnect => 'Подключиться';

  @override
  String get phoneDndManualEntryHint => 'В уведомлении нет поля ввода? Используйте «Ввести вручную».';

  @override
  String get phoneDndXiaomiUsbHint =>
      'Для включения «Отладка по USB (Настройки безопасности)» нужны SIM-карта и аккаунт Xiaomi.';

  @override
  String get phoneDndEnterCodeTitle => 'Введите код сопряжения';

  @override
  String get phoneDndCodeLabel => '6-значный код сопряжения';

  @override
  String get phoneDndPortLabel => 'Порт (необязательно)';

  @override
  String get phoneDndPortHint => 'Число после двоеточия в «IP-адрес и порт» под кодом сопряжения';

  @override
  String get phoneDndPair => 'Сопрячь';

  @override
  String get phoneConfirmAsk => 'Всегда спрашивать';

  @override
  String get phoneConfirmTask => 'Эту задачу';

  @override
  String get phoneConfirmAlways => 'Всегда пропускать';

  @override
  String get phoneConfirmAskHint => 'Спрашивает перед входом в новое приложение, отправкой, удалением или оплатой';

  @override
  String get phoneConfirmTaskHint => 'Спрашивает один раз за задачу';

  @override
  String get phoneConfirmAlwaysHint => 'Действует без вопросов';

  @override
  String get phoneConfirmTitle => 'Подтверждение';

  @override
  String get phoneConfirmAlwaysTitle => 'Всегда пропускать подтверждение?';

  @override
  String get phoneConfirmAlwaysBody =>
      'Открытие приложений, нажатия, отправка и удаление будут происходить без вопросов.';

  @override
  String get phoneConfirmSaveFailed => 'Не удалось изменить. Повторите позже.';

  @override
  String get phoneEnableFailed => 'Не удалось включить. Повторите позже.';

  @override
  String get phoneDisableFailed => 'Не удалось выключить. Повторите позже.';

  @override
  String get phoneEnabled => 'Вкл.';

  @override
  String get phoneDisabled => 'Выкл.';

  @override
  String get phoneOpenAccessibilityFailed =>
      'Не удаётся открыть настройки. Найдите DSH в разделе «Настройки» → «Специальные возможности».';

  @override
  String get phoneOpenAppInfoFailed =>
      'Не удаётся открыть сведения о приложении. Найдите DSH Go в разделе «Настройки» → «Приложения».';

  @override
  String get phoneStopFailed => 'Не удалось остановить. Нажмите «Остановить» на плавающей панели или в уведомлении.';

  @override
  String get phoneControlTitle => 'Управление телефоном';

  @override
  String get phoneControlSubtitle => 'Читает экран и нажимает за вас. Можно остановить в любой момент.';

  @override
  String get phoneControlWorking => 'Управляет телефоном';

  @override
  String get phoneControlTaskNoConfirmHint =>
      'Подтверждение пропущено для этой задачи · Пауза и остановка — на плавающей панели';

  @override
  String get phoneControlFloatingBarHint => 'Пауза и остановка — на плавающей панели';

  @override
  String get phoneControlAdvanced => 'Дополнительно';

  @override
  String get phoneControlKeepAliveHint => 'Не даёт Android отключать специальные возможности';

  @override
  String get phoneControlReadingEllipsis => 'Чтение…';

  @override
  String get phoneControlNotReady => 'Не готово';

  @override
  String get phoneControlNotEnabled => 'Выкл.';

  @override
  String get phoneControlSafeModeNotLoaded => 'Не загружено в безопасном режиме';

  @override
  String get phoneControlLocalOnly => 'Доступно только с движком этого телефона';

  @override
  String get phoneControlAfterEngineStarts => 'Вступит в силу после запуска движка';

  @override
  String get phoneControlNeedsAccessibility => 'Остался один шаг: включите специальные возможности';

  @override
  String get phoneControlReady => 'Готово к управлению телефоном';

  @override
  String get phoneControlSetup => 'Настройка';

  @override
  String get phoneControlAccessibilityService => 'Служба специальных возможностей';

  @override
  String get phoneControlAccessibilityReady => 'Готова читать экран и нажимать';

  @override
  String get phoneControlAccessibilityReconnect => 'Служба отключилась. Выключите и включите её снова.';

  @override
  String get phoneControlAccessibilityHint => 'Нужна для чтения экрана и нажатий';

  @override
  String get phoneControlGoSettings => 'Открыть настройки';

  @override
  String get phoneControlGoEnable => 'Включить';

  @override
  String get phoneControlAccessibilityBlocked => 'Переключатель недоступен?';

  @override
  String get phoneControlRestrictedAfterAttempt =>
      'Похоже, включить не удалось. Приложениям, установленным не из магазина, нужно сначала «Разрешить ограниченные настройки».';

  @override
  String get phoneControlRestrictedHint =>
      'Приложениям, установленным не из магазина, нужно сначала «Разрешить ограниченные настройки»';

  @override
  String get phoneControlNotifications => 'Уведомления';

  @override
  String get phoneControlNotificationsPairingHint => 'Используются для подтверждений, остановки и кодов сопряжения';

  @override
  String get phoneControlNotificationsHint => 'Нужны для подтверждений и кнопки «Остановить»';

  @override
  String get phoneControlAllowed => 'Разрешено';

  @override
  String get phoneControlTry => 'Попробовать';

  @override
  String get phoneControlReadScreen => 'Прочитать текущий экран';

  @override
  String get phoneControlReadScreenHint => 'Посмотрите, что читает DSH, не отправляя это модели';

  @override
  String get phoneControlEnableAccessibilityFirst => 'Сначала включите службу специальных возможностей';

  @override
  String get phoneControlLoading => 'Загрузка';

  @override
  String get phoneControlRules => 'Правила';

  @override
  String get phoneControlRecentActions => 'Последние действия';

  @override
  String get phoneControlRecentActionsHint => 'Каждый шаг записывается, без содержимого экрана';

  @override
  String get phoneControlAllActions => 'Все действия';

  @override
  String get phoneControlModuleNotReady => 'Управление телефоном не готово в этой версии';

  @override
  String get phoneControlSafeModeUnavailable => 'Недоступно в безопасном режиме';

  @override
  String get phoneControlSafeModeHint => 'В безопасном режиме плагины пропускаются. Переключитесь в обычный режим.';

  @override
  String get phoneControlRemoteHost => 'Подключено к удалённому хосту';

  @override
  String get phoneControlCapabilities => 'Что можно делать';

  @override
  String get phoneControlIntents => 'Будильники, события, карты, отправка';

  @override
  String get phoneControlNoExtraPermissions => 'Дополнительные разрешения не нужны';

  @override
  String get phoneControlReadToTable => 'Читать экран в таблицы или задачи';

  @override
  String get phoneControlNeedsAccessibilityHint => 'Требуются специальные возможности';

  @override
  String get phoneControlTapType => 'Нажимает и вводит текст за вас';

  @override
  String get phoneControlSensitiveHint => 'Спрашивает перед отправкой или покупкой. Никогда не оплачивает.';

  @override
  String get phoneDisclosureWhatTitle => 'Что читает';

  @override
  String get phoneDisclosureWhatBody =>
      'Текст на текущем экране. При использовании модели с распознаванием изображений может прилагаться снимок экрана.';

  @override
  String get phoneDisclosureWhenTitle => 'Когда читает';

  @override
  String get phoneDisclosureWhenBody =>
      'Только когда вы запускаете задачу или нажимаете «Прочитать текущий экран». Больше никогда.';

  @override
  String get phoneDisclosureWhoTitle => 'Кто получает';

  @override
  String get phoneDisclosureWhoBody =>
      'Выбранная вами модель DeepSeek в облаке. Номера банковских карт и документов предварительно скрываются.';

  @override
  String get phoneDisclosureNeverTitle => 'Что не будет делать по умолчанию';

  @override
  String get phoneDisclosureNeverBody =>
      'Не вводит пароли и коды подтверждения, не меняет системные настройки. В таких случаях возвращает управление вам и не заходит в банковские и платёжные приложения.';

  @override
  String get phoneDisclosureStopTitle => 'Остановка в любой момент';

  @override
  String get phoneDisclosureStopBody =>
      'Плавающая панель позволяет приостановить, остановить или направить. Держите экран включённым и разблокированным.';

  @override
  String get phoneDisclosureTitle => 'Перед включением управления телефоном';

  @override
  String get phoneDisclosureIntro =>
      'DSH читает экран и нажимает так же, как вы, чтобы выполнить задачу. Перед включением стоит знать:';

  @override
  String get phoneDisclosureRestartNote => 'Движок перезапустится, и текущий ответ прервётся';

  @override
  String get phoneDisclosureNotNow => 'Не сейчас';

  @override
  String get phoneDisclosureAgreeEnable => 'Согласиться';

  @override
  String get phoneCheckUnknown => 'Не знаю';

  @override
  String get phoneCheckYes => 'Да';

  @override
  String get phoneCheckNotYet => 'Ещё нет';

  @override
  String get phoneRomStock => 'Стандартная / другая';

  @override
  String get phoneRestrictedAccessibility => 'Специальные возможности';

  @override
  String get phoneRestrictedOpenAccessibility => 'Включить специальные возможности';

  @override
  String get phoneRestrictedOverlay => 'Плавающее окно';

  @override
  String get phoneRestrictedOpenOverlay => 'Включить плавающее окно';

  @override
  String get phoneRestrictedTryAccessibility =>
      'Сначала попробуйте включить DSH в разделе «Специальные возможности». Когда появится «Ограниченная настройка», нажмите «ОК». Пункт ниже появится только после этого.';

  @override
  String get phoneRestrictedOpenInfoStep => 'Вернитесь сюда и нажмите «Открыть сведения о приложении».';

  @override
  String get phoneRestrictedBackAccessibility => 'Вернитесь в «Специальные возможности» и включите DSH.';

  @override
  String get phoneRestrictedMenuStep =>
      'Нажмите три точки в правом верхнем углу, выберите «Разрешить ограниченные настройки» и подтвердите пароль блокировки экрана.';

  @override
  String get phoneRestrictedTryOverlay =>
      'Сначала попробуйте включить DSH Go в настройках плавающего окна. Когда появится «Ограниченная настройка», нажмите «ОК». Вариант ниже появится только после этого.';

  @override
  String get phoneRestrictedBackOverlay => 'Вернитесь в настройки плавающего окна и включите DSH Go.';

  @override
  String get phoneRestrictedHuaweiOverlay =>
      'В HarmonyOS 4 и более ранних версиях этот шаг обычно пропускается. Включите DSH Go сразу в настройках плавающего окна.';

  @override
  String get phoneRestrictedHuaweiAccessibility =>
      'В HarmonyOS 4 и более ранних версиях этот шаг обычно пропускается. Включите DSH сразу в «Специальных возможностях».';

  @override
  String get phoneRestrictedVivoNote =>
      'Расположение зависит от версии OriginOS. Если трёх точек нет, прокрутите страницу сведений о приложении до конца.';

  @override
  String get phoneRestrictedAdvancedStep =>
      'В «Дополнительных настройках» найдите «Разрешить ограниченные настройки» и включите.';

  @override
  String get phoneRestrictedOppoNote =>
      'В ColorOS этот параметр может быть скрыт. Найдите установщик DSH во встроенном приложении «Файлы» и установите поверх существующего (удалять не нужно; чаты и настройки сохранятся). Затем включите специальные возможности.';

  @override
  String get phoneRestrictedHuaweiNote =>
      'Если в специальных возможностях появится «Ограниченная настройка», выполните шаги «Стандартный / Другой».';

  @override
  String get phoneRestrictedTitle => 'Разрешить ограниченные настройки';

  @override
  String get phoneRestrictedSteps => 'Шаги';

  @override
  String get phoneRestrictedDiagram => 'Иллюстрация';

  @override
  String get phoneRestrictedOpenInfo => 'Открыть сведения о приложении';

  @override
  String get phoneRestrictedOpenOverlayFailed =>
      'Не удалось открыть настройки плавающего окна. Найдите «Плавающее окно» в настройках.';

  @override
  String get phoneRestrictedOpenAccessibilityFailed =>
      'Не удалось открыть настройки специальных возможностей. Найдите «Специальные возможности» в настройках.';

  @override
  String get phoneRestrictedFootnote =>
      'Названия зависят от системы. При необходимости найдите в настройках «Ограниченные». Если открыть всё равно не удаётся, перезагрузите телефон и повторите.';

  @override
  String get phoneRestrictedAppInfo => 'Сведения о приложении';

  @override
  String get phoneRestrictedPermissionsManager => 'Диспетчер разрешений';

  @override
  String get phoneRestrictedBatterySaver => 'Экономия заряда';

  @override
  String get phoneRestrictedAdvanced => 'Дополнительные настройки';

  @override
  String get phoneRestrictedPermissions => 'Разрешения';

  @override
  String get phoneRestrictedBattery => 'Батарея';

  @override
  String get phoneRestrictedDiagramAdvanced =>
      'Иллюстрация: в сведениях о приложении нажмите «Дополнительные настройки» и включите «Разрешить ограниченные настройки».';

  @override
  String get phoneRestrictedDiagramMenu =>
      'Иллюстрация: в сведениях о приложении нажмите три точки в правом верхнем углу и выберите «Разрешить ограниченные настройки».';

  @override
  String get phoneRestrictedCaptionAdvanced => '① Нажмите «Дополнительные настройки»';

  @override
  String get phoneRestrictedCaptionMenu => '① Нажмите три точки';

  @override
  String get phoneRestrictedCaptionToggle => '② Включите переключатель';

  @override
  String get phoneRestrictedCaptionOption => '② Выберите этот пункт';

  @override
  String get phoneScreenReadFailed => 'Не удалось прочитать экран';

  @override
  String get phoneScreenUnknownReason => 'Неизвестная причина';

  @override
  String get phoneScreenReadFailedHint =>
      'Проверьте, что специальные возможности включены. Android блокирует чтение экранов паролей и платежей.';

  @override
  String get phoneScreenCurrent => 'Текущий экран';

  @override
  String get phoneScreenEmpty => '(На экране нет читаемого текста)';

  @override
  String get phoneScreenReadNote => 'Так это увидела бы модель. Это чтение не отправлялось модели.';

  @override
  String get phoneFailureSafeStartup => 'Не удалось запустить даже в безопасном режиме';

  @override
  String get phoneFailureSafeStartupHint => 'Похоже на проблему с глобальной конфигурацией или средой выполнения';

  @override
  String get phoneFailureKilled => 'Android остановил движок';

  @override
  String get phoneFailureKilledHint => 'Возможно, не хватает памяти или мешают ограничения батареи';

  @override
  String get phoneFailureLaunch => 'Локальная среда не запустилась';

  @override
  String get phoneFailureLaunchHint => 'Проверьте журналы или подключитесь к удалённому хосту, чтобы продолжить';

  @override
  String get phoneFailureNoSpaceHint => 'Освободите место и повторите';

  @override
  String get phoneFailureStartup => 'DSH не запустился';

  @override
  String get phoneFailureCrashedEarly => 'DSH упал вскоре после запуска';

  @override
  String get phoneFailureCrashedLate => 'DSH упал во время работы';

  @override
  String get phoneFailureFatal => 'Движок сообщил о фатальной ошибке';

  @override
  String get phoneFailureRestore => 'Восстановить конфигурацию';

  @override
  String get phoneFailureEnterSafe => 'Войти в безопасный режим';

  @override
  String get phoneFailureStartNormal => 'Запустить обычным образом';

  @override
  String get phoneFailureGlobalPatch => 'Глобальный патч';

  @override
  String get phoneFailureEnvironment => 'Переменные среды';

  @override
  String get phoneSafeMoveAsideTitle => 'Сначала убрать эти файлы?';

  @override
  String get phoneSafeMoveAsideIntro => 'Они влияют на все конфигурации, включая безопасный режим:';

  @override
  String get phoneSafeMoveAsideNote =>
      'Файлы переименовываются (суффикс .off-время), но не удаляются. После исправления проблемы их можно переименовать обратно.';

  @override
  String get phoneSafeStartDirectly => 'Запустить сразу';

  @override
  String get phoneSafeMoveAsideStart => 'Убрать и запустить';

  @override
  String get phoneSafeNoRestoreNeeded => 'Конфигурация совпадает с последней рабочей версией. Восстановление не нужно.';

  @override
  String get phoneSafeNoRestoreRecord => 'Рабочая конфигурация не сохранилась';

  @override
  String get phoneSafeRestoreTitle => 'Восстановить последнюю рабочую конфигурацию?';

  @override
  String get phoneSafeRestoreStart => 'Восстановить и запустить';

  @override
  String get phoneSafeRestoredStarting => 'Последняя рабочая конфигурация восстановлена. Запускаю…';

  @override
  String get phoneSafeRestoreFailed => 'Не удалось восстановить';

  @override
  String get phoneSafeRestoreIntro => 'DSH восстановит последнюю рабочую конфигурацию:';

  @override
  String get phoneSafeRestoreSettings =>
      '• Вернуть настройки той версии (текущие настройки сохранятся как резервная копия)';

  @override
  String get phoneSafeRestoreNote =>
      'Плагины не будут удалены. Интернет не нужен. Отключённые плагины можно будет включить позже.';

  @override
  String get phoneSafeLeaveTitle => 'Вернуться в обычный режим?';

  @override
  String get phoneSafeLeaveBody =>
      'Запуск с исходной конфигурацией и плагинами. Веб-настройки, изменённые в безопасном режиме, не сохранятся.';

  @override
  String get phoneSafeLeave => 'Вернуться в обычный режим';

  @override
  String get phoneSafeMovePatch => 'Убрать патч';

  @override
  String get phoneSafeMoveFiles => 'Убрать файлы';

  @override
  String get phoneSafeFailureLog => 'Журналы на момент сбоя';

  @override
  String get phoneSafeFailureLogEmpty => 'В момент сбоя вывод не записан';

  @override
  String get phoneSafeBannerTitle => 'Безопасный режим · Плагины не загружены';

  @override
  String get phoneSafeBannerProbation => 'Проверка обычного режима';

  @override
  String get phoneSafeBannerProbationHint =>
      'Если за 2 минуты ошибок не будет, восстановление завершится. Иначе безопасный режим включится снова.';

  @override
  String get phoneSafeBannerRunningHint => 'Чаты в безопасности. Исправьте конфигурацию и вернитесь в обычный режим.';

  @override
  String get phoneSafeBannerFailedHint => 'Не удалось запустить даже в безопасном режиме. Проверьте страницу движка.';

  @override
  String get phoneSafeBannerStoppedHint => 'Движок остановлен. Следующий запуск снова будет в безопасном режиме.';

  @override
  String get phoneSafeRepair => 'Помогите исправить';

  @override
  String get phoneSafeReasonStartup => 'Два запуска подряд завершились неудачно';

  @override
  String get phoneSafeReasonProbation => 'Снова упал после восстановления';

  @override
  String get phoneSafeReasonManual => 'Включён вручную';

  @override
  String get phoneSafeNormalSettingsHint => 'Перезапуск с исходной конфигурацией и плагинами';

  @override
  String get phoneSafeStartSettings => 'Запускать в безопасном режиме';

  @override
  String get phoneSafeStartSettingsHint => 'Пропускать плагины для диагностики запуска';

  @override
  String get phoneSafeAutoSettings => 'Автоматический безопасный режим';

  @override
  String get phoneSafeAutoSettingsHint => 'Включать после повторных сбоев запуска';

  @override
  String get phoneAccentMist => 'Туман';

  @override
  String get phoneAccentDaiqing => 'Бирюзовый';

  @override
  String get phoneAccentDusk => 'Сумерки';

  @override
  String get phoneAccentTurquoise => 'Аква';

  @override
  String get phoneAccentGreen => 'Зелень';

  @override
  String get phoneAccentAmber => 'Янтарь';

  @override
  String get phoneAccentOrange => 'Мандарин';

  @override
  String get phoneAccentGraphite => 'Графит';

  @override
  String get phoneAccentCustom => 'Свой';

  @override
  String phoneEngineInstallPercent(int percent) {
    return 'Установка · $percent%';
  }

  @override
  String phoneEngineStatusSemantics(String prefix, String status) {
    return '$prefix, движок: $status';
  }

  @override
  String phoneLogLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count строки',
      many: '$count строк',
      few: '$count строки',
      one: '$count строка',
    );
    return '$_temp0';
  }

  @override
  String phoneLogCopiedLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Скопировано $count строки',
      many: 'Скопировано $count строк',
      few: 'Скопировано $count строки',
      one: 'Скопирована $count строка',
    );
    return '$_temp0';
  }

  @override
  String phoneAppRuleDefault(String rule) {
    return 'По умолчанию: $rule';
  }

  @override
  String phoneAppRulesLoosenTitle(String app) {
    return 'Разрешить DSH управлять «$app»?';
  }

  @override
  String phoneAppRulesSkipStepsTitle(String app) {
    return 'Не подтверждать каждый шаг в «$app»?';
  }

  @override
  String phoneDndBrowserFailed(String url) {
    return 'Не удалось открыть браузер. URL: $url';
  }

  @override
  String phoneDndChannelReady(String channel) {
    return '$channel · Готово';
  }

  @override
  String phoneDndChannelStatus(String channel, String reason) {
    return '$channel · $reason';
  }

  @override
  String phoneDndUsing(String channel) {
    return 'Используется $channel';
  }

  @override
  String phoneDndEnableWith(String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'shizuku': 'Включить через Shizuku',
      'sui': 'Включить через Sui',
      'root': 'Включить через Root',
      'adb': 'Включить через прямой ADB',
      'other': 'Включить',
    });
    return '$_temp0';
  }

  @override
  String phoneDndSwitchTo(String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'shizuku': 'Переключиться на Shizuku',
      'sui': 'Переключиться на Sui',
      'root': 'Переключиться на Root',
      'adb': 'Переключиться на прямой ADB',
      'other': 'Переключиться на этот канал',
    });
    return '$_temp0';
  }

  @override
  String phoneControlWorkingApp(String app) {
    return 'Управление «$app»';
  }

  @override
  String phoneControlPolicySummary(int denied, int confirmed) {
    String _temp0 = intl.Intl.pluralLogic(
      denied,
      locale: localeName,
      other: '$denied приложения не трогаем',
      many: '$denied приложений не трогаем',
      few: '$denied приложения не трогаем',
      one: '$denied приложение не трогаем',
    );
    String _temp1 = intl.Intl.pluralLogic(
      confirmed,
      locale: localeName,
      other: '$confirmed приложения подтверждают каждый шаг',
      many: '$confirmed приложений подтверждают каждый шаг',
      few: '$confirmed приложения подтверждают каждый шаг',
      one: '$confirmed приложение подтверждает каждый шаг',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String phoneControlRemoteHint(String host) {
    return 'DSH на хосте «$host» не может управлять этим телефоном. Переключитесь на «Этот телефон».';
  }

  @override
  String phoneRestrictedSubtitle(String place) {
    return 'Разрешите это для приложений из неизвестных источников, чтобы включить переключатель $place';
  }

  @override
  String phoneRestrictedDone(String place) {
    return '$place включено. Можно вернуться назад.';
  }

  @override
  String phoneFailurePlugins(String plugins) {
    return 'Возможно, связано с плагинами «$plugins»';
  }

  @override
  String phoneFailureRequired(String components) {
    return 'Обязательные компоненты $components не прошли проверки при запуске';
  }

  @override
  String phoneSafeRestoreAt(String when) {
    return 'DSH восстановит рабочую конфигурацию от $when:';
  }

  @override
  String phoneSafeRestoreDisable(String plugins) {
    return '• Отключить: $plugins';
  }

  @override
  String phoneSafeRestoreChanged(String plugins) {
    return '  (обновлено после этого: $plugins; пока можно только отключить)';
  }

  @override
  String phoneSafeRestoreEnable(String plugins) {
    return '• Включить снова: $plugins';
  }

  @override
  String phoneSafeTodayTime(String time) {
    return 'Сегодня $time';
  }

  @override
  String phoneSafeReasonPlugins(String plugins) {
    return 'Два запуска подряд завершились сбоем. Подозрительные плагины: $plugins';
  }

  @override
  String get phoneListSeparator => ', ';

  @override
  String get phonePluginQuoteSeparator => '», «';

  @override
  String phoneEngineRunningAt(String address) {
    return 'Работает · $address';
  }

  @override
  String phoneEngineSafeAt(String address) {
    return 'Безопасный режим · $address';
  }

  @override
  String get phoneAppRulesLoosenBody =>
      'Банковские и платёжные приложения распознают автоматизацию и могут ограничить вход или заблокировать аккаунт. По умолчанию DSH не вводит пароли и не платит.';

  @override
  String get phoneAppRulesSkipStepsBody =>
      'Такие приложения, как WeChat, следят за автоматизацией, и из-за голосовых помощников аккаунты уже выходили из систем. При «Как обычно» подтверждения требуют только действия вроде отправки сообщений.';

  @override
  String get phoneResetDeletesChatsWorkspaces => 'чаты и рабочие папки';

  @override
  String get phoneResetBodyChatsWorkspaces =>
      'Чаты и рабочие папки будут удалены, затем среда выполнения установится заново.';

  @override
  String get phoneResetDeletesWithPlugins => 'чаты, рабочие папки, плагины и настройки';

  @override
  String get phoneResetBodyWithPlugins =>
      'Чаты, рабочие папки, плагины и настройки будут удалены, затем среда выполнения установится заново.';

  @override
  String get phoneResetDeletesWithUi => 'чаты, рабочие папки, настройки интерфейса и навыки';

  @override
  String get phoneResetBodyWithUi =>
      'Чаты, рабочие папки, настройки интерфейса и навыки будут удалены, затем среда выполнения установится заново.';

  @override
  String get phoneResetDeletesEverything => 'чаты, рабочие папки, плагины, настройки, настройки интерфейса и навыки';

  @override
  String get phoneResetBodyEverything =>
      'Чаты, рабочие папки, плагины, настройки, настройки интерфейса и навыки будут удалены, затем среда выполнения установится заново.';

  @override
  String phoneEngineStorageDetails(String needed, String free) {
    return 'Не хватает места: нужно около $needed МБ, доступно $free МБ';
  }

  @override
  String get phoneControlEnabledRestarting => 'Вкл. · Перезапуск движка';

  @override
  String get phoneControlDisabledRestarting => 'Выкл. · Перезапуск движка';

  @override
  String get phoneControlEnabledPending => 'Вкл. · Заработает после запуска движка';

  @override
  String get phoneReturnAfterDone => 'Вернуться в DSH Go по завершении';

  @override
  String get phoneReturnAfterDoneHint => 'Закрывает панель и открывает чат';

  @override
  String get phoneFloatingBar => 'Плавающая панель';

  @override
  String get phoneIdleOpacity => 'Прозрачность в покое';

  @override
  String get phoneAutoCollapse => 'Сворачивать в покое';

  @override
  String get phoneAutoCollapseHint => 'Сжимается в шарик; нажмите, чтобы открыть';

  @override
  String get phoneDeveloperOptions => 'Для разработчиков';

  @override
  String get phoneDirectEngine => 'Прямой запуск локального движка';

  @override
  String get phoneDirectHint =>
      'Экспериментально, по умолчанию выключено; применяется при следующем запуске. Некоторые телефоны (например, на Android 16) блокируют прямой запуск, и приложение само возвращается к совместимому запуску. Ваши данные не пострадают.';

  @override
  String get phoneDirectFailedHint =>
      'Прямой запуск на этом телефоне не сработал, поэтому используется совместимый. Остановите движок и включите этот пункт, чтобы попробовать снова.';

  @override
  String get phoneDirectCompatibleHint =>
      'Этот запуск был совместимым; причина выше. Ваш выбор сохранён, следующий запуск попробует снова.';

  @override
  String get phoneDirectStopFirst => 'Остановите локальный движок, прежде чем менять способ запуска.';

  @override
  String get phoneDirectSafeHint =>
      'В безопасном режиме используется совместимый запуск. Выбор применится при возврате в обычный режим.';

  @override
  String get phoneDirectNeedsRuntime => 'Для этого нужна среда выполнения с поддержкой прямого запуска.';

  @override
  String get phoneDirectChangeFailed => 'Не удалось изменить способ запуска. Остановите локальный движок и повторите.';

  @override
  String get phoneActualLaunchMode => 'Текущий запуск';

  @override
  String get phoneLaunchNotObserved => 'Не работает';

  @override
  String get phoneLastLaunchSelection => 'Прошлый запуск';

  @override
  String get phoneDirectRejectedReason => 'Причина отката';

  @override
  String get phoneLaunchFailureReason => 'Прошлый сбой';

  @override
  String get phoneReturnCompatible => 'Совместимый запуск';

  @override
  String get phoneLaunchDirect => 'Прямой запуск';

  @override
  String get phoneLaunchCompatible => 'Совместимый запуск';

  @override
  String get phoneDirectIncompatibleFiles => 'Файлы плагинов ещё не приведены в порядок, пока совместимый запуск';

  @override
  String get phoneDirectNotEnoughSpace => 'Не хватает места, пока совместимый запуск';

  @override
  String get phoneDirectMigrationFailed => 'Приведение файлов в порядок не завершено, пока совместимый запуск';

  @override
  String get phoneDirectLaunchFailed => 'Прямой запуск не удался';

  @override
  String get phoneLaunchStartFailed => 'Запуск не завершился';

  @override
  String phoneLaunchExited(String code) {
    return 'Код выхода $code';
  }

  @override
  String get phoneDndManualConnect => 'Подключиться по порту';

  @override
  String get phoneDndConnectPortLabel => 'Порт подключения';

  @override
  String get phoneDndConnectPortHint =>
      'На главной странице настроек «Отладка по Wi-Fi» найдите «IP-адрес и порт» и введите порт после двоеточия. Не используйте порт из окна сопряжения.';

  @override
  String get phoneTaskResultReady => 'Задача выполнена · Открыть результат';

  @override
  String get phoneTaskEndedResult => 'Задача завершена · Открыть результат';

  @override
  String get phoneBackgroundGuideTitle => 'Подтверждения и возврат';

  @override
  String get phoneBackgroundGuideSubtitle => 'Вовремя видеть подтверждения и результаты задач';

  @override
  String get phoneBackgroundGuideBody =>
      'Когда шаг требует вашего решения, появляется карточка DSH Go. Если карточка недоступна, приложение пытается отправить уведомление или вернуться сюда. Разрешите уведомления об управлении телефоном и всплывающие оповещения в настройках системы.';

  @override
  String get phoneBackgroundOemHint =>
      'В системных разрешениях для DSH Go включите «Показывать всплывающие окна при работе в фоне», если такой пункт есть. Это помогает приложению возвращаться автоматически. Названия пунктов зависят от версии системы.';

  @override
  String get phoneBackgroundReturnHint =>
      'Если приложение не вернулось после завершения задачи, нажмите «Задача выполнена · Открыть результат». Если системные уведомления или фоновые окна заблокированы, возможно, придётся открыть DSH Go вручную.';

  @override
  String get phoneBackgroundGotIt => 'Понятно';

  @override
  String get phoneBackgroundOpenSettings => 'Открыть настройки системы';

  @override
  String get phoneBackgroundNotificationBlocked =>
      'Разрешите всплывающие оповещения для уведомлений об управлении телефоном';

  @override
  String get phonePrivilegedUpgrade =>
      'Эта сборка приложения не поддерживает такой привилегированный канал. Обновите DSH Go, чтобы его использовать.';

  @override
  String get phonePrivilegedSui => 'Sui';

  @override
  String get phonePrivilegedRoot => 'Root';

  @override
  String get phonePrivilegedSuiDescription =>
      'Использовать интерфейс модуля Sui. Авторизация запрашивается только при нажатии.';

  @override
  String get phonePrivilegedRootDescription =>
      'Для Magisk, KernelSU или APatch. Первая root-команда выполнится только после выбора этого канала.';

  @override
  String get phonePrivilegedRootPrepare => 'Авторизовать root';

  @override
  String get phonePrivilegedRootUnchecked => 'Не проверено';

  @override
  String get phonePrivilegedGrantRoot => 'Выдать через root';

  @override
  String get phonePrivilegedGrantSui => 'Выдать через Sui';

  @override
  String get phonePrivilegedGrantSuiPermission => 'Авторизуйте Sui, затем выдайте';

  @override
  String get phonePrivilegedSuggested => 'Рекомендуется';

  @override
  String get phonePrivilegedRootRiskTitle => 'Дать DSH Go root-доступ?';

  @override
  String get phonePrivilegedRootRiskBody =>
      'Ваш root-менеджер (Magisk, KernelSU или APatch) спросит вас. Если разрешить, DSH Go запустит собственную фоновую службу с правами root. После отключения или перезапуска он спросит снова сам, только если включено «Сохранять root-канал».';

  @override
  String phoneKeepTitle(String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'shizuku': 'Сохранять канал Shizuku',
      'sui': 'Сохранять канал Sui',
      'root': 'Сохранять канал root',
      'adb': 'Сохранять канал прямого ADB',
      'other': 'Сохранять этот канал',
    });
    return '$_temp0';
  }

  @override
  String get phoneKeepRootDescription =>
      'После обрыва, перезапуска приложения или телефона DSH Go сам снова запрашивает доступ у менеджера root. Решает всё равно менеджер.';

  @override
  String get phoneKeepSharedDescription =>
      'После обрыва, перезапуска приложения или телефона DSH Go переподключается с уже имеющимся разрешением. Разрешение он не запрашивает.';

  @override
  String get phoneKeepAdbDescription =>
      'После обрыва, перезапуска приложения или телефона DSH Go переподключается по Wi‑Fi с текущей парой. Если есть разрешение из «Автоматически восстанавливать специальные возможности», он также один раз попробует включить беспроводную отладку.';

  @override
  String get phoneKeepRestoring => 'Переподключение';

  @override
  String get phoneKeepWaiting => 'Жду канал';

  @override
  String get phoneKeepWaitingService => 'Жду запуска службы';

  @override
  String get phoneKeepWaitingPermission => 'Нет разрешения. Переподключится, когда вы его выдадите.';

  @override
  String get phoneKeepWaitingNetwork => 'Жду Wi‑Fi';

  @override
  String get phoneKeepNotPaired => 'Нет сопряжения. Сначала сопрягите беспроводную отладку.';

  @override
  String get phoneKeepFailed =>
      'Не удалось переподключиться. Повторит попытку при открытии приложения или запуске задачи.';

  @override
  String get phoneModeTitle => 'Как DSH подтверждает действия';

  @override
  String get phoneModeMessage => 'Это можно изменить в настройках в любое время';

  @override
  String get phoneModeAsk => 'Спрашивать на важных шагах';

  @override
  String get phoneModeAskHint => 'Перед новым приложением, отправкой, удалением или оплатой';

  @override
  String get phoneModeAuto => 'Полностью автоматически';

  @override
  String get phoneModeAutoHint => 'Не спрашивает и не прерывает';

  @override
  String get phoneModeAutoNoteTitle => 'Это остаётся за вами';

  @override
  String get phoneModeAutoNote =>
      'Системные настройки и страницы разрешений, пароли и коды подтверждения, а также сам DSH Go остаются за вами. Банковские и платёжные приложения по умолчанию запрещены; это можно изменить в настройках.';

  @override
  String get phoneModeAutoUnlockNote =>
      'Чтобы ИИ мог работать с системными настройками, паролями и подобным, включите это в «Настройки › Управление телефоном › Снять ограничения».';

  @override
  String get phoneModeConfirmAuto => 'Перейти в полный автомат';

  @override
  String get phoneYoursTitle => 'Это остаётся за вами';

  @override
  String get phoneYoursSystem => 'Системные настройки и страницы разрешений';

  @override
  String get phoneYoursSecrets => 'Пароли и коды подтверждения';

  @override
  String get phoneYoursOwnApp => 'Сам DSH Go';

  @override
  String get phoneYoursDenyList =>
      'Приложения с режимом «Не трогать» в правилах приложений; банковские и платёжные — по умолчанию';

  @override
  String get phoneUnlockTitle => 'Снять ограничения';

  @override
  String get phoneUnlockSubtitle => 'Разрешить ИИ то, что обычно остаётся за вами';

  @override
  String get phoneUnlockSystem => 'Системные настройки';

  @override
  String get phoneUnlockSystemHint => 'Разрешения, установщики, центр безопасности, уведомления';

  @override
  String get phoneUnlockSecrets => 'Пароли и коды';

  @override
  String get phoneUnlockSecretsHint => 'Ввод паролей, кодов подтверждения и оплаты';

  @override
  String get phoneUnlockOwnApp => 'Сам DSH Go';

  @override
  String get phoneUnlockOwnAppHint => 'Нажатия и ввод внутри DSH Go';

  @override
  String get phoneUnlockBusy => 'Нельзя включить во время выполнения задачи';

  @override
  String get phoneUnlockFootnote =>
      'После включения ответственность за последствия на вас. Включайте только при необходимости и выключайте после.';

  @override
  String get phoneUnlockBanks => 'Банковские и платёжные приложения';

  @override
  String get phoneUnlockBanksHint => 'Изменить в правилах приложений';

  @override
  String get phoneUnlockNone => 'Ничего не включено';

  @override
  String phoneUnlockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count включено',
      many: '$count включено',
      few: '$count включено',
      one: '$count включено',
    );
    return '$_temp0';
  }

  @override
  String get phoneUnlockedBadge => 'Ограничения сняты';

  @override
  String get phoneUnlockConfirmSystemTitle => 'Разрешить ИИ управлять системными настройками?';

  @override
  String get phoneUnlockConfirmSecretsTitle => 'Разрешить ИИ вводить пароли и коды?';

  @override
  String get phoneUnlockConfirmOwnAppTitle => 'Разрешить ИИ управлять самим DSH Go?';

  @override
  String get phoneUnlockCanTitle => 'После включения ИИ сможет';

  @override
  String get phoneUnlockRiskTitle => 'Что может пойти не так';

  @override
  String get phoneUnlockDisclaimerTitle => 'Предупреждение';

  @override
  String get phoneUnlockSystemCan1 =>
      'Открывать и менять системные настройки, включая разрешения, специальные возможности и параметры разработчика';

  @override
  String get phoneUnlockSystemCan2 => 'Устанавливать, обновлять и удалять приложения через установщик';

  @override
  String get phoneUnlockSystemCan3 =>
      'Нажимать в центре безопасности и шторке уведомлений, включая кнопки в уведомлениях';

  @override
  String get phoneUnlockSystemRisk1 =>
      'Вредоносные инструкции на веб-странице, в сообщении или файле могут заставить ИИ отключить защиту, выдать разрешения другим приложениям или установить приложения';

  @override
  String get phoneUnlockSystemRisk2 =>
      'Случайно изменённые настройки сети, аккаунта или безопасности придётся восстанавливать вам';

  @override
  String get phoneUnlockSecretsCan1 => 'Вводить текст в поля паролей, кодов подтверждения и оплаты';

  @override
  String get phoneUnlockSecretsCan2 =>
      'Использовать коды из чатов, сообщений и уведомлений для входа или подтверждения';

  @override
  String get phoneUnlockSecretsCan3 => 'В журнале действий будут ••••, а не введённый текст';

  @override
  String get phoneUnlockSecretsRisk1 =>
      'Вредоносные инструкции могут заставить ИИ ввести код в другом месте и пустить кого-то в ваш аккаунт';

  @override
  String get phoneUnlockSecretsRisk2 => 'Он может провести платёж или перевод, которых вы не хотели';

  @override
  String get phoneUnlockOwnAppCan1 => 'Нажимать и вводить текст внутри DSH Go, включая изменение настроек';

  @override
  String get phoneUnlockOwnAppCan2 => 'Читать переписку и настройки на экранах DSH Go';

  @override
  String get phoneUnlockOwnAppRisk1 =>
      'Вредоносные инструкции могут заставить ИИ одобрять свои запросы или отключать подтверждения';

  @override
  String get phoneUnlockOwnAppRisk2 => 'Содержимое этих экранов отправляется модели';

  @override
  String get phoneUnlockDisclaimer1 =>
      'После включения ИИ сможет делать всё перечисленное без чьего-либо подтверждения.';

  @override
  String get phoneUnlockDisclaimer2 => 'ИИ можно обмануть содержимым веб-страниц, сообщений или файлов.';

  @override
  String get phoneUnlockDisclaimer3 =>
      'Любые потери аккаунтов, денег, данных или устройства вы несёте сами. DSH Go и его разработчики ответственности не несут.';

  @override
  String get phoneUnlockDisclaimer4 => 'Включайте только при необходимости и выключайте после.';

  @override
  String get phoneUnlockDisclaimer5 =>
      'Не рекомендуем включать это на устройстве с платёжными или банковскими данными.';

  @override
  String get phoneUnlockHold => 'Я понимаю риски, включить';

  @override
  String get phoneUnlockHoldHint => 'Удерживайте около 1,5 секунды';

  @override
  String phoneUnlockOnNotice(String name) {
    return '«$name» включено';
  }

  @override
  String phoneUnlockOffNotice(String name) {
    return '«$name» выключено';
  }

  @override
  String get searchKwPhoneUnlock =>
      'снять ограничения,разблокировать,пароли,коды,системные настройки,сам,риск,предупреждение';

  @override
  String get pluginConfigUnsaved => 'Не сохранено';

  @override
  String get pluginConfigSecretSet => 'Задано';

  @override
  String get pluginConfigAdvanced => 'Дополнительно';

  @override
  String get pluginConfigSearchHint => 'Поиск в настройках';

  @override
  String get pluginConfigNoMatch => 'Ничего не найдено';

  @override
  String get pluginConfigOpenWeb => 'Настроить на сайте';

  @override
  String get pluginConfigOpenWebHint => 'Собственная страница плагина';

  @override
  String get pluginConfigResetAll => 'Сбросить всё к умолчаниям';

  @override
  String get pluginConfigResetAllTitle => 'Сбросить всё к умолчаниям?';

  @override
  String get pluginConfigReset => 'Сбросить';

  @override
  String pluginConfigChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изменения',
      many: '$count изменений',
      few: '$count изменения',
      one: '$count изменение',
    );
    return '$_temp0';
  }

  @override
  String get pluginConfigAppliesOnReload => 'Сохранение перезагрузит плагин';

  @override
  String get pluginConfigSaving => 'Сохранение…';

  @override
  String get pluginConfigReloading => 'Перезагрузка…';

  @override
  String get pluginConfigApplied => 'Применено';

  @override
  String get pluginConfigFailed => 'Не применилось';

  @override
  String get pluginConfigRestored => 'Прежние настройки восстановлены';

  @override
  String get pluginConfigStopped => 'Не применилось, и прежние настройки не удалось восстановить';

  @override
  String get pluginConfigRestore => 'Восстановить';

  @override
  String get pluginConfigDiscard => 'Не сохранять';

  @override
  String get pluginConfigNotStarted => 'Плагин не запустился';

  @override
  String get pluginConfigNone => 'Нечего настраивать';

  @override
  String get pluginConfigInvalidOperation => 'Это изменение нельзя применить';

  @override
  String get pluginConfigGone => 'Плагин больше не работает. Обновлено.';

  @override
  String get pluginConfigUnknown => 'Соединение потеряно. Настройки перезагружены.';

  @override
  String get pluginConfigUnsupported => 'Пока нельзя настроить здесь';

  @override
  String get pluginConfigSecretUnbound => 'Нужна поддержка плагина';

  @override
  String get pluginConfigListFailed => 'Не удалось прочитать список плагинов. Повторите позже.';

  @override
  String get pluginConfigListUpdating => 'Список плагинов обновляется. Повторите через мгновение.';

  @override
  String get pluginConfigFixed => 'Задано файлом конфигурации';

  @override
  String get pluginConfigFixedNote => 'Задано файлом конфигурации. Здесь только просмотр.';

  @override
  String get pluginConfigReadOnly => 'Только чтение';

  @override
  String pluginConfigEntryTitle(String bundle, String entry) {
    return '$bundle · $entry';
  }

  @override
  String get pluginConfigNameSpeechToText => 'Распознавание речи';

  @override
  String get pluginConfigNameSenseVoice => 'Распознавание SenseVoice';

  @override
  String get pluginConfigNameSpeechApi => 'API транскрипции';

  @override
  String get pluginConfigNameTranslator => 'Служба перевода';

  @override
  String get pluginConfigNameSessionIndex => 'Индекс сессий';

  @override
  String get pluginConfigNameSessionSearchTool => 'Инструмент поиска по сессиям';

  @override
  String get pluginConfigNameTerminalService => 'Служба терминала';

  @override
  String get pluginConfigNameTerminalBash => 'Терминал Bash';

  @override
  String get pluginConfigNameTerminalPwsh => 'Терминал PowerShell';

  @override
  String get pluginConfigNameTerminalTools => 'Инструменты терминала';

  @override
  String get pluginConfigNameWorktree => 'Менеджер worktree';

  @override
  String get pluginConfigNameWorktreeTools => 'Инструменты worktree';

  @override
  String get pluginConfigNameRalphWorkflow => 'Движок рабочих процессов';

  @override
  String get pluginConfigNameRalphTools => 'Инструменты Ralph';

  @override
  String get plugInputRequired => 'Заполните это поле';

  @override
  String get plugInputInvalidValue => 'Неверное значение';

  @override
  String get plugInputNumber => 'Введите корректное число';

  @override
  String plugInputBounds(String min, String max) {
    return 'Введите значение от $min до $max';
  }

  @override
  String plugInputLength(int min, int max) {
    return 'Используйте от $min до $max символов';
  }

  @override
  String get plugInputPattern => 'Проверьте формат';

  @override
  String get plugInputDate => 'Выберите корректную дату';

  @override
  String get plugInputTime => 'Выберите корректное время';

  @override
  String get plugInputUnavailable => 'Этот компонент здесь не поддерживается';

  @override
  String get plugInputNoPassword => 'Плагины не могут использовать поля пароля';

  @override
  String get plugInputBadBinding => 'Привязка ввода должна быть путём к полю внутри data';

  @override
  String get plugInputDuplicateBinding => 'Каждое поле можно привязать только к одному вводу';

  @override
  String get plugInputNamedPattern => 'Используйте встроенный шаблон проверки';

  @override
  String get plugInputNestedForm => 'Формы не могут быть вложенными';

  @override
  String get plugInputSubmitMissing => 'Форме нужно действие отправки';

  @override
  String get plugInputTooLarge => 'Слишком много содержимого. Сократите и повторите';

  @override
  String get plugInputCheckFields => 'Проверьте выделенные поля';

  @override
  String get plugInputFailed => 'Не сохранено. Повторите';

  @override
  String get plugInputSubmit => 'Сохранить';

  @override
  String get plugInputChoose => 'Выбрать';

  @override
  String get plugInputPrevious => 'Назад';

  @override
  String get plugInputNext => 'Далее';

  @override
  String plugInputDecrease(String label) {
    return 'Уменьшить $label';
  }

  @override
  String plugInputIncrease(String label) {
    return 'Увеличить $label';
  }

  @override
  String plugInputRating(String label, int value, int max) {
    return '$label: $value из $max';
  }

  @override
  String get plugInputFormula => 'Неверная формула или превышен её предел';

  @override
  String get plugInputDatePicker => 'Дата плагина';

  @override
  String get plugInputTimePicker => 'Время плагина';

  @override
  String get plugInputChoices => 'Выбор плагина';

  @override
  String get plugInputGestureRequired => 'Для этого эффекта нужно нажатие пользователя';

  @override
  String get pluginsOperationHostChanged => 'Хост изменился — ничего не выполнено';

  @override
  String get pluginsReloadLocal => 'Перезапустите движок, чтобы перезагрузить';

  @override
  String get pluginsReloadInterrupts => 'Прерывает выполняющиеся задачи';

  @override
  String pluginsReloadConfirm(String name) {
    return 'Перезагрузить «$name»?';
  }

  @override
  String get pluginsReloadExplanation =>
      'Это перезапустит локальный движок и перезагрузит плагины. Выполняющиеся задачи будут прерваны.';

  @override
  String get pluginsReloadProceed => 'Перезапустить и перезагрузить';

  @override
  String get pluginsReloadRequested => 'Запрошен перезапуск движка';

  @override
  String get pluginsReloadChanged => 'Состояние хоста или плагинов изменилось. Повторите попытку.';

  @override
  String get pluginsReloadFailed => 'Не удалось перезапустить движок. Проверьте его журнал.';

  @override
  String get pluginsFile => 'Файл';

  @override
  String get pluginsChat => 'Чат';

  @override
  String get pluginsImage => 'Изображение';

  @override
  String get pluginsNamespaceDefaultModel => 'Модель по умолчанию';

  @override
  String get pluginsNamespaceDefaultPreset => 'Пресет по умолчанию';

  @override
  String get pluginsNamespaceAgent => 'Агент';

  @override
  String get pluginsNamespaceSubagent => 'Субагент';

  @override
  String get pluginsNamespaceSubagentModels => 'Модели субагентов';

  @override
  String get pluginsNamespaceDeepSeekModel => 'Модель DeepSeek';

  @override
  String get pluginsNamespaceAccountModel => 'Модель аккаунта DeepSeek';

  @override
  String get pluginsNamespaceCustomModels => 'Сервис своих моделей';

  @override
  String get pluginsNamespaceNetwork => 'Доступ в интернет';

  @override
  String get pluginsNamespaceWebSearch => 'Веб-поиск';

  @override
  String get pluginsNamespaceSearchApi => 'API веб-поиска';

  @override
  String get pluginsNamespaceCommands => 'Выполнение команд';

  @override
  String get pluginsNamespacePermissions => 'Разрешения';

  @override
  String get pluginsNamespaceChatLog => 'Журнал чата';

  @override
  String get pluginsNamespaceThinkingTranslation => 'Перевод рассуждений';

  @override
  String get pluginsNamespaceTranslation => 'Перевод';

  @override
  String get pluginsNamespaceLanguage => 'Язык';

  @override
  String get pluginsNamespaceWebAppearance => 'Внешний вид веба';

  @override
  String get pluginsNamespaceWebChat => 'Веб-чат';

  @override
  String get pluginsNamespaceWebInput => 'Ввод в вебе';

  @override
  String get pluginsNamespaceWebSettings => 'Настройки веба';

  @override
  String get pluginsNamespaceWebGeneral => 'Общие настройки веба';

  @override
  String get pluginsNamespaceAutoReview => 'Автопроверка';

  @override
  String get pluginsNamespaceAgentTeam => 'Команда агентов';

  @override
  String get pluginsNamespaceVoiceInput => 'Голосовой ввод';

  @override
  String get pluginsOfficialPlugin => 'Официальный плагин';

  @override
  String get pluginsLocalUnshareable => 'Установлен локально, нельзя поделиться';

  @override
  String pluginsIncludesPresets(String names) {
    return 'Включает пресеты «$names»';
  }

  @override
  String get pluginsSecretsUnshareable => 'Содержит секреты, нельзя поделиться';

  @override
  String pluginsLineCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count строки',
      many: '$count строк',
      few: '$count строки',
      one: '$count строка',
    );
    return '$_temp0';
  }

  @override
  String get pluginsEmptyValue => 'Пусто';

  @override
  String get pluginsOnValue => 'Вкл.';

  @override
  String get pluginsOffValue => 'Выкл.';

  @override
  String get pluginsOfficialUnavailable => 'На этом хосте нет такого официального плагина';

  @override
  String get pluginsEnabled => 'Включён';

  @override
  String get pluginsVersionMismatch => 'Версия отличается от общей';

  @override
  String get pluginsCurrentVersion => 'Текущая версия';

  @override
  String get pluginsNewVersion => 'Новая версия';

  @override
  String pluginsAddedWith(String title) {
    return 'Добавлено вместе с «$title»';
  }

  @override
  String pluginsApplyAfterInstall(String detail) {
    return 'Применить после установки плагинов · $detail';
  }

  @override
  String get pluginsSettingsReadFailed => 'Не удалось прочитать настройки этого хоста';

  @override
  String get pluginsSettingUnavailable => 'На этом хосте нет такой настройки';

  @override
  String get pluginsSettingsReadOnly => 'Настройки этого хоста доступны только для чтения';

  @override
  String get pluginsImportLocalOnly => 'Импорт возможен только на этот телефон';

  @override
  String get pluginsReplaceSkill => 'Заменить навык с тем же именем';

  @override
  String get pluginsReplaceContent => 'Заменить существующее содержимое';

  @override
  String get pluginsSafeModeInstallBlocked => 'В безопасном режиме плагины не устанавливаются';

  @override
  String get pluginsHostInstallBlocked => 'Отсюда нельзя устанавливать плагины на этот хост';

  @override
  String get pluginsInstallFailed => 'Не удалось установить';

  @override
  String get pluginsAfterRestart => 'Вступит в силу после перезапуска';

  @override
  String get pluginsSettingsChanged => 'Настройки только что изменились';

  @override
  String get pluginsWriteFailed => 'Не удалось записать';

  @override
  String get pluginsHostUnreachable => 'Хост недоступен';

  @override
  String get pluginsFileWriteFailed => 'Не удалось записать файл';

  @override
  String get pluginsProfileTitle => 'Настройки DSH Go';

  @override
  String get pluginsGistTokenInvalid => 'Токен GitHub недействителен или не имеет доступа к Gist';

  @override
  String pluginsGistCreateHttpFailed(int status) {
    return 'Не удалось создать Gist (HTTP $status)';
  }

  @override
  String get pluginsGistCreateFailed => 'Не удалось создать Gist';

  @override
  String get pluginsGitHubUnreachable => 'GitHub недоступен';

  @override
  String get pluginsGitHubTimeout => 'Истекло время подключения к GitHub';

  @override
  String get pluginsGistNotFound => 'Gist не найден';

  @override
  String get pluginsGistNoProfile => 'В этом Gist нет настроек для импорта';

  @override
  String get pluginsGistReadFailed => 'Не удалось прочитать Gist';

  @override
  String get pluginsListReadFailed => 'Не удалось прочитать список плагинов';

  @override
  String get pluginsReadingPlugins => 'Читаю плагины…';

  @override
  String get pluginsDshOfficial => 'Официальные DSH';

  @override
  String get pluginsOfficialToggleOnly =>
      'Официальные компоненты можно только включать и выключать; они действуют во всех чатах на этом хосте';

  @override
  String get pluginsOfficial => 'Официальный';

  @override
  String get pluginsNoThirdParty => 'Сторонних плагинов пока нет';

  @override
  String get pluginsPluginsDescription => 'Добавьте в DSH инструменты, память и модели';

  @override
  String get pluginsBrowseMarket => 'Каталог плагинов';

  @override
  String get pluginsLoading => 'Загрузка';

  @override
  String get pluginsIslandClosed => 'Интерфейс плагина закрыт';

  @override
  String get pluginsReopen => 'Открыть снова';

  @override
  String pluginsOpenBrowserHost(String host) {
    return 'Открыть $host в браузере?';
  }

  @override
  String get pluginsSearch => 'Поиск плагинов';

  @override
  String get pluginsMarketLoading => 'Загружаю каталог плагинов…';

  @override
  String get pluginsMarketLoadFailed => 'Не удалось открыть каталог плагинов';

  @override
  String get pluginsMarketInvalid => 'Неверный формат каталога';

  @override
  String get pluginsAll => 'Все';

  @override
  String pluginsMarketCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count плагина',
      many: '$count плагинов',
      few: '$count плагина',
      one: '$count плагин',
    );
    return '$_temp0 · из dshfind';
  }

  @override
  String get pluginsHideWeb => 'Скрыть веб-плагины';

  @override
  String pluginsShowWebCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Показать $count веб-плагина',
      many: 'Показать $count веб-плагинов',
      few: 'Показать $count веб-плагина',
      one: 'Показать $count веб-плагин',
    );
    return '$_temp0';
  }

  @override
  String get pluginsNoCategoryPlugins => 'В этой категории нет плагинов';

  @override
  String pluginsNoSearchResults(String query) {
    return 'Нет результатов по запросу «$query»';
  }

  @override
  String pluginsFailureDetails(String title) {
    return '$title · Нажмите, чтобы открыть';
  }

  @override
  String get pluginsFeatured => 'Рекомендуемые';

  @override
  String pluginsInstalledRemoteRestart(String name, String host) {
    return 'Установлен «$name». Перезапустите DSH на $host, чтобы применить.';
  }

  @override
  String pluginsInstalledNamed(String name) {
    return 'Установлен «$name»';
  }

  @override
  String get pluginsInstallCancelled => 'Установка отменена';

  @override
  String pluginsInstallFailureNamed(String name, String reason) {
    return '«$name» $reason';
  }

  @override
  String get pluginsRestartRequired => 'Требуется перезапуск движка';

  @override
  String pluginsRestartExplanation(String name) {
    return 'Перезапустите движок, чтобы применить «$name». Текущие ответы прервутся.';
  }

  @override
  String get pluginsRestartEngine => 'Перезапустить движок';

  @override
  String get pluginsAllowBuildScripts => 'Разрешить скрипты сборки?';

  @override
  String get pluginsBuildScriptPackages => 'Эти пакеты запускают скрипты при установке:';

  @override
  String pluginsBuildScriptWarning(String host) {
    return 'Скрипты выполняются с правами DSH на $host и могут читать и записывать файлы и обращаться в интернет. Разрешайте, только если доверяете плагину.';
  }

  @override
  String get pluginsThisDevice => 'Это устройство';

  @override
  String get pluginsAllowRetry => 'Разрешить и повторить';

  @override
  String pluginsUpdateNamed(String name) {
    return 'Обновить «$name»?';
  }

  @override
  String pluginsUninstallNamed(String title) {
    return 'Удалить «$title»?';
  }

  @override
  String pluginsUninstallExplanation(String host) {
    return 'Плагин будет удалён с $host. Его данные и настройки останутся.';
  }

  @override
  String get pluginsThisHost => 'Этот хост';

  @override
  String get pluginsUninstall => 'Удалить';

  @override
  String pluginsUninstalledNamed(String title) {
    return 'Удалён «$title»';
  }

  @override
  String get pluginsRestartNow => 'Перезапустить сейчас';

  @override
  String get pluginsUninstallFailed => 'Не удалось удалить';

  @override
  String get pluginsThatComputer => 'Тот компьютер';

  @override
  String get pluginsCommandAfterInstall =>
      'После установки перезапустите DSH на том компьютере и обновите страницу здесь';

  @override
  String get pluginsError => 'Ошибка';

  @override
  String get pluginsInventoryTitle => 'Состав плагинов';

  @override
  String get pluginsGlobalPlugins => 'Глобальные плагины';

  @override
  String get pluginsAgentPresets => 'Пресеты агентов';

  @override
  String get pluginsInventoryReadFailed => 'Не удалось прочитать состав плагинов';

  @override
  String pluginsComponentCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count компонента',
      many: '$count компонентов',
      few: '$count компонента',
      one: '$count компонент',
    );
    return '$_temp0';
  }

  @override
  String pluginsEnabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count включены',
      many: '$count включены',
      few: '$count включены',
      one: '$count включён',
    );
    return '$_temp0';
  }

  @override
  String pluginsErrorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ошибки',
      many: '$count ошибок',
      few: '$count ошибки',
      one: '$count ошибка',
    );
    return '$_temp0';
  }

  @override
  String get pluginsNoPlugins => 'Нет плагинов';

  @override
  String get pluginsNoMatchingPlugins => 'Нет подходящих плагинов';

  @override
  String get pluginsPresetLoadFailed => 'Не удалось загрузить этот пресет';

  @override
  String get pluginsPresetNoPlugins => 'В этом пресете нет плагинов';

  @override
  String get pluginsStandard => 'Стандартный';

  @override
  String get pluginsMinimal => 'Минимальный';

  @override
  String pluginsDefaultPresetName(String name) {
    return '$name (по умолчанию)';
  }

  @override
  String get pluginsSystemComponents => 'Системные компоненты';

  @override
  String pluginsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента',
      many: '$count элементов',
      few: '$count элемента',
      one: '$count элемент',
    );
    return '$_temp0';
  }

  @override
  String get pluginsSource => 'Источник';

  @override
  String get pluginsDisableCondition => 'Отключается, когда';

  @override
  String get pluginsProvidedByPreset => 'Из пресета';

  @override
  String get pluginsDetailsTitle => 'О плагине';

  @override
  String pluginsPackageInfoError(String error) {
    return 'Неверные сведения о пакете: $error';
  }

  @override
  String get pluginsInstalling => 'Установка';

  @override
  String get pluginsGet => 'Получить';

  @override
  String get pluginsLoadingCannotCancel => 'Загрузка плагина. Этот шаг нельзя отменить.';

  @override
  String get pluginsInstallDuration => 'Займёт минуту-две. Можно уйти со страницы.';

  @override
  String get pluginsViewInstallLogs => 'Журнал установки';

  @override
  String get pluginsViewDetails => 'Подробнее';

  @override
  String get pluginsCopyCommand => 'Копировать команду';

  @override
  String get pluginsCommandCopied => 'Команда скопирована';

  @override
  String get pluginsMissingFiles => 'Файлы плагина отсутствуют. Переустановите его.';

  @override
  String get pluginsNotDshPlugin => 'Это не плагин DSH, загрузка невозможна';

  @override
  String get pluginsIncompatible => 'Несовместим с этой версией DSH, не загружен';

  @override
  String pluginsRequiresDshVersion(String requiredVersion, String currentVersion) {
    return 'Требуется DSH $requiredVersion, сейчас $currentVersion, не загружен';
  }

  @override
  String pluginsLoadFailure(String reason) {
    return 'Не удалось загрузить: $reason';
  }

  @override
  String get pluginsUnknownReason => 'Причина неизвестна';

  @override
  String pluginsBundleProblem(String reason) {
    return 'Проблема: $reason';
  }

  @override
  String pluginsRefreshFailure(String reason) {
    return 'Не удалось обновить: $reason';
  }

  @override
  String get pluginsTitle => 'Плагины';

  @override
  String get pluginsRefresh => 'Обновить';

  @override
  String get pluginsMarketTitle => 'Магазин плагинов';

  @override
  String get pluginsConnectToManage => 'Подключитесь к движку, чтобы управлять плагинами';

  @override
  String get pluginsSafeModeOperationsBlocked => 'В безопасном режиме нельзя устанавливать и удалять плагины';

  @override
  String pluginsRelayToggleOnly(String host) {
    return '$host · Relay поддерживает только включение и отключение плагинов. Установите на том компьютере.';
  }

  @override
  String get pluginsInstallThisPhone => 'Установить на: Этот телефон';

  @override
  String pluginsInstallHost(String host) {
    return 'Установить на: $host';
  }

  @override
  String get pluginsOfflineDescription =>
      'Установленные плагины появятся, когда движок запустится. Магазин можно смотреть уже сейчас.';

  @override
  String get pluginsIconChanged => 'Иконка выбрана. Вернитесь на главный экран, чтобы увидеть изменение.';

  @override
  String get pluginsIconChangeFailed => 'Не удалось сменить иконку. Попробуйте позже.';

  @override
  String get pluginsTheme => 'Тема';

  @override
  String get pluginsColors => 'Цвета';

  @override
  String get pluginsFeatureIcons => 'Иконки функций';

  @override
  String get pluginsAppIcon => 'Иконка приложения';

  @override
  String get pluginsCustomColor => 'Свой';

  @override
  String pluginsColorLabel(String label) {
    return 'Цвет: $label';
  }

  @override
  String get pluginsCoral => 'Коралловый';

  @override
  String get pluginsRouge => 'Руж';

  @override
  String get pluginsOchre => 'Охра';

  @override
  String get pluginsMoss => 'Мох';

  @override
  String get pluginsLake => 'Озеро';

  @override
  String get pluginsIndigo => 'Индиго';

  @override
  String get pluginsHue => 'Оттенок';

  @override
  String get pluginsWallpaper => 'Обои';

  @override
  String get pluginsFollowWallpaper => 'Цвета обоев';

  @override
  String get pluginsAllowHighPower => 'Разрешить повышенный расход в фоне';

  @override
  String pluginsVivoBatteryPath(String app) {
    return 'Батарея › Управление энергопотреблением в фоне › $app';
  }

  @override
  String get pluginsXiaomiBatterySetting => 'Экономия заряда: без ограничений';

  @override
  String pluginsXiaomiBatteryPath(String app) {
    return 'Управление приложениями › $app › Экономия заряда';
  }

  @override
  String get pluginsHuaweiBatterySetting => 'Разрешить активность в фоне';

  @override
  String pluginsHuaweiBatteryPath(String app) {
    return 'Батарея › Запуск приложений › $app';
  }

  @override
  String get pluginsOppoBatterySetting => 'Разрешить активность в фоне';

  @override
  String pluginsOppoBatteryPath(String app) {
    return 'Батарея › Управление батареей приложений › $app';
  }

  @override
  String get pluginsSamsungBatterySetting => 'Батарея: без ограничений';

  @override
  String pluginsSamsungBatteryPath(String app) {
    return 'Приложения › $app › Батарея';
  }

  @override
  String get pluginsVivoBatteryStep => 'Включите «Разрешить повышенный расход в фоне»';

  @override
  String pluginsXiaomiBatteryFullPath(String app) {
    return 'Настройки приложений › Управление приложениями › $app › Экономия заряда › Без ограничений';
  }

  @override
  String get pluginsXiaomiAutostart => 'Включите «Автозапуск» на той же странице';

  @override
  String get pluginsHuaweiBatteryStep => 'Отключите «Управлять автоматически» и включите «Разрешить активность в фоне»';

  @override
  String get pluginsOppoBatteryStep => 'Включите «Разрешить активность в фоне»';

  @override
  String get pluginsSamsungBatteryStep => 'Выберите «Без ограничений»';

  @override
  String get pluginsBackgroundTitle => 'Работа в фоне';

  @override
  String get pluginsBackgroundDescription => 'Позволять чатам завершаться в фоне';

  @override
  String get pluginsSystem => 'Система';

  @override
  String get pluginsSystemBatteryOptimization => 'Системная оптимизация батареи';

  @override
  String get pluginsTurnedOff => 'Выкл.';

  @override
  String get pluginsNotTurnedOff => 'Вкл.';

  @override
  String get pluginsStayOnline => 'Оставаться в сети';

  @override
  String get pluginsKeepEngineNotification => 'Не скрывать уведомление «Движок работает»';

  @override
  String pluginsLockInRecents(String app) {
    return 'Закрепить $app в недавних приложениях';
  }

  @override
  String get pluginsPhoneBrands => 'Марки телефонов';

  @override
  String get pluginsOtherBrands => 'Другие марки';

  @override
  String pluginsConnectedHost(String host) {
    return 'Подключено ($host)';
  }

  @override
  String pluginsConnectionError(String error) {
    return 'Не удалось подключиться: $error';
  }

  @override
  String get pluginsConnecting => 'Подключение';

  @override
  String get pluginsDiagnosticsCopied => 'Диагностика скопирована';

  @override
  String get pluginsDiagnostics => 'Диагностика';

  @override
  String get pluginsDiagnosticsDescription => 'Приложите к сообщению об ошибке. Без ключей API и токенов.';

  @override
  String get pluginsRuntime => 'Среда выполнения';

  @override
  String get pluginsArchitecture => 'Архитектура';

  @override
  String get pluginsBundledVersion => 'Встроенная версия';

  @override
  String get pluginsInstalledVersion => 'Установленная версия';

  @override
  String get pluginsErrorLabel => 'Ошибка';

  @override
  String get pluginsConnection => 'Подключение';

  @override
  String get pluginsAddress => 'Адрес';

  @override
  String get pluginsClient => 'Клиент';

  @override
  String get pluginsConfigured => 'Задан';

  @override
  String get pluginsExport => 'Экспорт';

  @override
  String get pluginsCopyDiagnostics => 'Копировать диагностику';

  @override
  String get pluginsDiagnosticsContents => 'Только версии и состояние подключения';

  @override
  String get pluginsNotificationsPartlyBlocked => 'Часть заблокирована системой';

  @override
  String get pluginsNotificationsBlocked => 'Заблокированы системой';

  @override
  String get pluginsTurnedOn => 'Вкл.';

  @override
  String get pluginsNotifications => 'Уведомления';

  @override
  String get pluginsNotificationSettingsFailed =>
      'Не удалось открыть настройки системы. Включите уведомления в разделе Настройки → Приложения → DSH Go → Уведомления.';

  @override
  String get pluginsSystemNotificationsOff => 'Системные уведомления выключены';

  @override
  String get pluginsBackgroundNoAlerts => 'В фоне вы не будете получать оповещения';

  @override
  String get pluginsApprovalNotificationsOff => 'Уведомления «Нужно подтверждение» выключены';

  @override
  String get pluginsBackgroundNoApprovalAlerts => 'В фоне вы не будете получать запросы на подтверждение';

  @override
  String get pluginsDoneNotificationsOff => 'Уведомления «Раунд завершён» выключены';

  @override
  String get pluginsBackgroundNoDoneAlerts => 'В фоне вы не будете получать оповещения о завершении и ошибках';

  @override
  String get pluginsTurnOn => 'Включить';

  @override
  String get pluginsNotificationsDescription => 'Оповещения, когда чат завершён или ждёт вас';

  @override
  String get pluginsAllowNotifications => 'Разрешить уведомления';

  @override
  String get pluginsNotificationsAndBanners => 'Системные уведомления и баннеры сверху';

  @override
  String get pluginsAlerts => 'Оповещения';

  @override
  String get pluginsRemoteAlertsRequirement =>
      'Для оповещений удалённого хоста приложение должно работать и быть подключено';

  @override
  String get pluginsTurnComplete => 'Раунд завершён';

  @override
  String get pluginsReplyPreview => 'Показывать начало ответа';

  @override
  String get pluginsErrorOrStopped => 'Ошибка или остановка';

  @override
  String get pluginsErrorOrStoppedDescription => 'Запрос не удался, движок перезапустился или работа остановлена';

  @override
  String get pluginsApprovalDescription => 'Нужно подтверждение для команд, изменения файлов и другого';

  @override
  String get pluginsQuestions => 'Вопросы к вам';

  @override
  String get pluginsQuestionsDescription => 'ИИ ждёт вашего ответа';

  @override
  String get pluginsSystemSettings => 'Настройки системы';

  @override
  String get pluginsLockScreenPrivacy => 'Содержимое чата скрыто на экране блокировки';

  @override
  String get pluginsSoundBannerLockScreen => 'Звук, баннеры и экран блокировки';

  @override
  String get pluginsEnableFloatingNotifications => 'Включите «Всплывающие уведомления», если баннеры не появляются';

  @override
  String get pluginsPersonalPreferences => 'Личные предпочтения';

  @override
  String get pluginsPreferencesDescription => 'Новые чаты будут следовать этим указаниям';

  @override
  String get pluginsPreferencesHint => 'Например: Отвечай по-китайски. Я в основном пишу на Flutter.';

  @override
  String get pluginsSaving => 'Сохранение';

  @override
  String get pluginsShareLink => 'Поделиться ссылкой';

  @override
  String get pluginsInstallPlugin => 'Установить плагин';

  @override
  String get pluginsImportProfile => 'Импортировать настройки';

  @override
  String get pluginsImportTo => 'Импортировать в';

  @override
  String get pluginsInstallTo => 'Установить в';

  @override
  String get pluginsVerification => 'Проверка';

  @override
  String get pluginsSize => 'Размер';

  @override
  String get pluginsVerified => 'Проверено';

  @override
  String get pluginsVerificationMismatch => 'Несовпадение при проверке';

  @override
  String get pluginsCannotVerify => 'Не удалось проверить';

  @override
  String get pluginsVerifying => 'Проверка';

  @override
  String get pluginsPresets => 'Наборы';

  @override
  String get pluginsSkills => 'Навыки';

  @override
  String get pluginsAdded => 'Добавлено';

  @override
  String get pluginsModified => 'Изменено';

  @override
  String get pluginsNoChanges => 'Изменения не нужны';

  @override
  String get pluginsUnavailable => 'Недоступно';

  @override
  String get pluginsHostProfileReadFailed => 'Не удалось прочитать настройки этого хоста';

  @override
  String get pluginsAlreadyMatches => 'Этот хост уже совпадает';

  @override
  String get pluginsUnsuccessful => 'Не удалось';

  @override
  String get pluginsSkipped => 'Пропущено';

  @override
  String get pluginsView => 'Просмотр';

  @override
  String get pluginsImport => 'Импорт';

  @override
  String get pluginsHostPluginsReadFailed => 'Не удалось прочитать плагины этого хоста';

  @override
  String pluginsUpdateTo(String version) {
    return 'Обновить до $version';
  }

  @override
  String pluginsImportCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Импортировать $count элемента',
      many: 'Импортировать $count элементов',
      few: 'Импортировать $count элемента',
      one: 'Импортировать $count элемент',
    );
    return '$_temp0';
  }

  @override
  String get pluginsImporting => 'Импорт…';

  @override
  String get pluginsInstallingActive => 'Установка';

  @override
  String pluginsImportFailedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента не импортировано',
      many: '$count элементов не импортировано',
      few: '$count элемента не импортировано',
      one: '$count элемент не импортирован',
    );
    return '$_temp0';
  }

  @override
  String get pluginsCouldNotInstall => 'Не удалось установить';

  @override
  String get pluginsEngineRestartToApply => 'Перезапустите движок, чтобы применить';

  @override
  String pluginsRemoteRestartToApply(String host) {
    return 'Перезапустите DSH на $host, чтобы применить';
  }

  @override
  String pluginsImportedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Импортировано $count элемента',
      many: 'Импортировано $count элементов',
      few: 'Импортировано $count элемента',
      one: 'Импортирован $count элемент',
    );
    return '$_temp0';
  }

  @override
  String get pluginsLocalPluginUnshareable => 'Этот плагин установлен локально, им нельзя поделиться';

  @override
  String get pluginsSharePlugin => 'Поделиться плагином';

  @override
  String pluginsPluginCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count плагина',
      many: '$count плагинов',
      few: '$count плагина',
      one: '$count плагин',
    );
    return '$_temp0';
  }

  @override
  String pluginsSettingsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count настройки',
      many: '$count настроек',
      few: '$count настройки',
      one: '$count настройка',
    );
    return '$_temp0';
  }

  @override
  String pluginsPresetCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count набора',
      many: '$count наборов',
      few: '$count набора',
      one: '$count набор',
    );
    return '$_temp0';
  }

  @override
  String pluginsSkillCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count навыка',
      many: '$count навыков',
      few: '$count навыка',
      one: '$count навык',
    );
    return '$_temp0';
  }

  @override
  String get pluginsNothingSelected => 'Ничего не выбрано';

  @override
  String get pluginsNext => 'Далее';

  @override
  String get pluginsNothingToShare => 'Нечем поделиться';

  @override
  String get pluginsProfileReadFailed => 'Не удалось прочитать настройки';

  @override
  String get pluginsShareProfile => 'Поделиться конфигурацией';

  @override
  String pluginsFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String get pluginsShareNeedsUpdate => 'Обновите приложение, чтобы открыть';

  @override
  String get pluginsShareUnusable => 'Этот код общего доступа нельзя использовать';

  @override
  String get pluginsShareDamaged => 'Этот код общего доступа неполный или повреждён';

  @override
  String get pluginsShareFileReadFailed => 'Не удалось прочитать этот файл';

  @override
  String get pluginsShareOpenFailed => 'Не удалось открыть этот код общего доступа';

  @override
  String get pluginsPluginShareTitle => 'Плагин DSH Go';

  @override
  String get pluginsShareSheetOpenFailed => 'Не удалось открыть меню «Поделиться»';

  @override
  String get pluginsSavePermissionDenied => 'Не удалось сохранить без доступа к памяти';

  @override
  String get pluginsQrCode => 'QR-код';

  @override
  String get pluginsSaveAsFile => 'Сохранить как файл';

  @override
  String get pluginsGistLinkReady => 'Ссылка на Gist создана';

  @override
  String get pluginsTooLargeShareFile => 'Слишком много содержимого. Поделитесь файлом.';

  @override
  String get pluginsGenerateLink => 'Создать ссылку';

  @override
  String get pluginsGitHubToken => 'Токен GitHub';

  @override
  String get pluginsGistPermissionNeeded => 'Требуется доступ к Gist';

  @override
  String get pluginsGenerateGistLink => 'Создать ссылку на Gist';

  @override
  String get pluginsShareQrCode => 'QR-код общего доступа';

  @override
  String pluginsUpdateCurrentWarning(String to) {
    return 'Текущая версия будет удалена, затем установится $to. Если установка не удастся, плагин придётся установить заново.';
  }

  @override
  String pluginsUpdateVersionWarning(String from, String to) {
    return '$from будет удалён, затем установится $to. Если установка не удастся, плагин придётся установить заново.';
  }

  @override
  String pluginsUninstalledRestartLocal(String title) {
    return '«$title» удалён. Перезапустите движок, чтобы завершить удаление.';
  }

  @override
  String pluginsUninstalledRestartRemote(String title, String host) {
    return '«$title» удалён. Перезапустите DSH на $host, чтобы завершить удаление.';
  }

  @override
  String get pluginsEnableFailed => 'Не удалось включить';

  @override
  String get pluginsDisableFailed => 'Не удалось выключить';

  @override
  String get pluginsEnabledRestartLocal => 'Включено. Перезапустите движок, чтобы применить.';

  @override
  String pluginsEnabledRestartRemote(String host) {
    return 'Включено. Перезапустите DSH на $host, чтобы применить.';
  }

  @override
  String get pluginsDisabledRestartLocal => 'Выключено. Перезапустите движок, чтобы применить.';

  @override
  String pluginsDisabledRestartRemote(String host) {
    return 'Выключено. Перезапустите DSH на $host, чтобы применить.';
  }

  @override
  String pluginsRelayCommandInstruction(String host) {
    return 'DSH Remote позволяет только включать и выключать плагины. Выполните это в терминале на $host:';
  }

  @override
  String get pluginsPermissionLocalThirdParty =>
      'Плагины работают с правами DSH: могут читать и записывать файлы, выполнять команды, читать ключи API и данные памяти телефона, к которым вы дали доступ. Песочница рабочей папки на них не распространяется. Предоставлено третьей стороной и не проверено DSH.';

  @override
  String get pluginsPermissionLocalTrusted =>
      'Плагины работают с правами DSH: могут читать и записывать файлы, выполнять команды, читать ключи API и данные памяти телефона, к которым вы дали доступ. Песочница рабочей папки на них не распространяется. Устанавливайте только те плагины, которым доверяете.';

  @override
  String get pluginsPermissionRemoteThirdParty =>
      'Плагины работают с правами DSH: могут читать и записывать файлы, выполнять команды и читать ключи API. Песочница рабочей папки на них не распространяется. Предоставлено третьей стороной и не проверено DSH.';

  @override
  String get pluginsPermissionRemoteTrusted =>
      'Плагины работают с правами DSH: могут читать и записывать файлы, выполнять команды и читать ключи API. Песочница рабочей папки на них не распространяется. Устанавливайте только те плагины, которым доверяете.';

  @override
  String pluginsSelectedQrCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выбрано $count элемента',
      many: 'Выбрано $count элементов',
      few: 'Выбрано $count элемента',
      one: 'Выбран $count элемент',
    );
    return '$_temp0 · доступен QR-код';
  }

  @override
  String pluginsSelectedFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выбрано $count элемента',
      many: 'Выбрано $count элементов',
      few: 'Выбрано $count элемента',
      one: 'Выбран $count элемент',
    );
    return '$_temp0 · поделиться файлом';
  }

  @override
  String get pluginsListSeparator => ', ';

  @override
  String pluginsActionFailure(String action, String reason) {
    return '$action: $reason';
  }

  @override
  String pluginsInventorySemantics(String title, String status) {
    return '$title, $status';
  }

  @override
  String pluginsSettingsChanges(String shown, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента',
      many: '$count элементов',
      few: '$count элемента',
      one: '$count элемент',
    );
    return '$shown и ещё · $_temp0';
  }

  @override
  String get pluginsLoadStatus => 'Состояние загрузки';

  @override
  String get pluginsLoadPartial => 'Частично активен';

  @override
  String get pluginsLoadFailed => 'Ошибка загрузки';

  @override
  String get pluginsLoadNotReady => 'Не готов';

  @override
  String get pluginsLoadMetadata => 'Диагностика метаданных';

  @override
  String pluginsLoadRunningCount(int running, int total) {
    return 'Работают компоненты: $running из $total';
  }

  @override
  String get pluginsLoadUnreported => 'Нет данных';

  @override
  String get pluginsLoadNoRuntimeDetail =>
      'Хост не вернул подробности ошибки среды выполнения. Проверьте журналы движка.';

  @override
  String get pluginsLoadRemoteLogs => 'Проверьте журналы движка на этом хосте.';

  @override
  String get plugslotsSurfaceComposerActions => 'Кнопки ввода';

  @override
  String get plugslotsSurfaceMessageActions => 'Меню сообщения';

  @override
  String get plugslotsSurfaceComposerStrip => 'Строка состояния';

  @override
  String get plugslotsSurfacePanel => 'Панели';

  @override
  String get plugslotsNativeUi => 'Нативный интерфейс';

  @override
  String plugslotsIssueCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count проблемы',
      many: '$count проблем',
      few: '$count проблемы',
      one: '$count проблема',
    );
    return '$_temp0';
  }

  @override
  String get plugslotsAllGood => 'Проблем нет';

  @override
  String plugslotsViewSize(String size) {
    return 'Просмотр $size';
  }

  @override
  String plugslotsInvokeMs(int ms) {
    return '$ms мс';
  }

  @override
  String get plugslotsLastView => 'Последний просмотр';

  @override
  String get plugslotsLastInvoke => 'Последний ответ';

  @override
  String get plugslotsProblems => 'Проблемы';

  @override
  String get plugslotsNoProblems => 'Проблем нет';

  @override
  String plugslotsWantsDraft(String plugin) {
    return '$plugin хочет прочитать ваш черновик';
  }

  @override
  String plugslotsWantsClipboard(String plugin) {
    return '$plugin хочет прочитать буфер обмена';
  }

  @override
  String plugslotsWantsBoth(String plugin) {
    return '$plugin хочет прочитать черновик и буфер обмена';
  }

  @override
  String get plugslotsWantsWhen => 'Только при нажатии';

  @override
  String get plugslotsAllow => 'Разрешить';

  @override
  String plugslotsNoResponse(String plugin) {
    return '$plugin не ответил';
  }

  @override
  String plugslotsFailed(String plugin) {
    return '$plugin столкнулся с проблемой';
  }

  @override
  String get plugslotsNeedsChat => 'Сначала откройте чат';

  @override
  String plugslotsFromPlugin(String plugin) {
    return 'От $plugin';
  }

  @override
  String get plugslotsPanelOffline => 'Плагин недоступен';

  @override
  String plugslotsIssueTrimmed(int max) {
    return 'Больше $max символов; сокращено';
  }

  @override
  String get plugslotsIssueNewerProtocol => 'Нужна более новая версия приложения';

  @override
  String plugslotsIssueUnknownEffect(String name) {
    return 'Эффект «$name» не поддерживается';
  }

  @override
  String get plugslotsIssueLate => 'Ответ пришёл позже 3 с после нажатия; проигнорирован';

  @override
  String get plugslotsIssueHttps => 'Только ссылки https';

  @override
  String plugslotsIssueUnknownPage(String page) {
    return 'Нет страницы «$page»';
  }

  @override
  String get plugslotsIssueThrottled => 'Уведомления слишком частые; пропущено';

  @override
  String get plugslotsIssueMissing => 'Не хватает обязательного поля';

  @override
  String get plugslotsIssueDuplicate => 'Повторяющийся id; пропущено';

  @override
  String plugslotsWantsMessage(String plugin) {
    return '$plugin хочет прочитать этот ответ';
  }

  @override
  String get plugslotsCodeInvalidManifest => 'Объявление неверно; нативные части отключены';

  @override
  String get plugslotsCodeInvalidField => 'Неверный формат; пропущено';

  @override
  String get plugslotsCodeUnknownField => 'Неизвестное поле; проигнорировано';

  @override
  String get plugslotsCodeUnknownSurface => 'Здесь пока не поддерживается; проигнорировано';

  @override
  String get plugslotsCodeTooMany => 'Слишком много; лишние скрыты';

  @override
  String get plugslotsCodeTooLong => 'Слишком длинно; сокращено';

  @override
  String get plugslotsCodeNoHandler => 'Плагин пока не обрабатывает это; скрыто';

  @override
  String get plugslotsCodeUndeclared => 'Зарегистрировано без объявления; проигнорировано';

  @override
  String get plugslotsCodeViewFile => 'Не удалось прочитать файл представления';

  @override
  String get plugslotsCodeBadEffect => 'Неверное действие; пропущено';

  @override
  String plugslotsCodeViolation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count раза',
      many: '$count раз',
      few: '$count раза',
      one: '$count раз',
    );
    return 'Сбой $_temp0';
  }

  @override
  String get plugslotsCodeDegraded => 'Слишком много ошибок; отключено до следующего запуска';

  @override
  String get plugslotsCodeTimeout => 'Плагин не ответил вовремя';

  @override
  String get plugslotsCodeRateLimited => 'Слишком быстрые нажатия';

  @override
  String get plugslotsCodeNotFound => 'Плагин отключён или отсутствует';

  @override
  String get plugslotsCodePluginError => 'Плагин дал сбой';

  @override
  String get plugslotsCodeInvalidView => 'Представление неверно';

  @override
  String get plugslotsCodeLimit => 'Слишком много подписок';

  @override
  String get plugslotsCodeOther => 'Другая проблема';

  @override
  String get plugslotsCodeUnknownEffect => 'Действие не поддерживается; пропущено';

  @override
  String get plugslotsNotDone => 'Не завершено';

  @override
  String get plugslotsWorking => 'В работе';

  @override
  String get plugslotsTapToCancel => 'Нажмите, чтобы отменить';

  @override
  String get plugslotsCodeTooManyPending => 'Два ещё выполняются';

  @override
  String get plugslotsCodeNoStream => 'Подключение оборвалось';

  @override
  String plugslotsVoiceAsk(String plugin) {
    return 'Разрешить $plugin слышать вашу речь?';
  }

  @override
  String get plugslotsVoiceWhen =>
      'Чтение останавливается, как только вы заговорите. Голос распознаётся на этом телефоне, не сохраняется и не отправляется';

  @override
  String get plugslotsVoiceDeny => 'Не разрешать';

  @override
  String get plugslotsVoiceSwitch => 'Слышать вашу речь';

  @override
  String get plugslotsPickerUnavailable => 'Выбор файлов недоступен на этом устройстве';

  @override
  String get plugslotsPickerBusy => 'Сначала завершите текущий выбор файлов';

  @override
  String plugslotsPickerLimit(int count) {
    return 'До $count файлов, по 8 МиБ, всего 16 МиБ';
  }

  @override
  String get plugslotsPickerFailed => 'Не удалось поделиться файлами с этим плагином. Попробуйте ещё раз';

  @override
  String get plugslotsWebPlacesTitle => 'В DSH Web';

  @override
  String get plugslotsPlaceBesideComposer => 'Рядом с полем ввода';

  @override
  String get plugslotsPlaceHeader => 'Заголовок беседы';

  @override
  String get plugslotsPlaceMessages => 'В сообщениях';

  @override
  String get plugslotsPlaceOverlay => 'Плавающий слой';

  @override
  String get plugslotsPlaceSidebar => 'Боковая панель';

  @override
  String get plugslotsPlaceRightbar => 'Правая панель';

  @override
  String get plugslotsPlaceFiles => 'Предпросмотр файлов';

  @override
  String get plugslotsPlaceSettings => 'Настройки';

  @override
  String get plugslotsPlacePlugins => 'Страница плагинов';

  @override
  String get plugslotsPlaceNewChat => 'Новая беседа';

  @override
  String get plugslotsPlaceElsewhere => 'В другом месте';

  @override
  String get plugslotsPlaceUnknown => 'Его веб-интерфейс';

  @override
  String get plugslotsChatEntry => 'Плагины';

  @override
  String plugslotsChatWebFrom(String names) {
    return 'Веб-плагины · $names';
  }

  @override
  String get plugViewInvalid => 'Ошибка в представлении плагина';

  @override
  String get plugViewEmpty => 'Пока нет данных';

  @override
  String get plugViewImageUnavailable => 'Не удалось показать изображение';

  @override
  String get plugViewUnavailableList => 'Не удалось показать список';

  @override
  String get plugViewUnavailableKeyValue => 'Не удалось показать детали';

  @override
  String get plugViewUnavailableProgress => 'Не удалось показать прогресс';

  @override
  String get plugViewUnavailableTable => 'Не удалось показать таблицу';

  @override
  String get plugViewUnavailableActions => 'Не удалось показать кнопки';

  @override
  String plugViewFrom(String name) {
    return 'От $name';
  }

  @override
  String plugViewUnknownTone(String value) {
    return 'Неизвестный тон $value, пропущен; доступны: good, warn, bad, info, muted';
  }

  @override
  String plugViewBadActionId(String value) {
    return 'Неверный id действия $value; элемент нельзя нажать';
  }

  @override
  String plugViewBadAction(String shape) {
    return 'Действие должно быть строкой id или $shape; пропущено';
  }

  @override
  String plugViewArgsLimit(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$limit байта',
      many: '$limit байт',
      few: '$limit байта',
      one: '$limit байт',
    );
    return 'Аргументы действия превышают $_temp0; пропущено';
  }

  @override
  String plugViewUnknownIcon(String value) {
    return 'Неизвестный значок $value; используется значок по умолчанию';
  }

  @override
  String plugViewExpectedItems(String shape) {
    return 'Ожидался массив $shape';
  }

  @override
  String plugViewSkippedItem(String shape) {
    return 'Ожидалось $shape; элемент пропущен';
  }

  @override
  String get plugViewBadMax => 'max должно быть числом больше 0; используется 100';

  @override
  String plugViewColumnLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first столбца',
      many: '$first столбцов',
      few: '$first столбца',
      one: '$first столбец',
    );
    return '$_temp0, превышает лимит $second';
  }

  @override
  String plugViewFirstColumns(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Показаны только первые $limit столбца',
      many: 'Показаны только первые $limit столбцов',
      few: 'Показаны только первые $limit столбца',
      one: 'Показан только $limit столбец',
    );
    return '$_temp0';
  }

  @override
  String plugViewFirstRows(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Показаны только первые $limit строки',
      many: 'Показаны только первые $limit строк',
      few: 'Показаны только первые $limit строки',
      one: 'Показана только $limit строка',
    );
    return '$_temp0';
  }

  @override
  String get plugViewOnePrimary => 'В представлении не больше одной основной кнопки; эта показана обычной';

  @override
  String get plugViewBadImageSource =>
      'Изображение принимает ресурс плагина (asset:<path>, png, jpg, webp или gif) или URL data:image/…';

  @override
  String get plugViewBadAspect => 'aspect должно быть числом от 0,25 до 4; пропущено';

  @override
  String plugViewImageTooLarge(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$limit байта',
      many: '$limit байт',
      few: '$limit байта',
      one: '$limit байт',
    );
    return 'Изображение data: превышает $_temp0';
  }

  @override
  String get plugViewImageDecode => 'Не удалось декодировать изображение (только PNG, JPEG, WebP или GIF)';

  @override
  String get plugViewImagePixels => 'Изображение превышает лимит: 4096 по стороне, всего 4 млн пикселей';

  @override
  String plugViewTooDeep(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$limit уровня',
      many: '$limit уровней',
      few: '$limit уровня',
      one: '$limit уровень',
    );
    return 'JSON вложен глубже, чем $_temp0';
  }

  @override
  String get plugViewV2Content => 'Содержимое плагина';

  @override
  String plugViewVersionFallback(String version) {
    return 'Версия представления $version не поддерживается; используется совместимое';
  }

  @override
  String plugViewStyleInvalid(String values) {
    return 'Неверный стиль; ожидалось $values';
  }

  @override
  String get plugViewStyleReserved => 'Этот вид зарезервирован за приложением; пропущено';

  @override
  String get plugViewStyleContainerOnly => 'Этот стиль доступен только для stack и row';

  @override
  String get plugViewStyleTextOnly => 'Этот стиль доступен только для text, metric и callout';

  @override
  String plugViewContrastAdjusted(String mode, String before, String after, String minimum) {
    return '$mode: $before скорректирован до $after, контраст не ниже $minimum:1';
  }

  @override
  String get plugViewRichLimit => 'Форматированный текст превышает лимит; обрезан';

  @override
  String plugViewBadTrend(int max) {
    return 'trend принимает от 2 до $max чисел (null разрешён); пропущено';
  }

  @override
  String plugViewGalleryPicture(int index) {
    return 'Изображение $index';
  }

  @override
  String get readListUpdating => 'Обновление · прошлые результаты';

  @override
  String get readListOffline => 'Не в сети · прошлые результаты';

  @override
  String get readListFailed => 'Не обновлено · прошлые результаты';

  @override
  String get remoteStartupSection => 'При запуске';

  @override
  String get remoteAutoConnectOnStartup => 'Подключаться к последнему хосту';

  @override
  String get remoteAutoConnectOnStartupHint => 'Если выключено, запуск на этом телефоне';

  @override
  String get remoteStepConnect => 'Подключение к серверу';

  @override
  String get remoteStepVerifyHostKey => 'Проверка отпечатка хоста';

  @override
  String get remoteStepStartDsh => 'Запуск DSH';

  @override
  String get remoteStepTunnel => 'Создание туннеля';

  @override
  String get remoteConnecting => 'Подключение';

  @override
  String get remoteConnected => 'Подключено';

  @override
  String get remoteReconnecting => 'Переподключение';

  @override
  String remoteReconnectAttempt(int count) {
    return 'Переподключение · попытка $count';
  }

  @override
  String get remoteErrInvalidServer => 'Неверный адрес сервера';

  @override
  String get remoteErrEmailPassword => 'Неверная почта или пароль';

  @override
  String get remoteErrHostNotInAccount => 'Этого хоста нет в вашем аккаунте';

  @override
  String get remoteHostFallback => 'Этот хост';

  @override
  String get remoteErrHostOffline => 'Хост не в сети';

  @override
  String remoteErrHostRemoved(String name) {
    return '$name больше нет в вашем аккаунте DSH Remote';
  }

  @override
  String get remoteErrRelaySignInExpired => 'Сеанс входа в DSH Remote истёк';

  @override
  String get remoteErrIdentityKeyChanged => 'Ключ идентичности хоста изменился';

  @override
  String get remoteErrIdentityUnconfirmed => 'Отпечаток идентичности хоста не подтверждён';

  @override
  String get remoteErrConnectionReplaced => 'Удалённое подключение было заменено';

  @override
  String get remoteErrHostRejected => 'Хост отклонил подключение';

  @override
  String get remoteErrHostNotOwned => 'Хоста нет в вашем аккаунте DSH Remote';

  @override
  String get remoteErrUpdateNeeded => 'Версии не совпадают. Обновите DSH Go и плагин remote на хосте';

  @override
  String get remoteErrVersionIncompatible => 'Обновите DSH или плагин remote на хосте';

  @override
  String get remoteErrSignInTimeout => 'Время входа истекло';

  @override
  String get remoteSignInCancelled => 'Вход отменён';

  @override
  String get remoteErrBrowserSignInUnsupported => 'Сервер не поддерживает вход через браузер';

  @override
  String get remoteErrTooManyRequests => 'Слишком много запросов';

  @override
  String get remoteErrHostUnreachable => 'Не удаётся достучаться до удалённого хоста';

  @override
  String get remoteErrRemoteConnection => 'Не удалось подключиться удалённо';

  @override
  String get remoteOnline => 'В сети';

  @override
  String get remoteOffline => 'Не в сети';

  @override
  String get remoteUnavailable => 'Недоступен';

  @override
  String get remoteErrHostNotFound => 'Хост не найден';

  @override
  String get remoteConnectionStopped => 'Удалённое подключение остановлено';

  @override
  String remoteBootstrapReusePort(int port) {
    return 'Используется работающий DSH (порт $port)';
  }

  @override
  String get remoteBootstrapStarting => 'Запуск удалённого DSH…';

  @override
  String remoteErrCommandNotFound(String command) {
    return '«$command» не найдена на хосте';
  }

  @override
  String get remoteErrDshMissing =>
      'dsh не установлен на хосте. Установите его и повторите или укажите полный путь в команде запуска.';

  @override
  String get remoteStartCommandExample => 'Пример команды запуска: ~/.nvm/versions/node/v22.0.0/bin/dsh web';

  @override
  String get remoteErrDshStartTimeout => 'Удалённый DSH запускался слишком долго';

  @override
  String get remoteErrDshExited => 'Удалённый DSH завершился сразу после запуска';

  @override
  String get remoteErrDshStart => 'Не удалось запустить удалённый DSH';

  @override
  String remoteExitCode(int code) {
    return 'Код выхода $code';
  }

  @override
  String get remoteErrNoShell => 'На хосте нет sh. Поддерживаются только Linux и macOS.';

  @override
  String get remoteErrFingerprintChanged => 'Отпечаток хоста изменился. Соединение разорвано.';

  @override
  String get remoteErrFingerprintUnconfirmed => 'Отпечаток хоста не подтверждён';

  @override
  String get remoteHostTrustCancelled => 'Доверие хосту отменено';

  @override
  String get remoteCheckingDsh => 'Проверка удалённого DSH…';

  @override
  String get remoteErrDshPort => 'Не удаётся достучаться до порта удалённого DSH';

  @override
  String get remoteDshReused => 'Используется DSH, уже запущенный на хосте';

  @override
  String get remoteDshStarted => 'DSH запущен на хосте';

  @override
  String get remoteErrDshTokenRejected => 'Удалённый DSH отклонил токен входа';

  @override
  String get remoteErrDshSignIn => 'Не удалось войти в удалённый DSH';

  @override
  String get remoteErrDshTunnel => 'Не удалось подключиться к DSH через туннель';

  @override
  String get remoteErrDshSignInExpired => 'Сеанс входа в удалённый DSH истёк';

  @override
  String get remoteErrDshStopped => 'Удалённый DSH перестал работать';

  @override
  String get remoteErrSshDisconnected => 'SSH отключён';

  @override
  String get remoteErrSshUnresponsive => 'SSH не отвечает';

  @override
  String remoteRetryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Повторено $count раза',
      many: 'Повторено $count раз',
      few: 'Повторено $count раза',
      one: 'Повторено $count раз',
    );
    return '$_temp0';
  }

  @override
  String get remoteErrSshNetworkChanged => 'SSH отключился после смены сети';

  @override
  String get remoteErrReadFingerprint => 'Не удалось прочитать отпечаток хоста';

  @override
  String get remoteErrNoFingerprint => 'Сервер не предоставил отпечаток хоста';

  @override
  String get remoteErrPasswordMissing => 'Введите пароль';

  @override
  String remoteErrAddressUnresponsive(String host, int port) {
    return '$host:$port не отвечает';
  }

  @override
  String get remoteErrPrivateKeyMissing => 'Введите закрытый ключ';

  @override
  String get remoteErrKeyNeedsPassword => 'Для этого закрытого ключа нужна парольная фраза';

  @override
  String get remoteErrKeyPassword => 'Неверная парольная фраза ключа';

  @override
  String get remoteErrKeyUnreadable => 'Не удалось прочитать закрытый ключ';

  @override
  String remotePrivateKeyFormats(String error) {
    return 'Поддерживаются закрытые ключи Ed25519, RSA и ECDSA в форматах OpenSSH и PEM.\n$error';
  }

  @override
  String remoteErrAddressRejected(String address) {
    return '$address отклонил подключение';
  }

  @override
  String remoteErrSshHostNotFound(String host) {
    return 'Хост $host не найден';
  }

  @override
  String remoteErrSshAddressUnresponsive(String address) {
    return '$address не отвечает';
  }

  @override
  String get remoteErrUsernamePassword => 'Неверное имя пользователя или пароль';

  @override
  String get remoteErrPrivateKeyRejected => 'Сервер не принимает этот закрытый ключ';

  @override
  String remoteAuthorizedKeysHelp(String username, String error) {
    return 'Проверьте, что открытый ключ добавлен в ~/.ssh/authorized_keys пользователя $username.\n$error';
  }

  @override
  String get remoteErrFingerprintUntrusted => 'Отпечаток хоста не является доверенным';

  @override
  String get remoteErrSshHandshakeTimeout => 'Время рукопожатия SSH истекло';

  @override
  String get remoteErrSshInterrupted => 'SSH-соединение прервано';

  @override
  String get remoteErrSshConnection => 'Не удалось подключиться по SSH';

  @override
  String get remoteErrCommandTimeout => 'Время удалённой команды истекло';

  @override
  String get remoteHostedErrNetwork => 'Не удаётся достучаться до сервиса обмена. Проверьте соединение и повторите.';

  @override
  String get remoteHostedErrTooLarge => 'Чат слишком большой для создания ссылки';

  @override
  String get remoteHostedErrRateLimited => 'Слишком частый обмен. Повторите позже.';

  @override
  String get remoteHostedErrCreate => 'Не удалось создать ссылку';

  @override
  String get remoteHostedErrUnavailable => 'Сервис обмена недоступен. Повторите позже.';

  @override
  String get remoteHostedErrGone => 'Ссылка истекла или была удалена';

  @override
  String get remoteHostedErrForbidden => 'У вас нет прав на удаление этой ссылки';

  @override
  String get remoteHostedErrBroken => 'Ссылка неполная или повреждена';

  @override
  String get remoteChat => 'Чат';

  @override
  String get remoteHostedTtlWeek => '7 дней';

  @override
  String get remoteHostedTtlMonth => '30 дней';

  @override
  String get remoteHostedTtlForever => 'Бессрочно';

  @override
  String get remoteForumSignIn => 'Войти в Форум';

  @override
  String get remoteForumSignInBenefits => 'Публикуйте, отвечайте и ставьте лайки';

  @override
  String get remoteForumFinishSignIn => 'Завершите вход в браузере';

  @override
  String get remoteReopenBrowser => 'Открыть браузер снова';

  @override
  String get remoteForumSettings => 'Настройки форума';

  @override
  String get remoteForumAccount => 'Аккаунт форума';

  @override
  String get remoteForumTopic => 'Тема';

  @override
  String get remoteForumLikesReceived => 'Получено лайков';

  @override
  String get remoteForumDaysVisited => 'Дней посещений';

  @override
  String get remoteForumNotifications => 'Уведомления';

  @override
  String remoteForumUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count непрочитанного',
      many: '$count непрочитанных',
      few: '$count непрочитанных',
      one: '$count непрочитанное',
    );
    return '$_temp0';
  }

  @override
  String get remoteForumErrAddress => 'Неверный адрес';

  @override
  String get remoteForumAddress => 'Адрес форума';

  @override
  String remoteForumDefaultAddress(String host) {
    return 'По умолчанию: $host';
  }

  @override
  String get remoteRestoreDefault => 'Вернуть по умолчанию';

  @override
  String get remoteForumUploadingImage => 'Загрузка изображения…';

  @override
  String get remoteForumErrUploadImage => 'Не удалось загрузить изображение';

  @override
  String get remoteForumTitleRequired => 'Сначала добавьте заголовок';

  @override
  String get remoteForumCategoryRequired => 'Выберите категорию';

  @override
  String get remoteForumBodyRequired => 'Напишите что-нибудь перед отправкой';

  @override
  String remoteForumReplyCaption(String username, String title) {
    return 'Ответ @$username · $title';
  }

  @override
  String get remoteForumNewTopic => 'Новая тема';

  @override
  String get remoteForumTitle => 'Заголовок';

  @override
  String get remoteForumComposerHint => 'Напишите что-нибудь. Поддерживается Markdown.';

  @override
  String get remoteForumPublish => 'Опубликовать';

  @override
  String get remoteForumImage => 'Изображение';

  @override
  String get remoteForumAttachShareCode => 'Прикрепить код общего доступа';

  @override
  String get remoteForumPendingApproval => 'Отправлено. Появится после одобрения.';

  @override
  String get remoteForumLatest => 'Новое';

  @override
  String get remoteForumTop => 'Популярное';

  @override
  String get remoteForumErrOpen => 'Не удалось открыть Форум';

  @override
  String get remoteForumNoTopics => 'Тем пока нет';

  @override
  String get remoteForumPost => 'Публикация';

  @override
  String get remoteForum => 'Форум';

  @override
  String remoteForumNotificationsUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Уведомления, $count непрочитанного',
      many: 'Уведомления, $count непрочитанных',
      few: 'Уведомления, $count непрочитанных',
      one: 'Уведомления, $count непрочитанное',
    );
    return '$_temp0';
  }

  @override
  String get remoteForumSearch => 'Поиск';

  @override
  String get remoteForumSearchHint => 'Поиск по темам и публикациям';

  @override
  String get remoteForumSignedIn => 'Вы вошли в Форум';

  @override
  String get remoteForumSignInForNotifications => 'Войдите, чтобы видеть уведомления';

  @override
  String get remoteForumErrNotifications => 'Не удалось загрузить уведомления';

  @override
  String get remoteForumNoNotifications => 'Уведомлений пока нет';

  @override
  String get remoteForumMarkAllRead => 'Отметить всё прочитанным';

  @override
  String get remoteForumSomeone => 'Кто-то';

  @override
  String remoteForumNotificationMention(String who) {
    return '$who упомянул вас';
  }

  @override
  String remoteForumNotificationGroupMention(String who) {
    return '$who упомянул вашу группу';
  }

  @override
  String remoteForumNotificationReply(String who) {
    return '$who ответил вам';
  }

  @override
  String remoteForumNotificationQuote(String who) {
    return '$who процитировал вас';
  }

  @override
  String remoteForumNotificationEdit(String who) {
    return '$who изменил вашу публикацию';
  }

  @override
  String remoteForumNotificationLikes(String who, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$who и ещё $count человека оценили вашу публикацию',
      many: '$who и ещё $count человек оценили вашу публикацию',
      few: '$who и ещё $count человека оценили вашу публикацию',
      one: '$who оценил вашу публикацию',
    );
    return '$_temp0';
  }

  @override
  String remoteForumNotificationLike(String who) {
    return '$who оценил вашу публикацию';
  }

  @override
  String remoteForumNotificationLikedPosts(String who, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$who оценил $count из ваших публикаций',
      many: '$who оценил $count из ваших публикаций',
      few: '$who оценил $count из ваших публикаций',
      one: '$who оценил $count из ваших публикаций',
    );
    return '$_temp0';
  }

  @override
  String remoteForumNotificationReaction(String who) {
    return '$who отреагировал на вашу публикацию';
  }

  @override
  String remoteForumNotificationMessage(String who) {
    return '$who отправил вам личное сообщение';
  }

  @override
  String remoteForumNotificationMessageInvite(String who) {
    return '$who пригласил вас в личную переписку';
  }

  @override
  String remoteForumNotificationTopicInvite(String who) {
    return '$who пригласил вас в тему';
  }

  @override
  String remoteForumNotificationNewReply(String who) {
    return '$who оставил новый ответ';
  }

  @override
  String remoteForumNotificationNewTopic(String who) {
    return '$who создал новую тему';
  }

  @override
  String remoteForumNotificationLink(String who) {
    return '$who сослался на вашу публикацию';
  }

  @override
  String remoteForumNotificationBadge(String badge) {
    return 'Получен значок «$badge»';
  }

  @override
  String remoteForumNotificationMoved(String who) {
    return '$who перенёс вашу публикацию';
  }

  @override
  String get remoteForumBookmarkReminder => 'Напоминание о закладке';

  @override
  String get remoteForumTopicReminder => 'Напоминание о теме';

  @override
  String get remoteForumPostApproved => 'Ваша публикация одобрена';

  @override
  String get remoteForumAdminProblems => 'На форуме есть проблемы, требующие решения';

  @override
  String get remoteForumNewNotification => 'Новое уведомление';

  @override
  String get remoteForumUnread => 'Непрочитанное';

  @override
  String get remoteForumErrShareCode => 'Не удалось открыть код общего доступа';

  @override
  String get remoteForumPoll => 'Опрос';

  @override
  String get remoteForumVideo => 'Видео';

  @override
  String get remoteForumEmbed => 'Встроенное содержимое';

  @override
  String get remoteForumVoteOnWeb => 'Голосовать в веб-версии';

  @override
  String get remoteForumErrSearch => 'Не удалось выполнить поиск';

  @override
  String remoteForumNoSearchResults(String term) {
    return 'Нет результатов по запросу «$term»';
  }

  @override
  String get remoteForumBookmarkRemoved => 'Закладка удалена';

  @override
  String get remoteForumBookmarkAdded => 'Добавлено в закладки';

  @override
  String get remoteLinkCopied => 'Ссылка скопирована';

  @override
  String get remoteForumErrTopic => 'Не удалось открыть эту тему';

  @override
  String get remoteForumTopicClosed => 'Тема закрыта';

  @override
  String get remoteForumReplyHint => 'Напишите ответ…';

  @override
  String get remoteForumSignInToReply => 'Войдите, чтобы ответить';

  @override
  String remoteForumReplyTo(String username) {
    return 'Ответ @$username';
  }

  @override
  String get remoteForumPostDeleted => 'Публикация удалена';

  @override
  String get remoteForumPostHidden => 'Публикация скрыта';

  @override
  String get remoteForumUnlike => 'Убрать лайк';

  @override
  String get remoteForumLike => 'Лайк';

  @override
  String get remoteForumRemoveBookmark => 'Удалить закладку';

  @override
  String get remoteForumBookmark => 'В закладки';

  @override
  String get remoteForumActionPinned => 'Закрепил тему';

  @override
  String get remoteForumActionUnpinned => 'Открепил тему';

  @override
  String get remoteForumActionClosed => 'Закрыл тему';

  @override
  String get remoteForumActionReopened => 'Открыл тему заново';

  @override
  String get remoteForumActionAutoClosed => 'Тема закрыта автоматически';

  @override
  String get remoteForumActionAutoOpened => 'Тема открыта автоматически';

  @override
  String get remoteForumActionArchived => 'Отправил тему в архив';

  @override
  String get remoteForumActionUnarchived => 'Вернул тему из архива';

  @override
  String get remoteForumActionListed => 'Сделал тему публичной';

  @override
  String get remoteForumActionUnlisted => 'Убрал тему из общего списка';

  @override
  String get remoteForumActionSplit => 'Разделил тему';

  @override
  String get remoteForumActionBanner => 'Сделал тему баннером';

  @override
  String get remoteForumActionRemoveBanner => 'Убрал баннер';

  @override
  String get remoteForumActionUpdated => 'Обновил тему';

  @override
  String get remoteLoading => 'Загрузка';

  @override
  String get remoteForumJustNow => 'Только что';

  @override
  String remoteForumMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count минуты назад',
      many: '$count минут назад',
      few: '$count минуты назад',
      one: '$count минуту назад',
    );
    return '$_temp0';
  }

  @override
  String remoteForumHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count часа назад',
      many: '$count часов назад',
      few: '$count часа назад',
      one: '$count час назад',
    );
    return '$_temp0';
  }

  @override
  String remoteForumDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня назад',
      many: '$count дней назад',
      few: '$count дня назад',
      one: '$count день назад',
    );
    return '$_temp0';
  }

  @override
  String remoteForumReplyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ответа',
      many: '$count ответов',
      few: '$count ответа',
      one: '$count ответ',
    );
    return '$_temp0';
  }

  @override
  String remoteForumNewReplyCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count новых ответа',
      many: '$count новых ответов',
      few: '$count новых ответа',
      one: '$count новый ответ',
    );
    return '$_temp0';
  }

  @override
  String get remoteForumNew => 'Новое';

  @override
  String remoteForumErrorRetry(String error) {
    return '$error · Повторить';
  }

  @override
  String get remoteForumNoMore => 'Больше нет';

  @override
  String get remoteHostKeyTrustTitle => 'Доверять этому хосту?';

  @override
  String remoteHostKeyFirstConnection(String name, String address) {
    return 'Первое подключение к «$name» ($address). Проверьте отпечаток, чтобы убедиться, что это ваш хост.';
  }

  @override
  String get remoteHostKeyTrustConnect => 'Довериться и подключиться';

  @override
  String get remoteHostKeyChangedTitle => 'Отпечаток идентичности изменился';

  @override
  String remoteRelayKeyChangedBody(String name) {
    return 'Ключ идентичности «$name» изменился. Продолжайте, только если вы переустанавливали удалённый плагин на этом хосте. Возможно, его кто-то подменяет.';
  }

  @override
  String remoteRelayKeyFirstBody(String name) {
    return 'Первое подключение к «$name». Прежде чем продолжить, проверьте, что отпечаток идентичности совпадает с тем, что показывает удалённый плагин хоста.';
  }

  @override
  String get remoteHostKeyChangeWarning => 'Если отпечаток изменится, DSH откажется подключаться.';

  @override
  String get remoteHostKeyTrustAgain => 'Довериться снова';

  @override
  String get remoteHostKeyReading => 'Чтение отпечатка хоста…';

  @override
  String remoteHostSwitcherSemantics(String name, String status) {
    return 'Текущий хост: $name, $status. Сменить хост';
  }

  @override
  String get remoteSwitchHost => 'Сменить хост';

  @override
  String get remoteThisPhoneDsh => 'DSH на этом телефоне';

  @override
  String get remoteRemoteLabel => 'Удалённый';

  @override
  String remoteRemotePlatform(String platform) {
    return 'Удалённый · $platform';
  }

  @override
  String get remoteRelaySwitchWarning =>
      'DSH Remote подключается только к одному хосту. При смене прошлый хост отключится.';

  @override
  String get remoteConnectComputer => 'Подключить компьютер или сервер';

  @override
  String get remoteManageHosts => 'Управление удалёнными хостами';

  @override
  String get remoteConnectionMethods => 'Через SSH или DSH Remote';

  @override
  String get remoteRelayLoginRequired => 'Введите адрес сервера, почту и пароль';

  @override
  String get remoteErrSignIn => 'Не удалось войти';

  @override
  String get remoteSelfHostedServer => 'Свой сервер';

  @override
  String get remoteSelfHostedSignInHelp => 'Войдите в свой liguobao/ds-harness-remote по почте и паролю';

  @override
  String get remoteServerAddress => 'Адрес сервера';

  @override
  String get remoteEmail => 'Почта';

  @override
  String get remotePassword => 'Пароль';

  @override
  String get remoteRestoreServer => 'Вернуть сервер по умолчанию dsh.r2049.cn';

  @override
  String get remoteConsole => 'Удалённая консоль';

  @override
  String get remoteHostsIntro => 'Продолжайте работать с DSH с компьютера или сервера прямо на телефоне';

  @override
  String get remoteSshHosts => 'Хосты SSH';

  @override
  String get remoteSshRequirements => 'На хосте должны быть включены SSH и установлен DSH';

  @override
  String get remoteAddSshHost => 'Добавить хост SSH';

  @override
  String get remoteSshDirect => 'Без стороннего сервера';

  @override
  String get remoteOtherMethods => 'Другие способы';

  @override
  String get remoteWebConsole => 'Веб-консоль удалённого доступа';

  @override
  String get remoteWebConsoleProvider => 'dsh.r2049.cn · Сторонняя страница';

  @override
  String remoteActiveHost(String name) {
    return 'Используется «$name»';
  }

  @override
  String get remoteSwitchToPhone => 'Использовать этот телефон';

  @override
  String get remoteSignInAgain => 'Войти снова';

  @override
  String get remoteHostSettings => 'Настройки хоста';

  @override
  String get remoteReconnect => 'Переподключиться';

  @override
  String get remoteReconnectingEllipsis => 'Переподключение…';

  @override
  String remoteReconnectReason(String reason) {
    return 'Переподключение · $reason';
  }

  @override
  String get remoteConnectedEncrypted => 'Подключено · Сквозное шифрование';

  @override
  String remoteConnectedVia(String path) {
    return 'Подключено · $path · Сквозное шифрование';
  }

  @override
  String get remotePathDirect => 'Напрямую';

  @override
  String get remotePathTurn => 'TURN';

  @override
  String get remotePathRelay => 'Ретранслятор';

  @override
  String remoteConnectedSsh(String address) {
    return 'Подключено · SSH $address';
  }

  @override
  String get remoteErrRefreshHosts => 'Не удалось обновить список хостов';

  @override
  String get remoteSwitchWarning => 'Подключается к одному хосту. При смене прошлый хост отключится.';

  @override
  String get remoteRefreshHosts => 'Обновить хосты';

  @override
  String get remoteSignOut => 'Выйти';

  @override
  String get remoteErrHostsRetry => 'Не удалось загрузить хосты · Нажмите, чтобы повторить';

  @override
  String get remoteNoHosts => 'Хостов пока нет';

  @override
  String get remoteRelaySetupHelp => 'Установите удалённый плагин в DSH на хосте и войдите';

  @override
  String get remoteRelaySignOutTitle => 'Выйти из DSH Remote?';

  @override
  String get remoteRelaySignOutBody =>
      'Этот телефон будет удалён из аккаунта. DSH и чаты на хосте останутся. Вы сможете войти снова в любой момент.';

  @override
  String get remoteRelaySignInTitle => 'Вход в DSH Remote';

  @override
  String get remoteRelaySignInHelp => 'Без настройки сети. Сквозное шифрование.';

  @override
  String get remoteBrowserSignIn => 'Войти в браузере';

  @override
  String remoteSignInWithProvider(String provider) {
    return 'Продолжить с $provider';
  }

  @override
  String get remoteComingSoon => 'Скоро';

  @override
  String get remoteSelfHostedEmailSignIn => 'Свой сервер · Вход по почте';

  @override
  String get remoteBrowserSignInPending => 'Завершите вход в браузере…';

  @override
  String get remoteCopySignInLink => 'Копировать ссылку для входа';

  @override
  String get remoteSshAddressRequired => 'Введите адрес хоста (IP или домен)';

  @override
  String get remoteSshUsernameRequired => 'Введите имя пользователя';

  @override
  String get remoteSshPasswordRequired => 'Введите пароль SSH или используйте приватный ключ';

  @override
  String get remoteSshKeyRequired => 'Вставьте полный приватный ключ (начинается с -----BEGIN)';

  @override
  String get remoteHostKeyResetTitle => 'Сбросить отпечаток хоста?';

  @override
  String get remoteHostKeyResetBody =>
      'Делайте это, только если хост переустановили или заменили. При следующем подключении вас попросят проверить отпечаток.';

  @override
  String get remoteReset => 'Сбросить';

  @override
  String remoteDeleteHostTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get remoteDeleteHostBody =>
      'Настройки этого хоста, а также сохранённые на телефоне пароль и приватный ключ будут удалены. DSH и чаты на хосте останутся.';

  @override
  String remoteErrReadKey(String error) {
    return 'Не удалось прочитать: $error';
  }

  @override
  String get remoteErrPublicKeyFile =>
      'Это не приватный ключ. Выберите файл без расширения .pub (например, id_ed25519).';

  @override
  String get remotePrivateKeyImported => 'Приватный ключ импортирован. Исходный файл можно удалить.';

  @override
  String get remoteEditHost => 'Изменить хост';

  @override
  String get remoteSshHostIntro => 'Подключитесь к DSH на компьютере или сервере';

  @override
  String get remoteHostBasicInfo => 'Основные сведения';

  @override
  String get remoteHostNameHint => 'Например: компьютер, домашний Mac';

  @override
  String get remoteHost => 'Хост';

  @override
  String get remoteHostAddressHint => '192.168.1.20 или example.com';

  @override
  String get remoteUsername => 'Имя пользователя';

  @override
  String get remotePort => 'Порт';

  @override
  String get remoteAuthentication => 'Способ входа';

  @override
  String get remotePasswordStorageHelp => 'Хранится только на этом телефоне, шифруется Android Keystore';

  @override
  String get remoteKeyStorageHelp =>
      'Хранится только на этом телефоне, шифруется Android Keystore. Поддерживаются Ed25519, RSA и ECDSA.';

  @override
  String get remotePrivateKey => 'Приватный ключ';

  @override
  String get remoteShow => 'Показать';

  @override
  String get remoteImportKeyFile => 'Импортировать из файла';

  @override
  String get remotePrivateKeyPassword => 'Пароль приватного ключа (необязательно)';

  @override
  String get remoteStartCommand => 'Команда запуска';

  @override
  String get remoteStartCommandHelp => 'Если DSH установлен через nvm, можно указать полный путь';

  @override
  String get remoteWorkingDirectory => 'Рабочая папка (необязательно)';

  @override
  String get remoteWorkingDirectoryHelp => 'Папка по умолчанию для новых чатов. Поддерживается ~/.';

  @override
  String get remoteHostFingerprint => 'Отпечаток хоста';

  @override
  String get remoteHostKeyNotConfirmed => 'Пока не подтверждён';

  @override
  String get remoteHostKeyFirstCheck => 'При первом подключении вас попросят проверить отпечаток';

  @override
  String get remoteDeleteHost => 'Удалить этот хост';

  @override
  String get remoteTesting => 'Проверка';

  @override
  String get remoteTestConnection => 'Проверить';

  @override
  String get remoteHostedUpdateRequired => 'Обновите DSH, чтобы открыть эту ссылку';

  @override
  String get remoteHostedCannotOpen => 'Не удаётся открыть эту ссылку';

  @override
  String get remoteOpening => 'Открытие…';

  @override
  String get remoteHostedNeverExpires => 'Бессрочно';

  @override
  String get remoteHostedExpired => 'Истекла';

  @override
  String get remoteHostedExpiresToday => 'Истекает сегодня';

  @override
  String get remoteHostedExpiresTomorrow => 'Истекает завтра';

  @override
  String remoteHostedExpiresOn(String date) {
    return 'Истекает $date';
  }

  @override
  String get remoteHostedDeleteTitle => 'Удалить эту ссылку?';

  @override
  String remoteHostedDeleteBody(String title) {
    return 'Ссылка на «$title» сразу перестанет работать';
  }

  @override
  String get remoteHostedLinkDeleted => 'Ссылка удалена';

  @override
  String get remoteUndo => 'Отменить';

  @override
  String get remoteHostedMyLinks => 'Мои общие ссылки';

  @override
  String get remoteHostedNoLinks => 'Общих ссылок пока нет';

  @override
  String get remoteHostedErrDeleteNetwork => 'Не удалось удалить. Проверьте соединение и повторите.';

  @override
  String get remoteHostedErrDelete => 'Не удалось удалить. Повторите позже.';

  @override
  String get remoteDirectoryPickerTitle => 'Выбрать папку';

  @override
  String get remoteDirectoryChoose => 'Выбрать';

  @override
  String get remoteDirectoryDefault => 'Рабочая папка по умолчанию';

  @override
  String get remoteDirectoryHome => 'Домашняя';

  @override
  String get remoteDirectoryPhoneStorage => 'Память телефона';

  @override
  String get remoteDirectoryDownloads => 'Загрузки';

  @override
  String get remoteDirectoryDownloadsPath => 'Память телефона/Download';

  @override
  String get remoteDirectoryDocuments => 'Документы';

  @override
  String get remoteDirectoryDocumentsPath => 'Память телефона/Documents';

  @override
  String get remoteDirectoryLocations => 'Расположения';

  @override
  String get remoteDirectoryRecent => 'Недавние';

  @override
  String get remoteDirectoryEnterPath => 'Ввести путь';

  @override
  String get remoteDirectoryGo => 'Перейти';

  @override
  String get remoteDirectoryAbsolutePath => 'Введите полный путь, начиная с «/»';

  @override
  String get remoteDirectoryNewFolder => 'Новая папка';

  @override
  String remoteDirectoryParentCaption(String name) {
    return 'В «$name»';
  }

  @override
  String get remoteDirectoryFolderName => 'Название папки';

  @override
  String get remoteDirectoryRoot => 'Корень';

  @override
  String get remoteDirectoryErrCreate => 'Не удалось создать папку';

  @override
  String get remoteDirectoryNoSubfolders => 'Вложенных папок нет';

  @override
  String get remoteDirectoryHideHidden => 'Скрыть скрытые папки';

  @override
  String remoteDirectoryShowHidden(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Показать $count скрытые папки',
      many: 'Показать $count скрытых папок',
      few: 'Показать $count скрытые папки',
      one: 'Показать $count скрытую папку',
    );
    return '$_temp0';
  }

  @override
  String get remoteDirectoryTruncated => 'Слишком много папок. Показаны только первые.';

  @override
  String get remoteWorkspaceAdd => 'Добавить рабочую папку';

  @override
  String remoteWorkspaceAdded(String name) {
    return 'Добавлено «$name»';
  }

  @override
  String get remoteWorkspaceErrAdd => 'Не удалось добавить рабочую папку';

  @override
  String get remoteWorkspaceNoChats => 'Чатов нет';

  @override
  String remoteWorkspaceChatCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чата',
      many: '$count чатов',
      few: '$count чата',
      one: '$count чат',
    );
    return '$_temp0';
  }

  @override
  String get remoteWorkspaceErrRename => 'Не удалось переименовать';

  @override
  String remoteWorkspaceRemoved(String name) {
    return 'Удалено «$name»';
  }

  @override
  String get remoteWorkspaceErrRemove => 'Не удалось удалить рабочую папку';

  @override
  String get remoteWorkspaceRename => 'Переименовать рабочую папку';

  @override
  String get remoteWorkspaceName => 'Название рабочей папки';

  @override
  String get remoteWorkspaceNameRequired => 'Введите название';

  @override
  String remoteWorkspaceRemoveTitle(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get remoteWorkspaceRemoveBody => 'Папка и чаты останутся';

  @override
  String get remoteWorkspaceRemove => 'Удалить';

  @override
  String get remoteWorkspace => 'Рабочая папка';

  @override
  String get remoteWorkspaceNewChatHere => 'Новый чат здесь';

  @override
  String get remoteWorkspaceUnpin => 'Открепить';

  @override
  String get remoteWorkspaceGroup => 'Группа';

  @override
  String get remoteWorkspaceUngrouped => 'Без группы';

  @override
  String get remoteWorkspaceRemoveAction => 'Убрать рабочую папку';

  @override
  String get remoteWorkspaceNewGroup => 'Новая группа';

  @override
  String get remoteWorkspaceGroupName => 'Название группы';

  @override
  String remoteDirectoryPhonePath(String path) {
    return 'Память телефона/$path';
  }

  @override
  String get remoteDirectoryInvalidName => 'Название не может содержать «/»';

  @override
  String get remoteWorkspaceErrNameConflict => 'Рабочая папка с таким названием уже есть';

  @override
  String get remoteWorkspaceErrInvalidPath => 'Эту папку нельзя использовать как рабочую';

  @override
  String get remoteWorkspaceErrNotFound => 'Эта рабочая папка больше не существует';

  @override
  String get remoteDirectoryErrUnreadable => 'Не удалось открыть эту папку';

  @override
  String get remoteDirectoryErrExists => 'Папка с таким названием уже есть';

  @override
  String get remoteDirectoryErrUnavailable => 'Этот хост не умеет просматривать папки';

  @override
  String get remoteWorkspaceErrUnsupported => 'Этот хост не поддерживает это действие';

  @override
  String get remoteWorkspaceAllChats => 'Все чаты';

  @override
  String remoteWorkspaceSwitcherSemantics(String name) {
    return 'Рабочая папка: $name. Сменить рабочую папку';
  }

  @override
  String get remoteWorkspaceManage => 'Управление рабочими папками';

  @override
  String get remoteWorkspaceErrLoad => 'Не удалось загрузить рабочие папки';

  @override
  String get remoteWorkspaceEmpty => 'Рабочих папок пока нет';

  @override
  String get remoteWorkspaceEmptyHint => 'Добавьте папки, которые нужны чаще всего';

  @override
  String remoteWorkspaceCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count рабочей папки',
      many: '$count рабочих папок',
      few: '$count рабочие папки',
      one: '$count рабочая папка',
    );
    return '$_temp0';
  }

  @override
  String remoteDirectoryConfirmFolder(String action, String name) {
    return '$action «$name»';
  }

  @override
  String remoteHostKeyMismatchDetail(String saved, String received, String type) {
    return 'Если хост переустанавливали или меняли, сбросьте его отпечаток в настройках хоста.\nСохранённый: $saved\nПолученный: $received ($type)';
  }

  @override
  String remoteForumCompactReplies(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$label ответа',
      many: '$label ответов',
      few: '$label ответа',
      one: '$label ответ',
    );
    return '$_temp0';
  }

  @override
  String remoteForumCompactViews(int count, String label) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$label просмотра',
      many: '$label просмотров',
      few: '$label просмотра',
      one: '$label просмотр',
    );
    return '$_temp0';
  }

  @override
  String remoteForumYearDate(int year, String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'янв',
      '2': 'фев',
      '3': 'мар',
      '4': 'апр',
      '5': 'май',
      '6': 'июн',
      '7': 'июл',
      '8': 'авг',
      '9': 'сен',
      '10': 'окт',
      '11': 'ноя',
      '12': 'дек',
      'other': '$month',
    });
    return '$_temp0 $day, $year';
  }

  @override
  String remoteHostedMonthDate(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'янв',
      '2': 'фев',
      '3': 'мар',
      '4': 'апр',
      '5': 'май',
      '6': 'июн',
      '7': 'июл',
      '8': 'авг',
      '9': 'сен',
      '10': 'окт',
      '11': 'ноя',
      '12': 'дек',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String remoteHostedYearDate(int year, String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'янв',
      '2': 'фев',
      '3': 'мар',
      '4': 'апр',
      '5': 'май',
      '6': 'июн',
      '7': 'июл',
      '8': 'авг',
      '9': 'сен',
      '10': 'окт',
      '11': 'ноя',
      '12': 'дек',
      'other': '$month',
    });
    return '$_temp0 $day, $year';
  }

  @override
  String remoteForumTenThousands(String value) {
    return '$value × 10 000';
  }

  @override
  String get remoteForumSemanticsSeparator => ', ';

  @override
  String remoteHostKeyVerifyCommand(String command) {
    return 'Выполните $command на этом хосте, чтобы увидеть тот же отпечаток. DSH откажется подключаться, если он изменится.';
  }

  @override
  String remoteSshInstallCommand(String command) {
    return 'DSH не установлен? Выполните $command на хосте.';
  }

  @override
  String remoteRelayProvider(String project) {
    return 'Сервис от $project';
  }

  @override
  String remoteRelayProviderServer(String project, String server) {
    return 'Сервис от $project · Текущий сервер: $server';
  }

  @override
  String remoteQuotedHostName(String name) {
    return '«$name»';
  }

  @override
  String remoteErrorDetail(String message, String detail) {
    return '$message ($detail)';
  }

  @override
  String get remotePathLan => 'LAN';

  @override
  String get remotePathP2p => 'P2P';

  @override
  String get remoteNetworkDetails => 'Сведения о сети';

  @override
  String get remoteNetworkAutomatic =>
      'Автоматически пробует LAN → P2P → TURN → Relay, со сквозным шифрованием на всём пути.';

  @override
  String get remoteNetworkCurrentPath => 'Текущий маршрут';

  @override
  String get remoteNetworkConnectDuration => 'Время подключения';

  @override
  String get remoteNetworkRoundTripTime => 'Время отклика (RTT)';

  @override
  String get remoteNetworkUnmeasured => 'Не измерено';

  @override
  String get remoteNetworkUnknownPath => 'Не подтверждено';

  @override
  String remoteNetworkMilliseconds(int value) {
    return '$value мс';
  }

  @override
  String get remoteNetworkMeasure => 'Обновить сеть / измерить задержку';

  @override
  String get remoteNetworkMeasuring => 'Измерение…';

  @override
  String get remoteNetworkMeasureFailed => 'Не удалось измерить задержку. Попробуйте позже.';

  @override
  String get remoteNetworkDisconnected => 'Нет подключения. Подключитесь, чтобы измерить задержку.';

  @override
  String get remoteNetworkFallback => 'Причина резерва';

  @override
  String get remoteNetworkFallbackUnknown => 'Прямое подключение было недоступно; маршрут выбран автоматически.';

  @override
  String get remoteNetworkFallbackWebrtcUnavailable => 'WebRTC недоступен на этом устройстве; используется Relay.';

  @override
  String get remoteNetworkFallbackDirectFailed => 'LAN / P2P не подключились; попробован следующий маршрут.';

  @override
  String get remoteNetworkFallbackDirectTimeout => 'LAN / P2P не ответили вовремя; попробован следующий маршрут.';

  @override
  String get remoteNetworkFallbackDirectRecentlyFailed =>
      'Недавняя прямая попытка не удалась; для этого подключения используется доступный релей.';

  @override
  String get remoteNetworkFallbackTurnUnavailable => 'TURN недоступен; используется Relay.';

  @override
  String get remoteNetworkFallbackTurnFailed => 'TURN не подключился; используется Relay.';

  @override
  String get remoteNetworkFallbackTurnTimeout => 'TURN не ответил вовремя; используется Relay.';

  @override
  String get remoteNetworkFallbackPathUnverified => 'Тип маршрута WebRTC не подтверждён.';

  @override
  String get remoteNetworkSnapshotHint =>
      'Показан последний подтверждённый маршрут и задержка. Обновите, чтобы проверить снова.';

  @override
  String get remoteNetworkObservedAt => 'Последняя проверка';

  @override
  String get remoteScanQr => 'Сканировать QR';

  @override
  String get remoteScanQrSubtitle => 'Добавить хост по QR-коду с компьютера';

  @override
  String get remoteScanQrHint => 'Наведите камеру на QR-код хоста';

  @override
  String get remoteScanQrTorch => 'Фонарик';

  @override
  String get remoteScanQrCameraDenied => 'Нет доступа к камере. Разрешите камеру для Narwhal в настройках Android.';

  @override
  String get remoteScanQrCameraUnavailable => 'На этом устройстве нет доступной камеры.';

  @override
  String get remoteScanQrCameraFailed => 'Не удалось открыть камеру.';

  @override
  String get remoteScanQrCameraRetry => 'Повторить';

  @override
  String get remoteScanQrPrivacy =>
      'Камера используется только для сканирования QR-кода хоста. Кадры не сохраняются и никуда не отправляются.';

  @override
  String get remoteScanQrHowTitle => 'Как получить QR-код';

  @override
  String get remoteScanQrHowBody =>
      'QR-код создаёт компьютер, к которому вы подключаетесь: в любом генераторе QR закодируйте адрес вида ssh://пользователь@адрес:22 или JSON ниже.';

  @override
  String get remoteScanQrPaste => 'Вставить QR-ссылку';

  @override
  String get remoteScanQrPasteHelp => 'Если камера недоступна или QR-код есть только в чате или файле.';

  @override
  String get remoteScanQrPasteTitle => 'Вставить QR-ссылку';

  @override
  String get remoteScanQrPasteHint => 'Адрес хоста или JSON из QR-кода';

  @override
  String get remoteScanQrPasteCheck => 'Проверить';

  @override
  String get remoteScanQrPasteClipboard => 'Вставить из буфера';

  @override
  String get remoteScanQrClipboardEmpty => 'В буфере обмена нет текста.';

  @override
  String get remoteQrErrEmpty => 'QR-код пустой. Попробуйте другой.';

  @override
  String get remoteQrErrTooLong => 'QR-код слишком длинный для адреса хоста.';

  @override
  String get remoteQrErrOtherApp => 'Это не QR-код хоста Narwhal. Отсканируйте код, созданный для подключения к хосту.';

  @override
  String get remoteQrErrVersion => 'Этот QR-код создан более новой версией. Обновите Narwhal.';

  @override
  String get remoteQrErrTransport =>
      'Этот QR-код для подключения по локальной сети, а Narwhal подключается по SSH. Создайте QR-код с адресом ssh://.';

  @override
  String get remoteQrErrNoAddress => 'В QR-коде нет адреса хоста.';

  @override
  String get remoteQrErrInvalidAddress => 'Адрес хоста в QR-коде некорректный.';

  @override
  String get remoteQrErrNoUser => 'В QR-коде нет имени пользователя. Запишите его как пользователь@хост.';

  @override
  String get remoteQrErrPort => 'Неверный порт в QR-коде (1–65535).';

  @override
  String get remoteQrConfirmTitle => 'Добавить хост?';

  @override
  String get remoteQrConfirmName => 'Имя';

  @override
  String get remoteQrConfirmAddress => 'Адрес';

  @override
  String get remoteQrConfirmPassword => 'Пароль';

  @override
  String get remoteQrConfirmPasswordIncluded => 'Есть в QR-коде — сохранится в защищённом хранилище телефона';

  @override
  String get remoteQrConfirmPasswordMissing => 'В QR-коде нет пароля — введите его в настройках хоста';

  @override
  String get remoteQrConfirmPrivacy => 'Пароль не показывается и не отправляется: он остаётся на этом телефоне.';

  @override
  String get remoteQrConfirmAdd => 'Добавить и подключиться';

  @override
  String get riskDontShowAgain => 'Больше не показывать';

  @override
  String get riskAskAi => 'Не уверены? Спросите ИИ';

  @override
  String get riskConfirmAlwaysAction => 'Пропускать подтверждение';

  @override
  String get riskFullAccessAction => 'Включить полный доступ';

  @override
  String get riskAutoReviewAction => 'Включить автопроверку';

  @override
  String get riskAllowForChatTitle => 'Разрешить всё в этом чате?';

  @override
  String get riskAllowForChatBody =>
      'Команды и изменения в этом чате выполняются без вопросов. Это можно выключить над полем ввода в любой момент.';

  @override
  String get riskAllowForChatAction => 'Разрешить всё';

  @override
  String get riskPetOverlayTitle => 'Показывать поверх других приложений?';

  @override
  String get riskPetOverlayBody =>
      'Включите «Поверх других приложений» для DSH Go в системных настройках, чтобы питомец появлялся вне приложения.';

  @override
  String get riskPetOverlayAction => 'Открыть настройки';

  @override
  String get askAiTooltip => 'Спросить ИИ';

  @override
  String get askAiHelpTitle => 'Справка';

  @override
  String askAiAboutApp(String question) {
    return 'О приложении DSH Go: $question';
  }

  @override
  String askAiWithGuide(String question) {
    return 'О приложении DSH Go: $question\nОтветьте по приложенному руководству.';
  }

  @override
  String get askAiNoGuide => 'На этом хосте нет руководства DSH Go, поэтому ответы могут быть неточными';

  @override
  String get askAiQuestionOverview => 'Что умеет DSH Go и с чего начать?';

  @override
  String get askAiQuestionPhoneControl => 'Как работает управление телефоном и в чём риски?';

  @override
  String get askAiQuestionPhoneAlways =>
      'Что меняется при «Всегда пропускать подтверждение» в управлении телефоном и чем это рискованнее, чем спрашивать каждый раз?';

  @override
  String get askAiQuestionAppRules =>
      'Зачем нужен список приложений в управлении телефоном и чем рискованно разрешать банковские и платёжные приложения?';

  @override
  String get askAiQuestionFullAccess => 'Что происходит при включённом полном доступе и в чём риски?';

  @override
  String get askAiQuestionPhoneFiles =>
      'Когда включён «Доступ к файлам телефона», какие файлы ИИ может читать и менять и как это выключить?';

  @override
  String get askAiQuestionAllowForChat => 'Что пропускает «Разрешить для чата» и как это выключить?';

  @override
  String get askAiQuestionPlugins => 'Что умеют плагины и на что смотреть со сторонними?';

  @override
  String get askAiQuestionRemote => 'Как подключить свой компьютер или сервер и чем это отличается от этого телефона?';

  @override
  String get schemaDocumentationTitle => 'Описания полей';

  @override
  String get schemaDocumentationOverview => 'Обзор';

  @override
  String get schemaDocumentationEach => 'Каждый элемент';

  @override
  String schemaDocumentationPosition(int position) {
    return 'Элемент $position';
  }

  @override
  String schemaDocumentationOption(int option) {
    return 'Вариант $option';
  }

  @override
  String get searchApiKey => 'Ключ API';

  @override
  String get searchNeedsLocal => 'Доступно на движке этого телефона';

  @override
  String get searchNeedsPhoneControl => 'Доступно после включения управления телефоном';

  @override
  String get searchNeedsNativeUi => 'Доступно в нативном интерфейсе';

  @override
  String get searchNeedsEngineField => 'Доступно, если есть на хосте';

  @override
  String get searchNeedsChat => 'Доступно при открытом чате';

  @override
  String get searchKwTheme => 'внешний вид,цвета,цвет,акцент,иконки';

  @override
  String get searchKwPets => 'питомец,питомцы,компаньон,кит,оверлей';

  @override
  String get searchKwPerformance => 'батарея,плавность,тормоза,лёгкий,полный,скорость';

  @override
  String get searchKwVoice => 'распознавание речи,диктовка,микрофон,мик,голос';

  @override
  String get searchKwNotifications => 'оповещения,пуш,баннер,звук';

  @override
  String get searchKwReplyPrefs => 'обо мне,стиль,тон,инструкции,AGENTS.md';

  @override
  String get searchKwSharedLinks => 'ссылки,поделиться,общие,публичная ссылка';

  @override
  String get searchKwPhone => 'специальные возможности,автоматизация,нажатие,управление телефоном';

  @override
  String get searchKwAppRules => 'приложения,чёрный список,белый список,запрет,список приложений';

  @override
  String get searchKwDnd => 'не беспокоить,shizuku,sui,root,adb,фон';

  @override
  String get searchKwEngine => 'движок,среда,запуск,остановка,перезапуск,DSH';

  @override
  String get searchKwBackground => 'удержание,фоновая активность,оптимизация батареи,автозапуск,остановка';

  @override
  String get searchKwSystemAccess =>
      'разрешения,выдача,оверлей,поверх других приложений,специальные возможности,фоновые всплывающие окна,микрофон,доступ к файлам,разрешение на уведомления,ограниченные настройки';

  @override
  String get searchKwDiagnostics => 'журналы,диагностика,отчёт,ошибка,ошибки';

  @override
  String get searchKwModels => 'провайдеры моделей,провайдеры,провайдер,сменить модель,OpenRouter,ChatGPT,Claude';

  @override
  String get searchKwEngineParams => 'настройки движка,дополнительно,параметры,субагент,команды';

  @override
  String get searchKwSubagent => 'настройки субагентов,глубина,параллельность,подзадачи';

  @override
  String get searchKwAgentLoop => 'цикл,параллельно,вызовы инструментов';

  @override
  String get searchKwShell => 'команды,тайм-аут,вывод,терминал,shell,bash';

  @override
  String get searchKwWebSearch => 'поиск,интернет,браузер,ключ API';

  @override
  String get searchKwGeneral => 'общие,веб-настройки';

  @override
  String get searchKwPluginInventory => 'список,установленные плагины,пакеты';

  @override
  String get searchKwPlugins => 'плагины,расширения,магазин,установка,маркетплейс';

  @override
  String get searchKwAllFeatures => 'функции,каталог,всё';

  @override
  String get searchKwAccount => 'аккаунт,баланс,пополнение,вход,выход,ключ API,использование,DeepSeek';

  @override
  String get searchKwRemote => 'удалённо,ssh,компьютер,сервер,DSH Remote,подключение';

  @override
  String get searchKwPermission =>
      'разрешения,подтверждение,не спрашивать,только чтение,полный доступ,автозапуск команд';

  @override
  String get searchKwAgentPresets => 'пресеты,режим,режим агента';

  @override
  String get searchKwUiMode => 'нативный,веб,веб-режим,интерфейс';

  @override
  String get searchKwLanguage => 'китайский,английский,язык';

  @override
  String get searchKwPhoneFiles => 'хранилище,файлы,загрузки,фото';

  @override
  String get searchKwVisualReplies => 'графики,карточки,визуально,варианты';

  @override
  String get searchKwTextSize => 'шрифт,размер шрифта,размер текста,крупный текст';

  @override
  String get searchKwTableTint => 'таблица,оттенок,заголовок,полоса,строка,фон';

  @override
  String get searchKwFoldTurns => 'свернуть,сворачивание,шаги';

  @override
  String get searchKwWebPhoneLayout => 'раскладка для телефона,раскладка';

  @override
  String get searchKwShareConfig => 'поделиться,экспорт,код обмена,конфигурация';

  @override
  String get searchKwOpenWeb => 'веб,браузер,веб-интерфейс';

  @override
  String get searchKwSafeMode => 'безопасный режим,выход из безопасного режима,диагностика';

  @override
  String get searchKwVersion => 'версия,о приложении,сборка';

  @override
  String get searchKwUpdate => 'обновление,обновить,новая версия';

  @override
  String get searchKwUpdateAuto => 'автообновление,обновления';

  @override
  String get searchKwHelp => 'помощь,руководство,спросить ИИ,как';

  @override
  String get searchKwCommunity => 'группа,форум,отзывы,групповой чат';

  @override
  String get searchKwStar => 'github,звезда';

  @override
  String get searchKwLicenses => 'лицензия,открытый код';

  @override
  String get searchKwDarkMode => 'тёмная,светлая,тёмный режим,ночь,тема,система,внешний вид';

  @override
  String get searchKwAccent => 'цвет,оттенок,акцент,палитра,обои';

  @override
  String get searchKwTileStyle => 'стиль иконок,плитки';

  @override
  String get searchKwAppIcon => 'иконка приложения,иконка';

  @override
  String get searchKwPetSize => 'размер питомца';

  @override
  String get searchKwPetQuiet => 'тихо,тихий питомец';

  @override
  String get searchKwPetOutside => 'оверлей,плавающий питомец,вне приложения';

  @override
  String get searchKwPetDisplayWhen => 'показ питомца,когда показывать';

  @override
  String get searchKwBlur => 'размытие,стекло,матовый';

  @override
  String get searchKwAnimations => 'анимация,движение,меньше движения';

  @override
  String get searchKwNotifyEnabled => 'уведомления включены,отключить уведомления';

  @override
  String get searchKwNotifyDone => 'ответ готов,завершено';

  @override
  String get searchKwNotifyFailed => 'ошибка,сбой,остановлено';

  @override
  String get searchKwNotifyApproval => 'подтверждение,ждёт вас';

  @override
  String get searchKwNotifyQuestion => 'вопрос,спрашивает вас';

  @override
  String get searchKwNotifyLive =>
      'динамический остров,живое обновление,живая активность,чип в строке состояния,панель сейчас,живые оповещения,прогресс на экране блокировки';

  @override
  String get searchKwNotifySystem => 'звук,баннер,экран блокировки,система';

  @override
  String get searchKwPhoneConfirm => 'не спрашивать,подтверждать,всегда спрашивать,без подтверждения';

  @override
  String get searchKwPhoneAutoCollapse => 'плавающая панель,свернуть,пузырь';

  @override
  String get searchKwPhoneReturn => 'вернуться,возврат';

  @override
  String get searchKwPhoneBackgroundGuide => 'подтверждение в фоне,возврат';

  @override
  String get searchKwAutoStart => 'автозапуск,запуск';

  @override
  String get searchKwAutoSafe => 'безопасный режим,автоматический безопасный режим';

  @override
  String get searchKwEngineReset => 'сброс,очистка,восстановление';

  @override
  String get searchKwEngineUninstall => 'удаление,убрать,освободить место';

  @override
  String get searchKwAddProvider => 'добавить модель,новый провайдер,своя модель,base url';

  @override
  String get searchKwSubagentDepth => 'глубина,уровни';

  @override
  String get searchKwParallelCalls => 'параллельно,одновременные вызовы';

  @override
  String get searchKwCommandTimeout => 'тайм-аут,лимит времени';

  @override
  String get searchKwWebSearchKey => 'ключ поиска,ключ веб-поиска';

  @override
  String get searchKwChatLogUpload => 'приватность,журналы,выгрузка журналов,телеметрия';

  @override
  String get searchKwAddSshHost => 'ssh,добавить хост,подключить компьютер';

  @override
  String get searchKwRemoteAutoConnect => 'автоподключение,при запуске';

  @override
  String get searchKwPermissionCurrent => 'разрешить для этого чата,этот чат';

  @override
  String get searchKwPermissionDefault =>
      'разрешение по умолчанию,только чтение,рабочая папка,полный доступ,автозапуск команд,не спрашивать';

  @override
  String get searchSettingsHint => 'Поиск в настройках';

  @override
  String get searchSuggestDark => 'Тёмный режим';

  @override
  String get searchSuggestBackground => 'Фон';

  @override
  String get searchSuggestPermission => 'Разрешения';

  @override
  String get searchSuggestTextSize => 'Размер текста';

  @override
  String get searchCommon => 'Частые';

  @override
  String get searchRecent => 'Недавние';

  @override
  String get searchFeatures => 'Возможности';

  @override
  String get searchNoResults => 'Подходящих настроек нет';

  @override
  String searchAskAi(String query) {
    return 'Спросить ИИ: «$query»';
  }

  @override
  String get searchKwPersonalization => 'персонализация,предпочтения,стиль';

  @override
  String get searchKwInterface => 'интерфейс,нативный,веб,веб-режим,веб-приложение,общие';

  @override
  String get searchKwPrivacy => 'приватность,данные,журналы,общий доступ,статистика';

  @override
  String get searchKwAbout => 'о приложении,версия,обновление,лицензии';

  @override
  String get searchKwPhoneConfirmEntry => 'подтверждение,управление телефоном,не спрашивать';

  @override
  String get searchKwWebCodingView => 'режим кода,рабочий вид,веб';

  @override
  String get searchKwWebCollapse => 'рабочие шаги,свернуть,веб';

  @override
  String get searchKwWebBusySend => 'отправка,очередь,пока ИИ работает';

  @override
  String get searchKwPluginsMarket => 'магазин плагинов,установка плагинов,маркетплейс';

  @override
  String get searchKwUsageStats =>
      'статистика,данные об использовании,аналитика,телеметрия,анонимно,приватность,данные';

  @override
  String get searchKwQuickPanel => 'свайп,свайп влево,быстрые действия,жест,быстрая панель,быстрый доступ';

  @override
  String get shellDeletePermanently => 'Удалить навсегда';

  @override
  String get shellDeleteNoUndo => 'Отменить нельзя; это не архив';

  @override
  String get shellDeleteChecking => 'Проверяем, поддерживает ли этот хост безвозвратное удаление…';

  @override
  String get shellDeleteUnsupported =>
      'Этот хост не поддерживает безопасное безвозвратное удаление. Архив по-прежнему доступен.';

  @override
  String get shellDeleteUnavailable =>
      'Безопасное безвозвратное удаление недоступно. Переподключитесь или обновите этот хост; в архив ничего не отправлено.';

  @override
  String shellDeleteChatConfirmation(String title) {
    return 'Удалить «$title» навсегда?';
  }

  @override
  String shellDeleteChatsConfirmation(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Удалить $count чата навсегда?',
      many: 'Удалить $count чатов навсегда?',
      few: 'Удалить $count чата навсегда?',
      one: 'Удалить $count чат навсегда?',
    );
    return '$_temp0';
  }

  @override
  String get shellDeleteWarning =>
      'Выбранная история чатов будет безвозвратно удалена с этого хоста. Отменить это нельзя, и это не архив.\n\nРабочие папки, созданные файлы, ветки, общие вложения и опубликованные облачные ссылки сохранятся. Облачные ссылки нужно удалять отдельно. Хост может отклонить удаление активных или связанных чатов.';

  @override
  String get shellDeleteOwnerChanged =>
      'Хост или подключение изменились. Отмените и начните удаление заново; старое подтверждение больше не действует.';

  @override
  String get shellDeletingChats => 'Удаление чатов…';

  @override
  String shellChatsDeleted(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чата удалены навсегда',
      many: '$count чатов удалены навсегда',
      few: '$count чата удалены навсегда',
      one: '$count чат удалён навсегда',
    );
    return '$_temp0';
  }

  @override
  String shellDeletePartial(int deleted, int failed) {
    String _temp0 = intl.Intl.pluralLogic(
      deleted,
      locale: localeName,
      other: 'Удалено $deleted чата',
      many: 'Удалено $deleted чатов',
      few: 'Удалено $deleted чата',
      one: 'Удалён $deleted чат',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failed,
      locale: localeName,
      other: '$failed с ошибкой',
      many: '$failed с ошибкой',
      few: '$failed с ошибкой',
      one: '$failed с ошибкой',
    );
    return '$_temp0; $_temp1';
  }

  @override
  String get shellDeleteRunning =>
      'Остановите выполняющуюся работу перед удалением. Хост также проверяет активные задачи и расписания.';

  @override
  String get shellDeleteRelated =>
      'У этого чата есть связанная работа субагентов. Хост отклонил удаление, чтобы её защитить.';

  @override
  String get shellDeleteWriterHeld => 'Другой процесс использует этот чат. Закройте его там и повторите.';

  @override
  String get shellDeleteNotFound => 'Этого чата больше нет на этом хосте. Обновите список.';

  @override
  String get shellDeleteConnectionLost =>
      'Соединение потеряно, результат удаления не подтверждён. Обновите список чатов, прежде чем действовать дальше.';

  @override
  String get shellDeleteArchivePending => 'Ожидается операция архивации. Завершите или отмените её перед удалением.';

  @override
  String get shellDeleteInventoryChanged => 'Список чатов изменился. Обновите и выберите чаты заново.';

  @override
  String get shellDeleteProtocolError =>
      'Результат удаления не подтверждён. Обновите список чатов, прежде чем действовать дальше.';

  @override
  String get shellDeleteNotAttempted => 'Не выполнялось. Проверьте список чатов, прежде чем повторить.';

  @override
  String get shellDeleteFailed => 'Хост не смог подтвердить удаление. Обновите перед повторной попыткой.';

  @override
  String get setupAppearanceTitle => 'Выберите оформление';

  @override
  String get setupAppearanceMessage => 'Это можно изменить в любой момент в Настройках';

  @override
  String get setupLightMode => 'Облегчённый режим';

  @override
  String get setupCapsulePreparing => 'Подготовка среды';

  @override
  String setupCapsuleProgress(int percent) {
    return 'Среда $percent%';
  }

  @override
  String setupCapsuleProgressSemantics(int percent) {
    return 'Подготовка среды, готово $percent%';
  }

  @override
  String get setupCapsuleReady => 'Среда готова';

  @override
  String get setupCapsuleFailed => 'Установка не удалась';

  @override
  String get setupWaitingBody => 'Продолжится само, когда будет готово';

  @override
  String get setupNotifyWhenDone => 'Мы уведомим вас, когда всё будет готово';

  @override
  String get setupAwaitSignIn => 'Вход в DeepSeek откроется, когда всё будет готово';

  @override
  String get shellApiKeyPrefixWarning =>
      'Ключи DeepSeek обычно начинаются с sk-. Проверьте, что скопировали нужный ключ.';

  @override
  String get shellApiKeyIncompleteWarning => 'Ключ выглядит неполным. Проверьте, что скопировали его целиком.';

  @override
  String get shellBrowserUrlCopied => 'Не удалось открыть браузер. URL скопирован.';

  @override
  String get shellSaveTryAgain => 'Не удалось сохранить. Повторите попытку.';

  @override
  String get shellApiKeyUpdated => 'API-ключ обновлён';

  @override
  String get shellReplaceApiKey => 'Заменить API-ключ';

  @override
  String get shellEnterApiKey => 'Введите API-ключ';

  @override
  String get shellApiKeyBilling => 'Оплата через платформу DeepSeek по факту использования';

  @override
  String get shellSaving => 'Сохранение';

  @override
  String get shellSaveContinue => 'Сохранить и продолжить';

  @override
  String get shellSetUpLater => 'Настроить позже';

  @override
  String get shellClearField => 'Очистить';

  @override
  String get shellShow => 'Показать';

  @override
  String get shellApiKeyEncrypted => 'Зашифрован на этом телефоне';

  @override
  String get shellGetApiKey => 'Получить API-ключ';

  @override
  String get shellConnectDeepSeek => 'Подключить DeepSeek';

  @override
  String get shellConnectDeepSeekMessage => 'Войдите в DeepSeek, чтобы начать. API-ключ не нужен.';

  @override
  String get shellAccountSignInUnsupported => 'Этот движок не поддерживает вход в аккаунт';

  @override
  String get shellSignInDeepSeek => 'Войти через DeepSeek';

  @override
  String get shellUseApiKey => 'Использовать API-ключ';

  @override
  String get shellOtherProviders => 'Другие провайдеры';

  @override
  String shellOnboardingStep(int step, int steps) {
    return 'Шаг $step из $steps';
  }

  @override
  String get shellRuntimeUpdating => 'Обновление среды';

  @override
  String get shellRuntimePreparing => 'Подготовка среды';

  @override
  String get shellRuntimeReady => 'Готово';

  @override
  String get shellRuntimeIncomplete => 'Установка не завершена';

  @override
  String get shellRuntimeFilesKept => 'Ваши чаты и файлы сохранятся';

  @override
  String get shellRuntimeFirstSetup => 'Первая настройка займёт минуту-другую';

  @override
  String get shellRuntimeContinuing => 'Скоро продолжим';

  @override
  String get shellRuntimeRestoreFailed => 'Не удалось восстановить сохранённое';

  @override
  String get shellRuntimeExtractFailed => 'Не удалось распаковать файлы';

  @override
  String get shellInstallLogs => 'Журнал установки';

  @override
  String get shellRuntimeLocalOnly => 'Всё работает на этом телефоне';

  @override
  String get shellRuntimeContinueWithoutKept => 'Продолжить без восстановления';

  @override
  String get shellRuntimeAlmostDone => 'Почти готово';

  @override
  String shellRuntimeSecondsRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Около $count секунды',
      many: 'Около $count секунд',
      few: 'Около $count секунд',
      one: 'Около $count секунды',
    );
    return '$_temp0';
  }

  @override
  String shellRuntimeMinutesRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Около $count минуты',
      many: 'Около $count минут',
      few: 'Около $count минут',
      one: 'Около $count минуты',
    );
    return '$_temp0';
  }

  @override
  String get shellEngineLogs => 'Журнал движка';

  @override
  String get shellWelcomeMessage => 'Агент DeepSeek,\nв вашем кармане';

  @override
  String get shellGetStarted => 'Начать';

  @override
  String get shellSearchChats => 'Поиск чатов';

  @override
  String get shellCollapseChatList => 'Свернуть список чатов';

  @override
  String get shellExpandChatList => 'Развернуть список чатов';

  @override
  String get shellChatList => 'Чаты';

  @override
  String get shellChatDetails => 'Сведения о чате';

  @override
  String get shellCollapseDetails => 'Свернуть сведения';

  @override
  String get shellExpand => 'Развернуть';

  @override
  String get shellUndo => 'Отменить';

  @override
  String shellFolderDeleted(String name) {
    return 'Удалено «$name»';
  }

  @override
  String shellMovedToFolder(String name) {
    return 'Перемещено в «$name»';
  }

  @override
  String get shellMovedOutOfFolder => 'Перемещено из папки';

  @override
  String get shellUnpinFailed => 'Не удалось открепить. Повторите позже.';

  @override
  String get shellPinFailed => 'Не удалось закрепить. Повторите позже.';

  @override
  String shellChatsUnpinned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Откреплено $count чата',
      many: 'Откреплено $count чатов',
      few: 'Откреплено $count чата',
      one: 'Откреплён $count чат',
    );
    return '$_temp0';
  }

  @override
  String shellChatsPinned(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Закреплено $count чата',
      many: 'Закреплено $count чатов',
      few: 'Закреплено $count чата',
      one: 'Закреплён $count чат',
    );
    return '$_temp0';
  }

  @override
  String get shellArchiveFailed => 'Не удалось архивировать. Повторите позже.';

  @override
  String shellChatsStoppedArchived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Остановлено и заархивировано $count чата',
      many: 'Остановлено и заархивировано $count чатов',
      few: 'Остановлено и заархивировано $count чата',
      one: 'Остановлен и заархивирован $count чат',
    );
    return '$_temp0';
  }

  @override
  String shellChatsArchived(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Заархивировано $count чата',
      many: 'Заархивировано $count чатов',
      few: 'Заархивировано $count чата',
      one: 'Заархивирован $count чат',
    );
    return '$_temp0';
  }

  @override
  String shellFilterLabel(String label) {
    return 'Фильтр: $label';
  }

  @override
  String get shellFolders => 'Папки';

  @override
  String get shellNoRunningChats => 'Нет активных чатов';

  @override
  String get shellNoPendingChats => 'Нет чатов, ждущих подтверждения';

  @override
  String get shellNoUnreadChats => 'Нет непрочитанных чатов';

  @override
  String get shellNoChatsYet => 'Чатов пока нет';

  @override
  String shellFolderLabel(String name) {
    return 'Папка «$name»';
  }

  @override
  String shellFolderChatCount(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Папка «$name», $count чата',
      many: 'Папка «$name», $count чатов',
      few: 'Папка «$name», $count чата',
      one: 'Папка «$name», $count чат',
    );
    return '$_temp0';
  }

  @override
  String get shellSort => 'Сортировка';

  @override
  String get shellRecentActivity => 'Недавняя активность';

  @override
  String get shellCreatedTime => 'Дата создания';

  @override
  String get shellNewFolder => 'Новая папка';

  @override
  String get shellManageFolders => 'Управление папками';

  @override
  String get shellMultiSelect => 'Выбрать';

  @override
  String get shellFolderNameExists => 'Папка с таким названием уже есть';

  @override
  String get shellEditFolder => 'Изменить папку';

  @override
  String get shellFolderMark => 'Метка';

  @override
  String shellFolderColor(int number) {
    return 'Цвет $number';
  }

  @override
  String get shellMoveToFolder => 'Переместить в папку';

  @override
  String get shellMoveOutOfFolder => 'Переместить из папки';

  @override
  String get shellDeleteFolder => 'Удалить папку';

  @override
  String get shellDragToReorder => 'Перетащите, чтобы изменить порядок';

  @override
  String get shellSelectChats => 'Выбрать чаты';

  @override
  String shellSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Выбрано $count',
      many: 'Выбрано $count',
      few: 'Выбрано $count',
      one: 'Выбран $count',
    );
    return '$_temp0';
  }

  @override
  String get shellDeselectAll => 'Снять выбор';

  @override
  String get shellSelectAll => 'Выбрать все';

  @override
  String get shellUnpin => 'Открепить';

  @override
  String get shellArchive => 'В архив';

  @override
  String get shellCurrentlyRunning => 'Работает';

  @override
  String get shellUnread => 'Непрочитанное';

  @override
  String get shellPinned => 'Закреплено';

  @override
  String get shellEngineNotRunning => 'Движок не запущен';

  @override
  String shellHostNotConnected(String name) {
    return 'Подключение к «$name» ещё не установлено';
  }

  @override
  String get shellSearchAfterConnecting => 'Подключитесь для поиска';

  @override
  String get shellChatsLoadFailed => 'Не удалось загрузить чаты';

  @override
  String shellSearchHostChats(String name) {
    return 'Поиск чатов на «$name»';
  }

  @override
  String get shellSearchTitlesHint => 'Поиск по названиям, включая архивные чаты';

  @override
  String get shellSearchContentHint => 'Поиск по названиям и содержимому, включая архивные чаты';

  @override
  String get shellLoadingChatsEllipsis => 'Загрузка чатов…';

  @override
  String get shellNoMatchingChats => 'Нет подходящих чатов';

  @override
  String get shellSearchDifferentKeywords => 'Попробуйте другое слово или разделите слова пробелами';

  @override
  String get shellArchived => 'В архиве';

  @override
  String get shellRestoreBeforeOpening => 'Восстановите архивный чат, чтобы открыть его';

  @override
  String get shellRestoreAndOpen => 'Восстановить и открыть';

  @override
  String get shellRestoreFailed => 'Не удалось восстановить. Попробуйте позже.';

  @override
  String get shellSearchingMessages => 'Поиск по содержимому сообщений…';

  @override
  String get shellHostTitleSearchOnly => 'Этот хост поддерживает только поиск по названиям';

  @override
  String get shellContentSearchFailed => 'Не удалось найти по содержимому. Показаны только совпадения по названиям.';

  @override
  String get shellContentSearchLimit => 'Поиск по содержимому показывает 20 самых релевантных чатов';

  @override
  String get shellMoveToOtherFolder => 'Переместить в другую папку';

  @override
  String get shellArchiveStopsTurn => 'Текущий раунд остановится';

  @override
  String get shellRenameFailed => 'Не удалось переименовать. Попробуйте позже.';

  @override
  String shellChatStoppedArchived(String title) {
    return 'Остановлен и архивирован «$title»';
  }

  @override
  String shellChatArchived(String title) {
    return '«$title» в архиве';
  }

  @override
  String get shellRenameChat => 'Переименовать чат';

  @override
  String get shellChatTitle => 'Название чата';

  @override
  String shellUnreadCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count непрочитанного',
      many: '$count непрочитанных',
      few: '$count непрочитанных',
      one: '$count непрочитанный',
    );
    return '$_temp0';
  }

  @override
  String get shellLoadingChats => 'Загрузка чатов';

  @override
  String get shellWorkspaceNoChats => 'Здесь пока нет чатов';

  @override
  String get shellWorkspaceNewChatsHint =>
      'Новые чаты попадут в эту рабочую папку. Ранние чаты сюда автоматически не переносятся; ищите их в «Все чаты».';

  @override
  String get shellNewChatsHint => 'Новые чаты появятся здесь';

  @override
  String get shellEngineStarting => 'Движок запускается';

  @override
  String get shellChatsAfterStarting => 'Чаты появятся после запуска';

  @override
  String get shellStartEngine => 'Запустить движок';

  @override
  String get shellEngineStatusHint => 'Статус — в разделе «Движок»';

  @override
  String shellHostUnreachable(String name) {
    return '«$name» недоступен';
  }

  @override
  String shellHostReconnecting(String name) {
    return 'Повторное подключение к «$name»…';
  }

  @override
  String get shellRetryNow => 'Повторить сейчас';

  @override
  String shellHostConnecting(String name) {
    return 'Подключение к «$name»…';
  }

  @override
  String get shellHostChatsAfterConnecting => 'Чаты этого хоста появятся после подключения';

  @override
  String shellCurrentHostLabel(String name, String view) {
    return 'Текущий хост: $name, $view. Сменить хост';
  }

  @override
  String get shellChatGone => 'Этот чат больше не существует';

  @override
  String get shellAccentMist => 'Дымка';

  @override
  String get shellAccentDaiqing => 'Тёмная бирюза';

  @override
  String get shellAccentDusk => 'Сумерки';

  @override
  String get shellAccentTurquoise => 'Аквамарин';

  @override
  String get shellAccentGreen => 'Зелень';

  @override
  String get shellAccentAmber => 'Янтарь';

  @override
  String get shellAccentOrange => 'Мандарин';

  @override
  String get shellAccentGraphite => 'Графит';

  @override
  String get shellHideTurnFooter => 'Подвал раунда';

  @override
  String get shellHideTokenCount => 'Счётчик токенов';

  @override
  String get shellHideReasoning => 'Рассуждения';

  @override
  String get shellHideActivityStrip => 'Полоса активности';

  @override
  String get shellHideWhaleTail => 'Хвост кита';

  @override
  String get shellHideTodoPill => 'Полоса задач';

  @override
  String get shellHideGoalBar => 'Полоса цели';

  @override
  String get shellToday => 'Сегодня';

  @override
  String get shellThisWeek => 'На этой неделе';

  @override
  String get shellEarlier => 'Раньше';

  @override
  String get shellSeatNative => 'Нативная';

  @override
  String get shellSeatIsland => 'Встроенный веб';

  @override
  String get shellSeatWeb => 'Открыть в DSH Web';

  @override
  String get shellPlugins => 'Плагины';

  @override
  String get shellHeaderActions => 'Кнопки в шапке';

  @override
  String get shellAllHidden => 'Все скрыты';

  @override
  String shellSettingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента',
      many: '$count элементов',
      few: '$count элемента',
      one: '$count элемент',
    );
    return '$_temp0';
  }

  @override
  String get shellQuickActions => 'Быстрые действия';

  @override
  String get shellSuggestionCards => 'Карточки-подсказки';

  @override
  String shellSuggestionCardCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count карточки',
      many: '$count карточек',
      few: '$count карточки',
      one: '$count карточка',
    );
    return '$_temp0';
  }

  @override
  String get shellDrawerGroups => 'Группы боковой панели';

  @override
  String get shellDrawerSort => 'Порядок в боковой панели';

  @override
  String get shellDrawerFilter => 'Фильтр боковой панели';

  @override
  String get shellPending => 'В ожидании';

  @override
  String get shellAll => 'Все';

  @override
  String get shellDensity => 'Плотность';

  @override
  String get shellCompact => 'Компактно';

  @override
  String get shellSpacious => 'Просторно';

  @override
  String get shellThemeMode => 'Режим оформления';

  @override
  String get shellAccentColor => 'Акцентный цвет';

  @override
  String get shellPet => 'Питомец';

  @override
  String get shellConfigured => 'Задано';

  @override
  String get shellShortcuts => 'Сочетания клавиш';

  @override
  String get shellConfigFileTooLarge => 'Файл больше 64 КиБ';

  @override
  String get shellConfigRootNotObject => 'Верхний уровень должен быть объектом';

  @override
  String get shellConfigVersionMissing => 'Нет поля version';

  @override
  String get shellConfigVersionNotInt => 'version должен быть целым числом';

  @override
  String get shellConfigVersionTooLow => 'version начинается с 1';

  @override
  String shellConfigVersionTooHigh(int version) {
    return 'Обновите приложение для версии $version';
  }

  @override
  String get shellConfigNotObject => 'Ожидался объект';

  @override
  String get shellConfigNotArray => 'Ожидался массив';

  @override
  String get shellConfigNotString => 'Ожидалась строка';

  @override
  String get shellConfigNotBool => 'Ожидалось true или false';

  @override
  String get shellConfigEmpty => 'Не может быть пустым';

  @override
  String get shellConfigUnknownKey => 'Неизвестный ключ, пропущен';

  @override
  String get shellConfigDuplicateKey => 'Повторяющийся ключ, применяется только последний';

  @override
  String get shellConfigDuplicateItem => 'Дубликат, пропущен';

  @override
  String shellConfigMissing(String key) {
    return 'Нет $key';
  }

  @override
  String shellConfigTruncated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Длиннее $count символа, обрезано',
      many: 'Длиннее $count символов, обрезано',
      few: 'Длиннее $count символов, обрезано',
      one: 'Длиннее $count символа, обрезано',
    );
    return '$_temp0';
  }

  @override
  String shellConfigTooLong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Длиннее $count символа',
      many: 'Длиннее $count символов',
      few: 'Длиннее $count символов',
      one: 'Длиннее $count символа',
    );
    return '$_temp0';
  }

  @override
  String shellConfigTooMany(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не больше $count элемента, лишние пропущены',
      many: 'Не больше $count элементов, лишние пропущены',
      few: 'Не больше $count элементов, лишние пропущены',
      one: 'Не больше $count элемента, лишние пропущены',
    );
    return '$_temp0';
  }

  @override
  String get shellConfigValueNoun => 'значение';

  @override
  String shellConfigUnsupportedValue(String noun, String value) {
    return 'Не поддерживается $noun «$value»';
  }

  @override
  String get shellConfigHeaderItem => 'Ожидался ID кнопки или объект';

  @override
  String get shellConfigHeaderId => 'В ID можно использовать буквы, цифры и -, начиная со строчной буквы';

  @override
  String get shellConfigIdTaken => 'Повторяющийся ID';

  @override
  String get shellConfigCommandSlash => 'В именах команд нет /, символ удалён';

  @override
  String get shellConfigCommandName => 'В именах команд допустимы только буквы, цифры и : . _ -';

  @override
  String get shellConfigNoNewline => 'Переносы строк не допускаются';

  @override
  String get shellConfigHttpsOnly => 'Поддерживаются только ссылки HTTPS';

  @override
  String get shellConfigBadUrl => 'Неверный формат ссылки';

  @override
  String get shellConfigAccentFormat => 'Указывайте цвета в формате #RRGGBB';

  @override
  String get shellConfigAccentBoth => 'Выберите что-то одно: это или accentPreset; использован accentPreset';

  @override
  String get shellConfigPetId => 'В ID допустимы только строчные буквы, цифры и -';

  @override
  String get shellConfigKeysFormat => 'Неверный формат, например ctrl+k';

  @override
  String get shellConfigSystemKey => 'Системные клавиши не допускаются';

  @override
  String get shellConfigNeedModifier => 'Добавьте ctrl или alt';

  @override
  String get shellConfigReservedKey => 'Занято системой или клавиатурой';

  @override
  String shellConfigDuplicateShortcut(String pointer) {
    return 'Совпадает с $pointer';
  }

  @override
  String get shellConfigSlotName => 'Неверный формат имени слота';

  @override
  String get shellConfigUnknownSlot => 'Этого слота в DSH пока нет, оставлен на будущее';

  @override
  String get shellConfigUnseatableSlot => 'Плагины здесь не поддерживаются';

  @override
  String get shellConfigPackageName => 'Неверный формат имени пакета';

  @override
  String get shellConfigActionNoun => 'действие';

  @override
  String get shellConfigPageNoun => 'страница';

  @override
  String get shellConfigButtonNoun => 'кнопка';

  @override
  String get shellConfigIconNoun => 'иконка';

  @override
  String get shellConfigNotTextFile => 'Это не текстовый файл';

  @override
  String shellJsonPosition(int line, int column, String reason) {
    return 'Строка $line, столбец $column: $reason';
  }

  @override
  String get shellJsonEmptyFile => 'Файл пуст';

  @override
  String get shellJsonExtraContent => 'Лишнее содержимое в конце';

  @override
  String get shellJsonIncompleteFile => 'Файл не завершён';

  @override
  String get shellJsonCommentsUnsupported => 'Комментарии не поддерживаются';

  @override
  String get shellJsonDoubleQuotes => 'Строки должны быть в двойных кавычках';

  @override
  String get shellJsonMissingValue => 'Здесь не хватает значения';

  @override
  String shellJsonUnknownContent(String value) {
    return 'Нераспознанное содержимое «$value»';
  }

  @override
  String get shellJsonTooDeep => 'Слишком большая вложенность';

  @override
  String get shellJsonExtraComma => 'Лишняя запятая';

  @override
  String get shellJsonQuotedKey => 'Ключи должны быть в двойных кавычках';

  @override
  String get shellJsonExpectedKey => 'Здесь ожидался ключ';

  @override
  String get shellJsonMissingColon => 'После ключа не хватает двоеточия';

  @override
  String get shellJsonMissingComma => 'Здесь не хватает запятой';

  @override
  String shellJsonUnexpectedContent(String value) {
    return 'Здесь не ожидалось «$value»';
  }

  @override
  String get shellJsonUnterminatedString => 'Строка не завершена';

  @override
  String get shellJsonBadEscape => 'Неверная escape-последовательность';

  @override
  String get shellJsonStringNewline => 'В строках не может быть переносов строк';

  @override
  String get shellJsonControlCharacter => 'Строка содержит управляющий символ';

  @override
  String get shellJsonBadNumber => 'Неверный формат числа';

  @override
  String shellSkillInstallPrompt(String skill) {
    return 'Установите навык интерфейса DSH Go $skill на этот хост:';
  }

  @override
  String shellSkillInstallDirectory(String skill) {
    return '1. Создайте при необходимости папку `\$DSH_HOME/skills/$skill/` (или `~/.dsh/skills/$skill/`, если DSH_HOME не задан).';
  }

  @override
  String get shellSkillInstallFiles =>
      '2. Запишите каждый файл ниже по указанному относительному пути, сохранив содержимое в точности как есть.';

  @override
  String get shellSkillInstallConfirm => '4. Сообщите мне, когда установка завершится.';

  @override
  String shellSkillInstallFile(String path) {
    return 'Файл `$path`:';
  }

  @override
  String get shellFromUiJson => 'Из ui.json';

  @override
  String get shellViewSource => 'Открыть источник';

  @override
  String get shellSourcePosition => 'Расположение';

  @override
  String get shellRestoreDefaults => 'Сбросить к значениям по умолчанию';

  @override
  String get shellConfigNotApplied => 'Не применено';

  @override
  String shellConfigDroppedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count проблемы не применено',
      many: '$count проблем не применено',
      few: '$count проблемы не применены',
      one: '$count проблема не применена',
    );
    return '$_temp0';
  }

  @override
  String shellConfigAppliedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Применено $count элемента',
      many: 'Применено $count элементов',
      few: 'Применено $count элемента',
      one: 'Применён $count элемент',
    );
    return '$_temp0';
  }

  @override
  String get shellInterfaceConfig => 'Конфигурация интерфейса';

  @override
  String get shellSkillNotInstalled => 'Навык не установлен';

  @override
  String get shellInstallInterfaceSkill => 'Установить навык интерфейса';

  @override
  String get shellInstallInterfaceSkillMessage =>
      'После установки ИИ сможет менять интерфейс приложения по вашей просьбе';

  @override
  String get shellNoUiJson => 'Нет ui.json';

  @override
  String get shellConfigUsingPrevious => 'Не применено, по-прежнему используется предыдущая конфигурация';

  @override
  String get shellConfigDroppedHeading => 'Не применено';

  @override
  String get shellConfigNotesHeading => 'Предупреждения';

  @override
  String get shellConfigAppliedHeading => 'Применено';

  @override
  String shellConfigValueOptions(String noun, String value, String options) {
    return 'Не поддерживается $noun «$value», варианты: $options';
  }

  @override
  String get shellListSeparator => ', ';

  @override
  String shellSkillInstallCheck(String command) {
    return '3. После записи файлов выполните $command. Если он сработает, установка завершена (сообщение о том, что ui.json ещё нет, — это нормально).';
  }

  @override
  String get shellSemanticsSeparator => ', ';

  @override
  String shellChatsArchivedPartial(int count, int failed) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Заархивировано $count чата',
      many: 'Заархивировано $count чатов',
      few: 'Заархивировано $count чата',
      one: 'Заархивирован $count чат',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failed,
      locale: localeName,
      other: 'не удалось заархивировать $failed чата',
      many: 'не удалось заархивировать $failed чатов',
      few: 'не удалось заархивировать $failed чата',
      one: 'не удалось заархивировать $failed чат',
    );
    return '$_temp0; $_temp1';
  }

  @override
  String get shellQuickPanel => 'Быстрые действия';

  @override
  String shellQuickPanelHint(String path) {
    return 'Изменить можно в $path';
  }

  @override
  String starPromptTitle(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: 'Я составляю вам компанию в DSH Go уже $hours часа~',
      many: 'Я составляю вам компанию в DSH Go уже $hours часов~',
      few: 'Я составляю вам компанию в DSH Go уже $hours часа~',
      one: 'Я составляю вам компанию в DSH Go уже $hours час~',
      zero: 'Я составляю вам компанию в DSH Go уже полчаса~',
    );
    return '$_temp0';
  }

  @override
  String get starPromptBody =>
      'DSH Go бесплатен и открыт. Если он сделал ваш телефон чуть приятнее, поставьте ему звезду — для этого маленького кита это очень много значит!';

  @override
  String get starPromptPlea => 'Ну пожалуйста~ Это правда важно!!';

  @override
  String get starPromptStar => 'Поставить звезду на GitHub';

  @override
  String get starPromptDone => 'Звезда уже стоит';

  @override
  String get starPromptLater => 'Может, позже';

  @override
  String get starSettingsTitle => 'Поставить DSH Go звезду на GitHub';

  @override
  String get stateDiagnosticsSubject => 'Пакет диагностики DSH Go';

  @override
  String get stateStoragePermission => 'Нет доступа к памяти для сохранения в «Загрузки»';

  @override
  String get stateDiagnosticsStorageFull => 'Недостаточно места для создания пакета диагностики';

  @override
  String get stateDiagnosticsExportFailed => 'Не удалось экспортировать пакет диагностики';

  @override
  String get stateForumUnreachable => 'Форум недоступен';

  @override
  String get stateSignInExpired => 'Вход истёк. Войдите снова.';

  @override
  String get stateForbidden => 'Доступ запрещён';

  @override
  String get stateForumContentMissing => 'Содержимое не найдено или удалено';

  @override
  String get stateTooManyActions => 'Слишком много действий. Попробуйте позже.';

  @override
  String get stateForumSendFailed => 'Не удалось отправить';

  @override
  String get stateForumServerError => 'На форуме произошёл сбой';

  @override
  String get stateBrowserOpenFailed => 'Не удалось открыть браузер';

  @override
  String get stateSignInStartFailed => 'Не удалось начать вход';

  @override
  String get stateSignInIncompleteRetry => 'Вход не завершён. Попробуйте снова.';

  @override
  String get statePluginLabel => 'Плагин';

  @override
  String get stateConfigLabel => 'Конфигурация';

  @override
  String get stateConfigShare => 'Общая конфигурация';

  @override
  String get stateShareCode => 'Код общего доступа';

  @override
  String get stateCopyShareCodeFirst => 'Сначала скопируйте код в разделе «Поделиться»';

  @override
  String get stateFileOpenFailed => 'Не удалось открыть этот файл';

  @override
  String get stateLinkOpenFailed => 'Не удалось открыть эту ссылку';

  @override
  String get stateAlertPublicDone => 'Раунд завершён';

  @override
  String get stateAlertPublicFailed => 'Раунд не удался';

  @override
  String get stateAlertPublicStopped => 'Раунд остановлен';

  @override
  String get stateAlertPublicApproval => 'Шаг требует вашего подтверждения';

  @override
  String get stateAlertPublicQuestion => 'Вопрос ждёт вашего ответа';

  @override
  String get stateAlertTurnDone => 'Этот раунд завершён';

  @override
  String get stateAlertOutputLimit => 'Завершено · Достигнут лимит вывода';

  @override
  String get stateAlertTurnBlocked => 'Этот раунд заблокирован';

  @override
  String get stateAlertEngineRestarted => 'Прервано · Движок перезапущен';

  @override
  String get stateAlertMissingKey => 'Ошибка · Ключ API не задан';

  @override
  String get stateAlertTurnFailed => 'Этот раунд не удался';

  @override
  String get stateRunCommand => 'Выполнить команду';

  @override
  String get stateWriteFile => 'Записать файл';

  @override
  String get stateEditFile => 'Изменить файл';

  @override
  String get stateOpenPage => 'Открыть веб-страницу';

  @override
  String get stateWebSearch => 'Поиск в интернете';

  @override
  String get stateAlertQuestion => 'Вопрос к вам';

  @override
  String get stateSizeSmall => 'Мелкий';

  @override
  String get stateSizeStandard => 'Обычный';

  @override
  String get stateSizeLarge => 'Крупный';

  @override
  String get statePetDone => 'Готово';

  @override
  String get statePetFailed => 'Что-то пошло не так';

  @override
  String get statePhoneNotReady => 'Управление телефоном не готово';

  @override
  String get stateBackgroundRestricted => 'Доступ к сети в фоне ограничен';

  @override
  String get stateBackgroundFinish => 'Позволять чатам завершаться в фоне';

  @override
  String get stateDeepSeekAccount => 'Аккаунт DeepSeek';

  @override
  String get stateAccountUnreachable => 'DeepSeek недоступен';

  @override
  String get stateAccountUnavailable => 'Вход в DeepSeek недоступен';

  @override
  String get stateSignInIncomplete => 'Вход не завершён';

  @override
  String get stateSignInTimeout => 'Время входа истекло';

  @override
  String get stateSignInSaveFailed => 'Не удалось сохранить данные входа';

  @override
  String get stateEngineNotReady => 'Движок не готов';

  @override
  String get stateSignInInterrupted => 'Вход прерван';

  @override
  String get stateAccountUnsupported => 'Этот движок не поддерживает вход в аккаунт';

  @override
  String get stateCheckPhoneNetwork => 'Проверьте сеть на телефоне и повторите попытку';

  @override
  String get stateServiceUnavailableRetry => 'Сервис недоступен. Попробуйте позже.';

  @override
  String get stateAuthorizationFailed => 'Авторизация не удалась. Войдите снова.';

  @override
  String get stateAuthorizationExpired => 'Страница авторизации устарела. Войдите снова.';

  @override
  String get stateRestartEngineRetry => 'Перезапустите движок в разделе «Движок» и повторите попытку';

  @override
  String get stateEngineStartingRetry => 'Движок запускается. Попробуйте позже.';

  @override
  String get stateEngineDisconnectedSignIn => 'Движок отключён. Войдите снова.';

  @override
  String get stateUpdateRuntimeOrKey => 'Обновите среду выполнения или используйте ключ API';

  @override
  String get stateEngineDisconnected => 'Движок отключён';

  @override
  String get stateAgentError => 'Ошибка';

  @override
  String get stateNotRunning => 'Не запущен';

  @override
  String get stateAgentOneShot => 'Одноразовый';

  @override
  String get stateAgentContinuable => 'Продолжаемый';

  @override
  String get stateAgentExternal => 'Внешняя задача';

  @override
  String get stateSubagent => 'Субагент';

  @override
  String get stateParentChat => 'Родительский чат';

  @override
  String get statePreparing => 'Подготовка';

  @override
  String get stateIconMist => 'Туманно-синий';

  @override
  String get stateIconNight => 'Сумерки';

  @override
  String get stateIconFrost => 'Морозно-белый';

  @override
  String get stateIconInk => 'Чернила';

  @override
  String get stateAppDisclaimer => 'Работает на DeepSeek Harness · Неофициальное приложение DeepSeek';

  @override
  String get stateWallpaper => 'Обои';

  @override
  String get stateFileMissing => 'Файл не найден. Возможно, он удалён или перемещён.';

  @override
  String get stateFileNoApp => 'На телефоне нет приложения для этого типа файлов';

  @override
  String get stateFileConnectionLimit => 'Файл слишком большой для этого подключения';

  @override
  String get stateFileReadUnsupported => 'Это подключение не поддерживает чтение файлов';

  @override
  String get stateArtifactImage => 'Изображение';

  @override
  String get stateArtifactDocument => 'Документ';

  @override
  String get stateArtifactSheet => 'Таблица';

  @override
  String get stateArtifactSlides => 'Презентация';

  @override
  String get stateArtifactArchive => 'Архив';

  @override
  String get stateArtifactAudio => 'Аудио';

  @override
  String get stateArtifactVideo => 'Видео';

  @override
  String get stateArtifactWeb => 'Веб-страница';

  @override
  String get stateArtifactText => 'Текст';

  @override
  String get stateArtifactFile => 'Файл';

  @override
  String get statePrivateKeyTooLarge => 'Файл слишком большой для закрытого ключа';

  @override
  String get stateBotTeamBusy => 'Другой DSH использует эту команду';

  @override
  String get stateBotOperationFailed => 'Не удалось завершить. Повторите.';

  @override
  String get stateBotMissing => 'На этом хосте нет DS Bot';

  @override
  String get stateHostAuthFailed => 'Ошибка аутентификации хоста';

  @override
  String get stateUnexpectedError => 'Что-то пошло не так';

  @override
  String get stateGroupChat => 'Групповой чат';

  @override
  String get stateBotNewMessage => 'Новое сообщение бота';

  @override
  String get stateChatAgentBusy => 'ИИ занят. Повторите позже.';

  @override
  String get stateChatWriterHeld => 'Этот чат используется в другом месте';

  @override
  String get stateChatModelUnavailable => 'Эта модель недоступна';

  @override
  String get stateChatAttachmentInvalid => 'Не удаётся отправить это вложение';

  @override
  String get stateChatForkUnavailable => 'Здесь нельзя создать ветку';

  @override
  String get stateChatImagesTooLarge => 'Изображения слишком большие. Отправьте меньше за раз.';

  @override
  String get stateChatSyncInterrupted => 'Синхронизация чата прервана';

  @override
  String get stateChatSynchronizing => 'Синхронизация чата';

  @override
  String get stateChatSyncRetry => 'Синхронизировать снова';

  @override
  String get stateChatSyncRequired => 'Чат ещё не синхронизирован. Синхронизируйте снова и повторите.';

  @override
  String get stateChatAutoApproveFailed => 'Не удалось разрешить автоматически';

  @override
  String get stateCommandMissing => 'Команда не найдена';

  @override
  String get stateCommandFailed => 'Команда не выполнилась';

  @override
  String get stateChatStopSteered => 'Не удалось остановить раунд. Отправлено как указание.';

  @override
  String get stateChatTextOnlyModel =>
      'Отправлено как файлы: эта модель не принимает изображения. Смените модель или задайте в поле «Ввод» значение «Текст + изображение».';

  @override
  String get stateAttachmentUploadFailed => 'Не удалось загрузить вложение';

  @override
  String get stateChatImageModelRequired =>
      'Эта модель не принимает изображения. Смените модель или задайте в поле «Ввод» значение «Текст + изображение» и отправьте заново.';

  @override
  String get stateSendFailed => 'Не удалось отправить';

  @override
  String get stateChatStopFailed => 'Не удалось остановить. Повторите.';

  @override
  String get stateChatTurnEnded => 'Этот раунд завершён. Ваше сообщение начнёт новый раунд.';

  @override
  String get stateChatSteerFailed => 'Не удалось передать указание';

  @override
  String get stateChatUndoTooLate => 'Слишком поздно. ИИ уже прочитал это сообщение.';

  @override
  String get stateChatUndoFailed => 'Не удалось отменить';

  @override
  String get stateChatApprovalFailed => 'Не удалось отправить подтверждение';

  @override
  String get stateChatAnswerFailed => 'Не удалось отправить ответ';

  @override
  String get stateChatModelSwitchFailed => 'Не удалось сменить модель';

  @override
  String get stateChatHistoryFailed => 'Не удалось загрузить историю';

  @override
  String get stateChatBranchLastReply => 'Ветка от последнего ответа завершённого раунда';

  @override
  String get stateChatBranchFailed => 'Не удалось создать ветку';

  @override
  String get stateChatEarlierHistoryFailed => 'Не удалось загрузить раннюю историю';

  @override
  String get stateChatNoEarlierHistory => 'До этого сообщения истории нет. Начните новый чат.';

  @override
  String get stateCommandNewDescription => 'Начать новый чат';

  @override
  String get stateModelLabel => 'Модель';

  @override
  String get stateCommandModelDescription => 'Сменить модель и глубину размышлений';

  @override
  String get stateCommandExportLabel => 'Экспорт журналов';

  @override
  String get stateCommandExportDescription =>
      'Экспортируйте всю историю этого чата в ZIP, чтобы поделиться или сохранить в Загрузки';

  @override
  String get stateAllFeatures => 'Все функции';

  @override
  String get stateCommandFeaturesDescription => 'Доступ ко всем функциям DSH Web';

  @override
  String get stateCompactLabel => 'Сжать';

  @override
  String get stateCommandCompactDescription => 'Сжать чат выше, чтобы освободить контекст';

  @override
  String get statePermissionLabel => 'Разрешение';

  @override
  String get stateCommandPermissionDescription =>
      'Сменить пресет разрешений (режим песочницы и политика подтверждений)';

  @override
  String get stateCommandPermissionHint => '<имя пресета>';

  @override
  String get statePlanLabel => 'План';

  @override
  String get stateCommandPlanDescription => 'Войти в режим плана или выйти из него';

  @override
  String get stateGoalLabel => 'Цель';

  @override
  String get stateCommandGoalDescription => 'Задать или посмотреть цель долгой задачи';

  @override
  String get stateFeedbackLabel => 'Обратная связь';

  @override
  String get stateCommandFeedbackDescription => 'Отправить отзыв об этом чате';

  @override
  String get stateCommandFeedbackHint => '<сообщение>';

  @override
  String get stateShareFileTooLarge => 'Один файл был слишком большим и не добавлен';

  @override
  String get stateShareFileUnreadable => 'Не удалось прочитать файл';

  @override
  String get stateShareImagesOnly => 'Этот хост умеет отправлять только изображения';

  @override
  String get stateComposerInserted => 'Добавлено в поле ввода';

  @override
  String get stateCordisPending => 'Ожидание';

  @override
  String get stateCordisStarting => 'Запуск';

  @override
  String get stateCordisRunFailed => 'Запуск не удался';

  @override
  String get stateCordisNoApproval => 'Разрешение на запуск не выдано';

  @override
  String get stateCordisBackendFailed => 'Не удалось запустить фоновый компонент';

  @override
  String get stateCordisClientLoadFailed => 'Не удалось загрузить интерфейс';

  @override
  String get stateCordisRenderFailed => 'Не удалось отобразить интерфейс';

  @override
  String get stateCordisFailed => 'Не удалось запустить';

  @override
  String get stateDrawerAll => 'Все';

  @override
  String get stateDrawerUnread => 'Непрочитанные';

  @override
  String get stateDrawerToday => 'Сегодня';

  @override
  String get stateDrawerThisWeek => 'На этой неделе';

  @override
  String get stateDrawerEarlier => 'Ранее';

  @override
  String get stateEngineAuthFailed => 'Ошибка аутентификации движка';

  @override
  String get stateChatMissing => 'Этот чат исчез';

  @override
  String get stateEngineUnsupported => 'Не поддерживается этой версией движка';

  @override
  String get stateSettingsRefreshed => 'Изменено в другом месте. Обновлено.';

  @override
  String get stateCredentialFromEnvironment => 'Этот ключ задан средой движка, здесь его изменить нельзя';

  @override
  String get stateSettingsFromFile => 'Задано файлом конфигурации';

  @override
  String get stateSettingsInteger => 'Введите целое число';

  @override
  String get stateSettingsInvalidFormat => 'Неверный формат';

  @override
  String get stateSettingsReadOnly => 'Настройки движка доступны только для чтения';

  @override
  String get statePluginDisabled => 'Плагин отключён';

  @override
  String get stateSettingsRestartRequired => 'Чтобы изменить это, перезапустите движок';

  @override
  String get stateSettingsInvalidValue => 'Неверное значение';

  @override
  String get stateSettingsRejected => 'Движок не принял это значение';

  @override
  String get stateInventoryEnabled => 'Включено';

  @override
  String get stateInventoryDisabled => 'Отключено';

  @override
  String get stateLoading => 'Загрузка';

  @override
  String get stateInventoryWaiting => 'Ожидание зависимостей';

  @override
  String get stateInventoryConditional => 'Условно';

  @override
  String get stateBundleBuiltIn => 'Встроено в DSH';

  @override
  String get stateBundleHeadless => 'Без интерфейса';

  @override
  String get stateConfigFile => 'Файл конфигурации';

  @override
  String get stateGoalEmpty => 'Цель не может быть пустой';

  @override
  String get stateGoalPauseFailed => 'Не удалось приостановить';

  @override
  String get stateGoalResumeFailed => 'Не удалось продолжить';

  @override
  String get stateGoalClearOffline => 'Не удалось очистить: движок недоступен';

  @override
  String get stateGoalClearFailed => 'Не удалось очистить';

  @override
  String get stateGoalStale => 'Цель изменилась. Повторите.';

  @override
  String get stateGoalMissing => 'Цель исчезла';

  @override
  String get stateGoalChatNotReady => 'Чат ещё не готов. Повторите позже.';

  @override
  String get stateGoalTurnsExhausted => 'Раунды закончились';

  @override
  String get stateGoalStateChanged => 'Статус цели изменился';

  @override
  String get stateSshHost => 'Хост SSH';

  @override
  String get stateHostBrowserFailed =>
      'Не удалось открыть браузер. Скопируйте ссылку для входа и откройте её в браузере.';

  @override
  String get stateSignInFailed => 'Не удалось войти';

  @override
  String get stateMarketTooLarge => 'Каталог плагинов слишком большой. Загрузка остановлена.';

  @override
  String get stateMarketUnreachable => 'Каталог плагинов недоступен';

  @override
  String get stateMarketInsecure => 'Не удалось установить защищённое соединение с каталогом плагинов';

  @override
  String get stateMarketTimeout => 'Каталог плагинов не ответил вовремя';

  @override
  String get stateMarketInterrupted => 'Загрузка каталога плагинов прервана';

  @override
  String get stateRegistryDefault => 'Реестр по умолчанию';

  @override
  String get stateRegistryNpm => 'Официальный реестр npm';

  @override
  String get stateRegistryMirror => 'Зеркало npmmirror';

  @override
  String get statePluginIncompatible => 'Плагин не поддерживает текущую версию DSH.';

  @override
  String get statePluginInstallCancelled => 'Установка отменена';

  @override
  String get statePluginNoChanges => 'Ничего не изменилось';

  @override
  String get statePluginIncompatibleTitle => 'Несовместимо с этой версией DSH';

  @override
  String get statePluginNetworkFailed => 'Нет подключения';

  @override
  String get statePluginSourceUnreachable => 'Сайт-источник плагина недоступен';

  @override
  String get statePluginDownloadTimeout => 'Время загрузки истекло';

  @override
  String get statePluginRegistryUnavailable => 'Реестр не отвечает';

  @override
  String get statePluginPnpmMissing => 'pnpm не найден';

  @override
  String get statePluginPhonePnpmMissing => 'На этом телефоне нет pnpm';

  @override
  String get statePluginHostPnpmMissing => 'На этом хосте нет pnpm';

  @override
  String get statePluginNotFound => 'Плагин не найден';

  @override
  String get statePluginPackageMissing => 'Пакет не найден в реестре';

  @override
  String get statePluginTooNew => 'Версия слишком новая';

  @override
  String get statePluginWaitForRelease => 'Можно установить через 24 часа после выпуска';

  @override
  String get statePluginVersionMissing => 'Версия не найдена';

  @override
  String get statePluginRegistryVersionMissing => 'Этой версии ещё нет в реестре';

  @override
  String get stateDeviceStorageFull => 'Недостаточно места на устройстве';

  @override
  String get statePluginNoWritePermission => 'Нет разрешения на запись';

  @override
  String get statePluginConfigReadOnly => 'Каталог конфигурации движка недоступен для записи';

  @override
  String get statePluginIntegrityFailed => 'Проверка файла не пройдена';

  @override
  String get statePluginDownloadIncomplete => 'Скачанный файл неполный';

  @override
  String get statePluginBuildScripts => 'Нужны скрипты сборки';

  @override
  String get statePluginBuildApproval => 'Скрипты сборки требуют подтверждения';

  @override
  String get statePluginAlreadyInstalled => 'Уже установлен';

  @override
  String get statePluginUninstallFirst => 'Удалите перед сменой версии';

  @override
  String get statePluginInvalid => 'Это не плагин DSH';

  @override
  String get statePluginNoEntry => 'В пакете нет точки входа плагина. Установка отменена.';

  @override
  String get statePluginInUse => 'Плагин используется';

  @override
  String get statePluginHasDependents => 'От него зависят другие плагины';

  @override
  String get statePluginManagedElsewhere => 'Здесь это изменить нельзя';

  @override
  String get statePluginEngineManaged => 'Этот плагин управляется движком';

  @override
  String get statePluginAuthorizationExpired => 'Срок авторизации истёк';

  @override
  String get statePluginBuildChanged => 'Скрипты сборки изменились. Переустановите плагин.';

  @override
  String get statePluginInvalidAddress => 'Неверный URL установки';

  @override
  String get statePluginCatalogInvalidAddress => 'В каталоге указан неверный URL установки';

  @override
  String get statePluginOperationIncomplete => 'Операция не завершилась';

  @override
  String get statePluginRemoteForbidden => 'Этот хост не разрешает удалённую установку';

  @override
  String get statePluginRelayToggleOnly => 'Через Relay можно только включать и выключать плагины';

  @override
  String get statePluginManagementUnsupported => 'Хост не поддерживает управление плагинами';

  @override
  String get statePluginEngineUnsupported => 'Этот движок не поддерживает управление плагинами';

  @override
  String get statePluginResultMissing => 'Не удалось получить результат установки';

  @override
  String get statePluginResultPending => 'Результат установки ещё не готов';

  @override
  String get statePluginDisconnected => 'Отключено';

  @override
  String get statePluginQueued => 'В очереди';

  @override
  String get statePluginRemoving => 'Удаление старой версии';

  @override
  String get statePluginInstalling => 'Загрузка и установка';

  @override
  String get statePluginApplying => 'Включение';

  @override
  String get statePluginCancelling => 'Отмена';

  @override
  String get statePluginInstalledRestart => 'Установлено. Перезапустите для применения.';

  @override
  String get statePluginInstallFailed => 'Не удалось установить';

  @override
  String get statePluginConnectFirst => 'Подключитесь, чтобы устанавливать плагины';

  @override
  String get stateProviderOpenAi => 'Совместимо с OpenAI';

  @override
  String get stateProviderAnthropic => 'Совместимо с Anthropic';

  @override
  String get stateProviderUrlRequired => 'Введите Base URL';

  @override
  String get stateProviderUrlInvalid => 'Введите полный URL, начинающийся с http:// или https://';

  @override
  String get stateProviderUrlSuffix => 'Уберите часть после ? или #';

  @override
  String get stateProviderKeyRequired => 'Введите ключ API';

  @override
  String get stateProviderKeyOnly => 'Вставьте только ключ, без имени переменной';

  @override
  String get stateProviderKeyQuotes => 'Уберите кавычки по краям';

  @override
  String get stateProviderKeyInvalid => 'Ключ содержит недопустимые символы';

  @override
  String get stateProviderModelRequired => 'Введите ID модели';

  @override
  String get stateProviderModelSpaces => 'ID модели не может содержать пробелы';

  @override
  String get stateProviderAlreadyAdded => 'Уже добавлено';

  @override
  String get stateProviderConflict => 'Провайдер изменился. Вернитесь назад и повторите.';

  @override
  String get stateProviderUnsupported => 'Эта версия движка не поддерживает такое действие';

  @override
  String get stateProviderKeyRejected => 'API-ключ недействителен или не имеет прав';

  @override
  String get stateProviderModelsMissing => 'Список моделей не найден. Проверьте Base URL.';

  @override
  String get stateProviderRateLimited => 'Слишком много запросов. Повторите позже.';

  @override
  String get stateProviderResponseTooLarge => 'Слишком большой ответ';

  @override
  String get stateProviderUnreachable => 'Адрес недоступен. Проверьте Base URL и сеть.';

  @override
  String get stateProviderModelsUnreadable => 'Не удалось прочитать список моделей. Проверьте Base URL.';

  @override
  String get stateProviderManualModels => 'Этот протокол не умеет получать список моделей. Добавьте их вручную.';

  @override
  String get stateProviderConfigRejected => 'Движок отклонил эту конфигурацию. Проверьте протокол и модель.';

  @override
  String get stateProviderOffline => 'Движок недоступен';

  @override
  String get stateSafeStartupFailed => 'Не удалось запустить';

  @override
  String get stateSafeCrashedEarly => 'Сбой вскоре после запуска';

  @override
  String get stateSafeCrashedLate => 'Сбой во время работы';

  @override
  String get stateSafeKilled => 'Остановлен системой';

  @override
  String get stateSafeManualEntry => 'Я включил безопасный режим вручную';

  @override
  String get stateScheduleNotCreated => 'Чат завершился, не создав автоматизацию';

  @override
  String get stateScheduleChatFailed => 'Чат завершился ошибкой';

  @override
  String get stateScheduleResultPending => 'Результат всё ещё ожидается';

  @override
  String get statePlanPending => 'Проверка плана';

  @override
  String get stateQuestionPending => 'Нужен ответ';

  @override
  String get stateExportRelayUnsupported => 'Экспорт через ретранслятор пока недоступен';

  @override
  String get stateExportChatMissing => 'Чат не найден';

  @override
  String get stateExportFailed => 'Не удалось экспортировать';

  @override
  String get stateSizeExtraLarge => 'Очень большой';

  @override
  String get stateSubscriptionUnsupported => 'Этот движок не поддерживает вход по подписке';

  @override
  String get stateSubscriptionUnreachable => 'Сервис входа недоступен. Проверьте сеть и повторите.';

  @override
  String get stateSubscriptionSignInFailed => 'Не удалось завершить вход. Повторите.';

  @override
  String get stateSubscriptionTimeout => 'Время ожидания истекло. Проверьте сеть и повторите.';

  @override
  String get stateSubscriptionDisconnected => 'Движок отключён. Повторите позже.';

  @override
  String get stateTerminalLimit => 'Достигнут предел терминалов';

  @override
  String get stateTerminalStartFailed => 'Не удалось запустить терминал';

  @override
  String get stateTileDuotone => 'Дуотон';

  @override
  String get stateTileGeometric => 'Геометрия';

  @override
  String get stateTileGlassy => 'Стекло';

  @override
  String get stateUiNative => 'Нативный';

  @override
  String get stateDefaultWorkspace => 'Рабочая папка по умолчанию';

  @override
  String stateDiagnosticsSaved(String where) {
    return 'Сохранено в $where';
  }

  @override
  String get stateDownloadsPrefix => 'Downloads/';

  @override
  String stateSharePluginCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count плагина',
      many: '$count плагинов',
      few: '$count плагина',
      one: '$count плагин',
    );
    return '$_temp0';
  }

  @override
  String stateShareSkillCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count навыка',
      many: '$count навыков',
      few: '$count навыка',
      one: '$count навык',
    );
    return '$_temp0';
  }

  @override
  String stateShareSettingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count группы настроек',
      many: '$count групп настроек',
      few: '$count группы настроек',
      one: '$count группа настроек',
    );
    return '$_temp0';
  }

  @override
  String stateAlertCompletedReply(String reply) {
    return 'Готово · $reply';
  }

  @override
  String stateAlertErrorDetail(String detail) {
    return 'Ошибка · $detail';
  }

  @override
  String stateAlertUseTool(String name) {
    return 'Использовать инструмент $name';
  }

  @override
  String stateAlertApprovalAction(String action) {
    return 'Нужно подтверждение: $action';
  }

  @override
  String stateAlertApprovalReason(String action, String reason) {
    return 'Нужно подтверждение: $action · $reason';
  }

  @override
  String stateAlertQuestions(String question, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Вопрос вам: $question (всего $count)',
      one: 'Вопрос вам: $question (всего 1)',
    );
    return '$_temp0';
  }

  @override
  String stateAlertQuestionText(String question) {
    return 'Вопрос вам: $question';
  }

  @override
  String statePetChatsDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чата завершены',
      many: '$count чатов завершено',
      few: '$count чата завершены',
      one: '$count чат завершён',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чата с ошибкой',
      many: '$count чатов с ошибкой',
      few: '$count чата с ошибкой',
      one: '$count чат с ошибкой',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsApproval(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чата ждут подтверждения',
      many: '$count чатов ждут подтверждения',
      few: '$count чата ждут подтверждения',
      one: '$count чат ждёт подтверждения',
    );
    return '$_temp0';
  }

  @override
  String statePetChatsQuestion(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count чата ждут вашего ответа',
      many: '$count чатов ждут вашего ответа',
      few: '$count чата ждут вашего ответа',
      one: '$count чат ждёт вашего ответа',
    );
    return '$_temp0';
  }

  @override
  String stateAttachmentEmpty(String name) {
    return '«$name» пустой';
  }

  @override
  String stateAttachmentImageLimit(String name) {
    return 'Изображение «$name» больше 20 МБ';
  }

  @override
  String stateAttachmentFileLimit(String name) {
    return 'Файл «$name» больше 200 МБ';
  }

  @override
  String get stateAttachmentTotalLimit => 'Общий размер вложений больше 400 МБ';

  @override
  String stateBotFinished(String name) {
    return '$name закончил работу';
  }

  @override
  String stateBotQuestion(String name, String text) {
    return '$name спрашивает: $text';
  }

  @override
  String stateBotApproval(String name, String text) {
    return '$name ждёт подтверждения: $text';
  }

  @override
  String get stateCommandPlanHint => '[off | request]';

  @override
  String get stateCommandGoalHint => '[goal | clear | pause | resume]';

  @override
  String stateShareReadFailed(String name) {
    return 'Не удалось прочитать «$name»';
  }

  @override
  String stateShareAttachmentLimit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'До $count вложения на сообщение',
      many: 'До $count вложений на сообщение',
      few: 'До $count вложений на сообщение',
      one: 'До $count вложения на сообщение',
    );
    return '$_temp0';
  }

  @override
  String stateShareNamedFileTooLarge(String name) {
    return '«$name» слишком большой, файл не добавлен';
  }

  @override
  String stateShareTextTruncated(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Текст слишком длинный. Оставлены первые $count символа.',
      many: 'Текст слишком длинный. Оставлены первые $count символов.',
      few: 'Текст слишком длинный. Оставлены первые $count символа.',
      one: 'Текст слишком длинный. Оставлен первый $count символ.',
    );
    return '$_temp0';
  }

  @override
  String stateSettingsMinimum(String bound) {
    return 'Не меньше $bound';
  }

  @override
  String stateSettingsMaximum(String bound) {
    return 'Не больше $bound';
  }

  @override
  String stateSettingsMultiple(String bound) {
    return 'Должно быть кратно $bound';
  }

  @override
  String stateSettingsMinLength(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не менее $count символа',
      many: 'Не менее $count символов',
      few: 'Не менее $count символов',
      one: 'Не менее $count символа',
    );
    return '$_temp0';
  }

  @override
  String stateSettingsMaxLength(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Не более $count символа',
      many: 'Не более $count символов',
      few: 'Не более $count символов',
      one: 'Не более $count символа',
    );
    return '$_temp0';
  }

  @override
  String stateEngineHttpRejected(int status) {
    return 'Движок отклонил запрос ($status)';
  }

  @override
  String stateGoalActionOffline(String action) {
    return '$action: движок недоступен';
  }

  @override
  String stateHostRemoteLabel(String name) {
    return '$name · Удалённый';
  }

  @override
  String stateMarketHttpError(int status) {
    return 'Не удалось открыть каталог плагинов (HTTP $status)';
  }

  @override
  String statePluginRuntimeIncompatible(String version) {
    return 'Этот плагин не поддерживает текущую версию DSH ($version).';
  }

  @override
  String statePluginRequiredVersion(String wanted, String current) {
    return 'Плагину нужен DSH $wanted. Текущая версия: $current.';
  }

  @override
  String get statePluginRegistryUnreachable => 'Реестр недоступен';

  @override
  String statePluginNamedRegistryUnreachable(String registry) {
    return 'Реестр недоступен ($registry)';
  }

  @override
  String statePluginBuildsPending(String builds) {
    return 'Нужно подтверждение: $builds';
  }

  @override
  String statePluginRegistryProgress(String registry, int attempt, int attempts) {
    return 'Скачивание из $registry (реестр $attempt/$attempts)';
  }

  @override
  String stateProviderServiceUnavailable(int status) {
    return 'Сервис недоступен ($status)';
  }

  @override
  String stateProviderServiceStatus(int status) {
    return 'Сервис вернул $status';
  }

  @override
  String stateProviderKeySaveFailed(String reason) {
    return 'Провайдер сохранён, а ключ нет: $reason';
  }

  @override
  String stateSafeSuspectPlugins(String what, String plugins) {
    return '$what, подозрительные плагины: $plugins';
  }

  @override
  String stateSafePreflightFailed(String what, String checks) {
    return '$what, проверки при запуске не пройдены: $checks';
  }

  @override
  String get stateListSeparator => ', ';

  @override
  String stateSafeRepairPrompt(String what) {
    return 'В моём DSH проблема в обычном режиме ($what). Следуй инструкции безопасного режима, чтобы найти причину. Исправь веб-конфигурацию обратимыми изменениями, проверь запуск с помощью dsh-app-plugins trial, затем расскажи, что изменилось.';
  }

  @override
  String stateScheduleCreatePrompt(String title, String rule, String args) {
    return 'Создай автоматизацию «$title»: $rule.\nВызови schedule_create ровно один раз с этими аргументами без изменений. Не запускай задачу сейчас.\n\n```json\n$args\n```';
  }

  @override
  String stateActionReason(String action, String reason) {
    return '$action: $reason';
  }

  @override
  String stateAlertPreviewRun(String value) {
    return 'Запуск: $value';
  }

  @override
  String stateAlertPreviewWrite(String value) {
    return 'Запись: $value';
  }

  @override
  String stateAlertPreviewEdit(String value) {
    return 'Изменение: $value';
  }

  @override
  String stateAlertPreviewOpen(String value) {
    return 'Открыть: $value';
  }

  @override
  String stateAlertPreviewUse(String value) {
    return 'Использовать инструмент: $value';
  }

  @override
  String get stateUiWeb => 'Веб';

  @override
  String statePluginRegistryProgressUnknown(String registry, int attempt) {
    return 'Загрузка из $registry (реестр $attempt/null)';
  }

  @override
  String get stateProviderTokenCountInvalid => 'Введите число, например 128K';

  @override
  String get appSlogan => 'В любое время, в любом месте. Just Go!';

  @override
  String get updateCheck => 'Проверить обновления';

  @override
  String get updateAutoCheck => 'Проверять автоматически';

  @override
  String get updateAutoCheckDaily => 'Раз в день';

  @override
  String get updateTileDownloading => 'Скачивание';

  @override
  String updateTileDownloadingPercent(int percent) {
    return 'Скачивание $percent%';
  }

  @override
  String get updateTileVerifying => 'Проверка';

  @override
  String get updateTileReady => 'Готово к установке';

  @override
  String get updateTileInstalling => 'Установка';

  @override
  String updateTileSkipped(String version) {
    return 'Пропущено: $version';
  }

  @override
  String updateTileNewVersion(String version) {
    return 'Новое: $version';
  }

  @override
  String get updateTileUpToDate => 'Обновлено';

  @override
  String get updateTileUnavailable => 'Сейчас не удаётся проверить';

  @override
  String get updateUpToDate => 'У вас последняя версия';

  @override
  String get updateCheckUnavailable => 'Сейчас не удаётся проверить обновления. Повторите позже.';

  @override
  String get updateDownloadInterrupted => 'Скачивание прервано';

  @override
  String get updateDownloadInterruptedMessage => 'Сеть отключена или слишком медленная. Повторите, чтобы продолжить.';

  @override
  String get updateDownloadUnavailable => 'Ссылка для скачивания недоступна';

  @override
  String get updateDownloadUnavailableMessage => 'Повторите позже или скачайте со страницы релиза.';

  @override
  String get updateChecksumFailed => 'Проверка пакета не пройдена';

  @override
  String get updateChecksumFailedMessage => 'Файл не совпадает с релизом и удалён. Повторите.';

  @override
  String get updateChecksumMissing => 'Нет данных для проверки';

  @override
  String get updateChecksumMissingMessage => 'Для безопасности скачайте и установите со страницы релиза.';

  @override
  String get updateStorageWriteFailed => 'Не удалось сохранить пакет';

  @override
  String get updateStorageWriteFailedMessage => 'Возможно, хранилище заполнено. Освободите место и повторите.';

  @override
  String get updateFreeSpaceRetry => 'Освободите место и повторите.';

  @override
  String updateSpaceRequired(String size) {
    return 'Нужно около $size свободного места. Освободите место и повторите.';
  }

  @override
  String get updateSettingsOpenFailed => 'Не удалось открыть системные настройки';

  @override
  String get updateSettingsOpenFailedMessage =>
      'Разрешите «Установка неизвестных приложений» в разделе «Настройки» → «Приложения» → DSH Go, затем вернитесь к установке.';

  @override
  String get updateInstallCancelled => 'Установка отменена';

  @override
  String get updateInstallCancelledMessage => 'Пакет сохранён. Установить можно в любой момент.';

  @override
  String get updateInstallUnconfirmed => 'Результат установки не подтверждён';

  @override
  String get updateInstallUnconfirmedMessage =>
      'Пакет сохранён. Проверьте системные запросы, затем повторите или откройте пакет системным установщиком.';

  @override
  String get updateSignatureMismatch => 'Подписи приложений не совпадают';

  @override
  String get updateSignatureMismatchMessage =>
      'У DSH Go на телефоне другая подпись (обычно это тестовая сборка). Удалите его перед установкой этой версии. При удалении ваши чаты, окружение Linux и настройки будут стёрты.';

  @override
  String get updateWrongPackage => 'Это не пакет DSH';

  @override
  String get updateWrongPackageMessage => 'Скачался не тот файл, он удалён. Повторите позже.';

  @override
  String get updateDowngradeBlocked => 'Нельзя установить старую версию';

  @override
  String get updateDowngradeBlockedMessage => 'DSH на телефоне новее этого пакета.';

  @override
  String get updateIncompatible => 'Несовместимо с этим телефоном';

  @override
  String get updateIncompatibleMessage =>
      'Требуемая в пакете версия Android или архитектура процессора не совпадает с вашим телефоном.';

  @override
  String get updatePackageCorrupt => 'Пакет повреждён';

  @override
  String get updatePackageCorruptMessage => 'Он удалён. Скачайте заново.';

  @override
  String get updateInstallBlocked => 'Установка заблокирована';

  @override
  String get updateInstallBlockedMessage => 'Разрешите установку в системном запросе или скачайте со страницы релиза.';

  @override
  String get updateInstallIncomplete => 'Установка не завершена';

  @override
  String get updateInstallIncompleteMessage => 'Повторите или скачайте со страницы релиза.';

  @override
  String updateBrowserOpenFailed(String host, String path) {
    return 'Не удалось открыть браузер. Откройте $host$path вручную.';
  }

  @override
  String updateUpToDateVersion(String version) {
    return 'У вас последняя версия: $version';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Текущая $version';
  }

  @override
  String get updateNewVersionFound => 'Доступна новая версия';

  @override
  String get updateReleaseNotes => 'Что нового';

  @override
  String get updateNoReleaseNotes => 'Для этой версии нет заметок о выпуске.';

  @override
  String get updateInstallKeepsData => 'DSH Go закроется для установки. Чаты и настройки сохранятся.';

  @override
  String get updateNoCompatiblePackage => 'Нет пакета для этого телефона';

  @override
  String get updateDownloading => 'Скачивание';

  @override
  String updateDownloadSource(String source) {
    return 'Через $source';
  }

  @override
  String get updateDownloadInBackgroundNote => 'Скачивание продолжится после закрытия этого окна';

  @override
  String get updateVerifyingPackage => 'Проверка пакета…';

  @override
  String get updateVerifyingPackageNote => 'Проверяем, что файл совпадает с релизом';

  @override
  String get updateInstalling => 'Установка…';

  @override
  String get updateConfirmInstallNote => 'Подтвердите установку в системном запросе';

  @override
  String get updatePackageDownloaded => 'Пакет скачан';

  @override
  String get updateReadyToInstall => 'Проверено и готово к установке.';

  @override
  String get updateAllowInstall => 'Разрешить DSH Go установку приложений';

  @override
  String get updateAllowInstallMessage =>
      'Включите «Установка неизвестных приложений» в системных настройках. Установка продолжится, когда вы вернётесь.';

  @override
  String get updateOpenReleasePage => 'Открыть страницу релиза';

  @override
  String get updateUpdateNow => 'Обновить сейчас';

  @override
  String get updateSkipVersion => 'Пропустить эту версию';

  @override
  String get updateInstallWithSystem => 'Установить системным установщиком';

  @override
  String get updateSystemInstallerFailed => 'Не удалось открыть системный установщик';

  @override
  String get updateStarProject => 'Поставить звезду';

  @override
  String get updateCancelDownload => 'Отменить скачивание';

  @override
  String get updateDownloadInBackground => 'Скачивать в фоне';

  @override
  String get updateVerifying => 'Проверка…';

  @override
  String get updateInstallingBusy => 'Установка…';

  @override
  String get updateOpenPermissionSettings => 'Включить';

  @override
  String updateNoAbiPackage(String abi) {
    return 'Для этого релиза пока нет пакета $abi. Проверьте страницу релиза.';
  }

  @override
  String get updateNoPackage => 'Для этого релиза пока нет пакета. Проверьте страницу релиза.';

  @override
  String updateDownloadingPercent(int percent) {
    return 'Скачивание $percent%';
  }

  @override
  String get upstreamUpdatesTitle => 'Обновления dsh-go';

  @override
  String upstreamUpdatesAvailable(String version) {
    return 'В оригинале доступна $version';
  }

  @override
  String upstreamUpdatesCurrent(String base, String latest) {
    return 'Сборка на основе $base · в оригинале $latest';
  }

  @override
  String get upstreamUpdatesChecking => 'Проверка…';

  @override
  String get upstreamUpdatesFailed => 'Не удалось проверить';

  @override
  String upstreamUpdatesDialogTitle(String version) {
    return 'Оригинал dsh-go $version';
  }

  @override
  String get upstreamUpdatesDialogBody =>
      'В оригинальном приложении вышла новая версия. Установить его APK поверх этой сборки нельзя: у них разные подписи. Откройте страницу релиза, чтобы посмотреть изменения.';

  @override
  String get upstreamUpdatesOpenRelease => 'Открыть страницу релиза';

  @override
  String get upstreamUpdatesClose => 'Закрыть';

  @override
  String get upstreamUpdatesNoAnswer => 'Не удалось проверить обновления dsh-go. Попробуйте позже.';

  @override
  String get upstreamUpdatesSection => 'Оригинал dsh-go';

  @override
  String get selfUpdatesTitle => 'Обновления Narwhal';

  @override
  String selfUpdatesCurrent(String version) {
    return 'Текущая версия $version';
  }

  @override
  String get selfUpdatesChecking => 'Проверка…';

  @override
  String selfUpdatesAvailable(String version) {
    return 'Доступна $version';
  }

  @override
  String get selfUpdatesFailed => 'Не удалось проверить';

  @override
  String get selfUpdatesCheck => 'Проверить';

  @override
  String get selfUpdatesRetry => 'Повторить';

  @override
  String get selfUpdatesNoAnswer => 'Не удалось проверить обновления Narwhal. Попробуйте позже.';

  @override
  String get usageStatsTitle => 'Отправлять анонимную статистику';

  @override
  String get usageStatsSection => 'Улучшить DSH Go';

  @override
  String get usageStatsFooter =>
      'Только счётчики использования, версии и производитель телефона. Никаких чатов, файлов и аккаунтов.';

  @override
  String get usageNoticeBody => 'Никаких чатов и личных данных.\nОтключить можно в любой момент.';

  @override
  String get usageUpgradeNotice =>
      'Новое: анонимная статистика использования, чтобы улучшать DSH Go.\nНикаких чатов и личных данных.';

  @override
  String get usageUpgradeLearn => 'Подробнее';

  @override
  String get usageUpgradeOff => 'Отключить';

  @override
  String viewArtifactSaved(String value) {
    return 'Сохранено в $value';
  }

  @override
  String get viewDownloadFolder => 'Загрузки/';

  @override
  String get viewArtifactNoPreview => 'Предпросмотр недоступен';

  @override
  String get viewArtifactNotText => 'Это не текстовый файл';

  @override
  String get viewArtifactLarge => 'Большой файл';

  @override
  String get viewArtifactMissing => 'Этот файл больше недоступен';

  @override
  String get viewArtifactNotFile => 'Это не файл';

  @override
  String get viewArtifactOpenFailed => 'Не удалось открыть';

  @override
  String get viewArtifactMore => 'Ещё';

  @override
  String get viewWorkspace => 'Рабочая папка';

  @override
  String get viewArtifactEmpty => 'Файл пуст';

  @override
  String viewArtifactLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count строки',
      many: '$count строк',
      few: '$count строки',
      one: '$count строка',
    );
    return 'Большой файл. Показаны первые $_temp0';
  }

  @override
  String viewArtifactRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count строки',
      many: '$count строк',
      few: '$count строки',
      one: '$count строка',
    );
    return 'Показаны первые $_temp0';
  }

  @override
  String get viewArtifactColumns => 'Показаны первые 200 столбцов';

  @override
  String viewArtifactWorksheet(int value) {
    return 'Лист $value';
  }

  @override
  String get viewArtifactEmptySheet => 'Лист пуст';

  @override
  String get viewArtifactEmptyTable => 'Таблица пуста';

  @override
  String get viewArtifactConvertFailed => 'Не удалось преобразовать';

  @override
  String get viewArtifactConverting => 'Преобразование в PDF…';

  @override
  String get viewArtifactImageFailed => 'Не удаётся показать это изображение';

  @override
  String get viewArtifactPhoneOpen => 'Открыть в приложении на телефоне';

  @override
  String get viewArtifactPdfFailed => 'Не удаётся открыть этот PDF. Попробуйте другое приложение.';

  @override
  String viewArtifactPages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count страницы',
      many: '$count страниц',
      few: '$count страницы',
      one: '$count страница',
    );
    return '$_temp0';
  }

  @override
  String viewArtifactPage(int value) {
    return 'Страница $value';
  }

  @override
  String get viewBalanceInvalidKey => 'Неверный ключ. Не удаётся проверить баланс.';

  @override
  String get viewBalancePrefix => 'Баланс ';

  @override
  String get viewBalanceLowSuffix => ' · Мало средств';

  @override
  String get viewBalanceUnavailableSuffix => ' · Запросы недоступны';

  @override
  String get viewBalanceTopUp => 'Пополнить';

  @override
  String get viewBalanceTitle => 'Баланс DeepSeek';

  @override
  String get viewBalanceKeyRequired => 'Введите API-ключ, чтобы проверить баланс';

  @override
  String get viewBalanceKeyInvalid => 'Неверный API-ключ. Не удаётся проверить баланс.';

  @override
  String viewBalancePaid(String value) {
    return 'Оплачено $value';
  }

  @override
  String viewBalanceGranted(String value) {
    return 'Бонус $value';
  }

  @override
  String get viewBalanceLow => 'Мало средств';

  @override
  String get viewBalanceUnavailable => 'Запросы недоступны';

  @override
  String get viewBalanceChecking => 'Проверка баланса…';

  @override
  String get viewBalanceCheckFailed => 'Сейчас не удаётся проверить баланс';

  @override
  String get viewBalanceNoAlert => 'Выкл.';

  @override
  String get viewBalanceBannerHidden => 'Уведомление о балансе скрыто до перезапуска DSH Go';

  @override
  String get viewBalanceTurnOff => 'Выключить';

  @override
  String viewBalanceBelow(String value) {
    return 'Ниже $value';
  }

  @override
  String get viewBalanceAlert => 'Уведомление о низком балансе';

  @override
  String get viewBalanceThreshold => 'Порог уведомления';

  @override
  String get viewBalanceGoTopUp => 'Пополнить';

  @override
  String viewBalanceRemaining(String value) {
    return 'Осталось всего $value';
  }

  @override
  String get viewBalanceModelDisabled => 'Недостаточно средств. Модель отключена.';

  @override
  String get viewBalanceRestore => 'Пополните, чтобы продолжить';

  @override
  String get viewUiIncomplete => 'Представление ещё формируется';

  @override
  String get viewUiInvalid => 'В этом представлении ошибка форматирования';

  @override
  String get viewUiResend => 'Попросить отправить заново';

  @override
  String viewChartUnit(String value) {
    return 'Единица: $value';
  }

  @override
  String viewChartSeries(int value) {
    return 'Ряд $value';
  }

  @override
  String get viewChartTotal => 'Всего';

  @override
  String get viewChartBar => 'Столбчатая диаграмма';

  @override
  String get viewChartHorizontalBar => 'Линейчатая диаграмма';

  @override
  String get viewChartLine => 'Линейный график';

  @override
  String get viewChartDonut => 'Кольцевая диаграмма';

  @override
  String viewUiResendMessage(Object value) {
    return 'Предыдущее представление dsh-ui не удалось показать: $value. Исправьте и отправьте заново.';
  }

  @override
  String viewUiBytesLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first байта',
      many: '$first байт',
      few: '$first байта',
      one: '$first байт',
    );
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second байта',
      many: '$second байт',
      few: '$second байта',
      one: '$second байт',
    );
    return 'Представление занимает $_temp0, больше лимита $_temp1';
  }

  @override
  String get viewUiEmptyCode => 'Блок кода пуст';

  @override
  String viewUiInvalidJson(String message) {
    return 'Неверный JSON ($message)';
  }

  @override
  String get viewUiJsonRepaired => 'Комментарии и запятые в конце проигнорированы';

  @override
  String get viewUiExpectedObject => 'Ожидался объект компонента';

  @override
  String viewUiDepthLimit(int first, int second) {
    return 'Глубина $first превышает лимит $second';
  }

  @override
  String get viewUiMissingType => 'Не указан type';

  @override
  String viewUiUnknownComponent(String value) {
    return 'Неизвестный компонент $value';
  }

  @override
  String viewUiAvailableTypes(String first, String second) {
    return '$first; доступно: $second';
  }

  @override
  String viewUiExpectedChildren(int limit) {
    return 'Ожидался массив из 1–$limit компонентов';
  }

  @override
  String viewUiHiddenItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'скрыто ещё $count элемента',
      many: 'скрыто ещё $count элементов',
      few: 'скрыто ещё $count элемента',
      one: 'скрыт ещё $count элемент',
    );
    return 'Обрезано: $_temp0';
  }

  @override
  String viewUiNodeLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first компонента',
      many: '$first компонентов',
      few: '$first компонента',
      one: '$first компонент',
    );
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second элемента обрезано',
      many: '$second элементов обрезано',
      few: '$second элемента обрезано',
      one: '$second элемент обрезан',
    );
    return 'Превышен лимит: $_temp0; последние $_temp1';
  }

  @override
  String viewUiChildLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first элемента',
      many: '$first элементов',
      few: '$first элемента',
      one: '$first элемент',
    );
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second элемента обрезано',
      many: '$second элементов обрезано',
      few: '$second элемента обрезано',
      one: '$second элемент обрезан',
    );
    return 'Превышен лимит: $_temp0; последние $_temp1';
  }

  @override
  String get viewUiExpectedString => 'Ожидалась строка';

  @override
  String viewUiTextLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first символа',
      many: '$first символов',
      few: '$first символа',
      one: '$first символ',
    );
    return '$_temp0, больше лимита $second';
  }

  @override
  String get viewUiTextTruncated => 'Обрезано: текст слишком длинный';

  @override
  String get viewUiExpectedFinite => 'Ожидалось конечное число';

  @override
  String get viewUiYes => 'Да';

  @override
  String get viewUiNo => 'Нет';

  @override
  String get viewUiExpectedStringNumber => 'Ожидалась строка или число';

  @override
  String viewUiUnknownTone(String value) {
    return 'Неизвестный тон $value, пропущен; доступно: good, warn, bad';
  }

  @override
  String viewUiUnknownChart(String value) {
    return 'Неизвестная диаграмма $value, построена как столбчатая; доступно: bar, hbar, line, donut';
  }

  @override
  String get viewUiExpectedCategories => 'Ожидался непустой массив подписей';

  @override
  String viewUiCategoryLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first категории',
      many: '$first категорий',
      few: '$first категории',
      one: '$first категория',
    );
    return '$_temp0, больше лимита $second';
  }

  @override
  String viewUiFirstPoints(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$limit точки',
      many: '$limit точек',
      few: '$limit точки',
      one: '$limit точка',
    );
    return 'Показаны только первые $_temp0';
  }

  @override
  String viewUiExpectedSeries(String shape) {
    return 'Ожидался непустой массив объектов $shape';
  }

  @override
  String get viewUiSkippedSeries => 'Ожидался массив чисел; ряд пропущен';

  @override
  String viewUiValuesCategories(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first значения',
      many: '$first значений',
      few: '$first значения',
      one: '$first значение',
    );
    String _temp1 = intl.Intl.pluralLogic(
      second,
      locale: localeName,
      other: '$second категории',
      many: '$second категорий',
      few: '$second категорий',
      one: '$second категории',
    );
    return '$_temp0 для $_temp1; лишние значения отброшены, недостающие оставлены пустыми';
  }

  @override
  String viewUiNonFiniteValues(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count нечислового значения',
      many: '$count нечисловых значений',
      few: '$count нечисловых значения',
      one: '$count нечисловое значение',
    );
    return 'Пусто: $_temp0';
  }

  @override
  String get viewUiNoSeries => 'Нечего рисовать: нет рядов';

  @override
  String viewUiDonutSeries(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count лишнего ряда пропущено',
      many: '$count лишних рядов пропущено',
      few: '$count лишних ряда пропущено',
      one: '$count лишний ряд пропущен',
    );
    return 'Кольцевая диаграмма использует один ряд; $_temp0';
  }

  @override
  String get viewUiFirstSeries => 'Рисуется только первая серия';

  @override
  String viewUiSeriesLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first серии',
      many: '$first серий',
      few: '$first серии',
      one: '$first серия',
    );
    return '$_temp0, превышен лимит $second';
  }

  @override
  String viewUiFirstSeriesCount(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$limit серии',
      many: '$limit серий',
      few: '$limit серии',
      one: '$limit серия',
    );
    return 'Показано только: $_temp0';
  }

  @override
  String get viewUiNoFiniteValues => 'Нет конечных значений';

  @override
  String viewUiTruncated(String value) {
    return 'Обрезано: $value';
  }

  @override
  String viewUiExpectedCompare(int limit, String shape) {
    return 'Ожидался массив из 2–$limit объектов $shape';
  }

  @override
  String viewUiItemLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first элемента',
      many: '$first элементов',
      few: '$first элемента',
      one: '$first элемент',
    );
    return '$_temp0, превышен лимит $second';
  }

  @override
  String viewUiFirstItems(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$limit элемента',
      many: '$limit элементов',
      few: '$limit элемента',
      one: '$limit элемент',
    );
    return 'Показано только: $_temp0';
  }

  @override
  String viewUiSkippedCompare(String shape) {
    return 'Ожидался $shape; элемент пропущен';
  }

  @override
  String get viewUiSkippedItemLabel => 'Ожидалась непустая строка; элемент пропущен';

  @override
  String viewUiRowLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first строки',
      many: '$first строк',
      few: '$first строки',
      one: '$first строка',
    );
    return '$_temp0, превышен лимит $second';
  }

  @override
  String get viewUiSkippedRow => 'Ожидалось [name, value]; строка пропущена';

  @override
  String get viewUiNoItems => 'Нет элементов для отрисовки';

  @override
  String viewUiFirstRows(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$limit строки',
      many: '$limit строк',
      few: '$limit строки',
      one: '$limit строка',
    );
    return 'Показано только: $_temp0 на элемент';
  }

  @override
  String viewUiExpectedSteps(String shape) {
    return 'Ожидался непустой массив объектов $shape';
  }

  @override
  String viewUiStepLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first шага',
      many: '$first шагов',
      few: '$first шага',
      one: '$first шаг',
    );
    return '$_temp0, превышен лимит $second';
  }

  @override
  String viewUiFirstSteps(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$limit шага',
      many: '$limit шагов',
      few: '$limit шага',
      one: '$limit шаг',
    );
    return 'Обрезано: показано только $_temp0';
  }

  @override
  String viewUiSkippedStep(String shape) {
    return 'Ожидался $shape; шаг пропущен';
  }

  @override
  String viewUiUnknownStatus(String value) {
    return 'Неизвестный статус $value, отрисован как todo; доступны: done, current, todo, failed';
  }

  @override
  String get viewUiNoSteps => 'Нет шагов для отрисовки';

  @override
  String viewUiUnknownCalloutTone(String value) {
    return 'Неизвестный тон $value, отрисован как info; доступны: info, good, warn, bad';
  }

  @override
  String viewUiExpectedOptions(int limit, String shape) {
    return 'Ожидался массив из 1–$limit вариантов $shape';
  }

  @override
  String viewUiOptionLimit(int first, int second) {
    String _temp0 = intl.Intl.pluralLogic(
      first,
      locale: localeName,
      other: '$first варианта',
      many: '$first вариантов',
      few: '$first варианта',
      one: '$first вариант',
    );
    return '$_temp0, превышен лимит $second';
  }

  @override
  String viewUiFirstOptions(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: '$limit варианта',
      many: '$limit вариантов',
      few: '$limit варианта',
      one: '$limit вариант',
    );
    return 'Обрезано: показано только $_temp0';
  }

  @override
  String viewUiDuplicateLabel(String value) {
    return 'Повторяющаяся подпись $value; пропущена';
  }

  @override
  String get viewUiNoOptions => 'Нет доступных вариантов';

  @override
  String viewUiSummaryBody(String value) {
    return '[Просмотр] $value';
  }

  @override
  String viewUiSummaryTitleBody(String first, String second) {
    return '[Просмотр] $first: $second';
  }

  @override
  String get viewUiSummaryInvalid => '[Просмотр] (ошибка формата, не удалось показать)';

  @override
  String viewUiSummaryText(String value) {
    return 'Текст: $value';
  }

  @override
  String viewUiSummaryChart(String summary) {
    return 'График: $summary';
  }

  @override
  String viewUiSummaryCompare(String value) {
    return 'Сравнение: $value';
  }

  @override
  String viewUiSummarySteps(String value) {
    return 'Шаги: $value';
  }

  @override
  String viewUiSummaryCallout(String value) {
    return 'Заметка: $value';
  }

  @override
  String viewUiSummaryOptions(String value) {
    return 'Варианты: $value';
  }

  @override
  String viewUiSummaryConfirm(String first, String second) {
    return 'Подтверждение: $first/$second';
  }

  @override
  String viewUiReplyChoice(String value) {
    return 'Выбор: $value';
  }

  @override
  String viewUiReplyConfirm(String value) {
    return 'Подтверждение: $value';
  }

  @override
  String viewUiReplyCancel(String value) {
    return 'Отмена: $value';
  }

  @override
  String viewUiReplyOther(String value) {
    return 'Другое: $value';
  }

  @override
  String get viewUiFreeTextHint => 'Другое (введите свой вариант)';

  @override
  String viewUiChosenOther(String value) {
    return 'Написано: $value';
  }

  @override
  String viewUiChosen(String value) {
    return 'Выбрано: $value';
  }

  @override
  String get viewUiConfirmed => 'Подтверждено';

  @override
  String viewUiConfirmedValue(String value) {
    return 'Подтверждено: $value';
  }

  @override
  String viewUiCancelledValue(String value) {
    return 'Отменено: $value';
  }

  @override
  String get viewUiReplied => 'Отвечено';

  @override
  String get viewUiGenerating => 'Формирую представление';

  @override
  String get viewUiReplyAfterEnd => 'Выберите, когда ответ будет готов';

  @override
  String get viewUiExpired => 'Истекло';

  @override
  String get viewUiNotStarted => 'Не начато';

  @override
  String get viewUiMultiple => 'Можно выбрать несколько';

  @override
  String get viewSuggestWorkspace => 'Изучить рабочую папку';

  @override
  String get viewSuggestWorkspacePrompt => 'Посмотри, какие файлы и проекты есть в рабочей папке, и кратко расскажи.';

  @override
  String get viewSuggestWordCount => 'Посчитать слова';

  @override
  String get viewSuggestWordCountPrompt =>
      'Напиши скрипт на Python, который находит 20 самых частых слов в текстовом файле, запусти его и покажи результат.';

  @override
  String get viewSuggestNode => 'Начать с Node.js';

  @override
  String get viewSuggestNodePrompt => 'Создай в рабочей папке проект Node.js с TypeScript и минимальным юнит-тестом.';

  @override
  String get viewSuggestGit => 'Rebase или merge';

  @override
  String get viewSuggestGitPrompt =>
      'На конкретном примере объясни разницу между git rebase и git merge и когда что использовать.';

  @override
  String get viewGreetingMorning => 'Доброе утро';

  @override
  String get viewGreetingNoon => 'Добрый день';

  @override
  String get viewGreetingAfternoon => 'Добрый день';

  @override
  String get viewGreetingEvening => 'Добрый вечер';

  @override
  String get viewGreetingNight => 'Уже поздно';

  @override
  String get viewEmptySubtitle => 'Чем займёмся сегодня?';

  @override
  String get viewEmptyStarting => 'Запускаю движок…';

  @override
  String get viewEmptyConnecting => 'Подключаюсь к движку…';

  @override
  String get viewEmptyDisconnected => 'Движок не подключён';

  @override
  String get viewEmptyReconnect => 'Подключиться снова';

  @override
  String viewEmptyWorkspace(String value) {
    return 'В «$value»';
  }

  @override
  String get viewEmptySwitchWorkspace => 'Сменить рабочую папку';

  @override
  String get viewScheduleTitle => 'Автоматизации';

  @override
  String get viewScheduleRefreshFailed => 'Не удалось обновить';

  @override
  String get viewScheduleNone => 'Нет активных автоматизаций';

  @override
  String viewScheduleNext(String value) {
    return 'Далее: $value';
  }

  @override
  String get viewScheduleUntitled => 'Автоматизация без названия';

  @override
  String get viewScheduleSendFailed => 'Не удалось отправить';

  @override
  String get viewScheduleEnded => 'Завершено';

  @override
  String get viewScheduleUpcoming => 'Скоро';

  @override
  String get viewScheduleSending => 'Отправка…';

  @override
  String get viewScheduleRunNow => 'Запустить сейчас';

  @override
  String get viewScheduleManage => 'Управление';

  @override
  String viewScheduleToday(String value) {
    return 'Сегодня, $value';
  }

  @override
  String viewScheduleTomorrow(String value) {
    return 'Завтра, $value';
  }

  @override
  String viewScheduleYesterday(String value) {
    return 'Вчера, $value';
  }

  @override
  String viewScheduleWeekday(String first, String second) {
    return '$first $second';
  }

  @override
  String get viewScheduleDue => 'Пора запускать';

  @override
  String viewScheduleDaysAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count дней',
      few: '$count дня',
      one: '$count день',
    );
    return 'Через $_temp0';
  }

  @override
  String viewScheduleDaysOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count дня',
      many: '$count дней',
      few: '$count дня',
      one: '$count день',
    );
    return 'Просрочено на $_temp0';
  }

  @override
  String viewScheduleSingleLabel(String title) {
    return 'Автоматизация: $title';
  }

  @override
  String viewScheduleCountLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count автоматизации',
      many: '$count автоматизаций',
      few: '$count автоматизации',
      one: '$count автоматизация',
    );
    return '$_temp0';
  }

  @override
  String get viewModelSelect => 'Выбор модели';

  @override
  String get viewModelThinkingOff => 'Выкл.';

  @override
  String get viewModelThinkingMinimal => 'Минимум';

  @override
  String get viewModelThinkingLow => 'Низкий';

  @override
  String get viewModelThinkingMedium => 'Средний';

  @override
  String get viewModelThinkingHigh => 'Высокий';

  @override
  String get viewModelThinkingMax => 'Максимум';

  @override
  String viewModelLabel(String value) {
    return 'Модель: $value';
  }

  @override
  String viewModelEffortLabel(String value) {
    return 'Усилие рассуждений: $value';
  }

  @override
  String get viewModelLoadFailed => 'Не удалось загрузить модели';

  @override
  String get viewModelDisconnected => 'Движок не подключён';

  @override
  String get viewModelConnectHint => 'Подключитесь, чтобы выбрать модель';

  @override
  String get viewModelEffort => 'Усилие рассуждений';

  @override
  String get viewModelKeyRequired => 'Нужен API-ключ';

  @override
  String get viewModelProvidersHint => 'Поддерживаются DeepSeek и другие провайдеры моделей';

  @override
  String get viewModelEnterKey => 'Введите API-ключ';

  @override
  String get viewModelAddProvider => 'Добавить провайдера';

  @override
  String get viewModelNone => 'Нет доступных моделей';

  @override
  String get viewModelKeyHint => 'Ключ может быть неактивен или просрочен';

  @override
  String get viewModelManageProviders => 'Управление провайдерами';

  @override
  String get viewContinuePrompt => 'Продолжить чат, приложенный здесь:';

  @override
  String viewContinueRange(int first, int second, int third) {
    String _temp0 = intl.Intl.pluralLogic(
      third,
      locale: localeName,
      other: '$third раундов',
      many: '$third раундов',
      few: '$third раундов',
      one: '$third раунда',
    );
    return 'Раунды $first–$second из $_temp0';
  }

  @override
  String viewContinueHeader(String value) {
    return '> Общий чат DSH Go · $value\n';
  }

  @override
  String get viewContinueUser => '\n## Пользователь\n\n';

  @override
  String viewImageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изображения',
      many: '$count изображений',
      few: '$count изображения',
      one: '$count изображение',
    );
    return '$_temp0';
  }

  @override
  String viewContinueAttachments(String value) {
    return '\n(Вложения: $value)\n';
  }

  @override
  String get viewContinueAssistant => '\n## Ассистент\n\n';

  @override
  String get viewContinueInterrupted => '\n(Ответ прерван)\n';

  @override
  String get viewContinueFailed => '(Ошибка)';

  @override
  String get viewContinueDeclined => '(Отклонено)';

  @override
  String get viewContinueCancelled => '(Отменено)';

  @override
  String get viewLinkWeek => '7 дней';

  @override
  String get viewLinkMonth => '30 дней';

  @override
  String get viewLinkForever => 'Бессрочно';

  @override
  String get viewShareChat => 'Чат';

  @override
  String get viewShareNoPermission => 'Нет доступа к хранилищу. Не удалось сохранить.';

  @override
  String get viewShareOpenFailed => 'Не удалось открыть меню «Поделиться»';

  @override
  String get viewShareLinkFailed => 'Не удалось создать ссылку. Повторите позже.';

  @override
  String viewShareLinkText(String first, String second) {
    return '«$first» · Чат DSH Go\n$second';
  }

  @override
  String get viewShareEmpty => 'В этом чате пока нет содержимого';

  @override
  String viewShareMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сообщения',
      many: '$count сообщений',
      few: '$count сообщения',
      one: '$count сообщение',
    );
    return '$_temp0';
  }

  @override
  String viewShareToolCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count вызова инструментов',
      many: '$count вызовов инструментов',
      few: '$count вызова инструментов',
      one: '$count вызов инструмента',
    );
    return '$_temp0';
  }

  @override
  String get viewShareFileHint => 'Воспроизведение и продолжение в DSH Go';

  @override
  String get viewShareWebHint => 'Открывается в любом браузере, даже без сети';

  @override
  String get viewShareMarkdownHint => 'Простой текст, читается где угодно';

  @override
  String get viewShareLinkHint => 'Сквозное шифрование. Сервер не видит ваше содержимое.';

  @override
  String get viewSharePreview => 'Предпросмотр';

  @override
  String get viewShareWhole => 'Весь чат';

  @override
  String get viewShareScopeReply => 'Этот ответ';

  @override
  String get viewShareScopePicked => 'Выбранное';

  @override
  String get viewShareThinking => 'Рассуждения';

  @override
  String get viewShareIncludeTools => 'Вызовы инструментов';

  @override
  String get viewShareChatFile => 'Файл чата';

  @override
  String get viewShareWebPage => 'Веб-страница';

  @override
  String get viewShareLink => 'Ссылка';

  @override
  String get viewShareAsImage => 'Изображение';

  @override
  String get viewShareAsFile => 'Файл';

  @override
  String get viewShareAsText => 'Текст';

  @override
  String get viewShareRedacted => 'Секреты скрыты';

  @override
  String get viewShareAdjust => 'Изменить';

  @override
  String viewShareTooLarge(int value) {
    return 'Больше $value МБ. Выберите меньше сообщений.';
  }

  @override
  String get viewShareCreateLink => 'Создать ссылку';

  @override
  String get viewShareStop => 'Остановить доступ';

  @override
  String get viewShareStopTitle => 'Остановить доступ?';

  @override
  String get viewShareStopped => 'Доступ остановлен';

  @override
  String get viewQrCode => 'QR-код';

  @override
  String viewShareTurn(int value) {
    return 'Раунд $value';
  }

  @override
  String get viewReplayContinue => 'Продолжить чат';

  @override
  String viewReplayTurns(int first, int second) {
    return 'Раунды $first–$second';
  }

  @override
  String viewReplaySeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сек',
      many: '$count сек',
      few: '$count сек',
      one: '$count сек',
    );
    return '$_temp0';
  }

  @override
  String viewReplayMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мин',
      many: '$count мин',
      few: '$count мин',
      one: '$count мин',
    );
    return '$_temp0';
  }

  @override
  String get viewReplayFull => 'Весь чат';

  @override
  String get viewReplayPause => 'Пауза';

  @override
  String get viewReplayRestart => 'Повторить';

  @override
  String get viewReplayPlay => 'Воспроизвести';

  @override
  String viewReplaySpeed(int value) {
    return 'Скорость $value×';
  }

  @override
  String get viewTemplatePaper => 'Бумага';

  @override
  String get viewTemplateGlass => 'Стекло';

  @override
  String get viewTemplateCard => 'Карточка';

  @override
  String get viewShareProjectQr => 'QR-код проекта';

  @override
  String get viewShareBrandLine => 'DSH в вашем телефоне · Отсканируйте, чтобы получить';

  @override
  String get viewShareBrandLineNoQr => 'DSH в вашем телефоне';

  @override
  String viewShareSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count шага',
      many: '$count шагов',
      few: '$count шага',
      one: '$count шаг',
    );
    return '$_temp0';
  }

  @override
  String get viewShareWebSearch => 'Веб-поиск';

  @override
  String get viewShareOpenPage => 'Открыть веб-страницу';

  @override
  String get viewShareRunCommand => 'Выполнить команду';

  @override
  String get viewShareReadFile => 'Просмотр файла';

  @override
  String get viewShareEditFile => 'Правка файла';

  @override
  String get viewShareSubagent => 'Субагент';

  @override
  String get viewShareSkill => 'Использовать навык';

  @override
  String get viewSharePresentFiles => 'Показать файлы';

  @override
  String get viewShareWorkflow => 'Рабочий процесс';

  @override
  String get viewSharePlugin => 'Вызов плагина';

  @override
  String get viewShareStars => 'Звёзды';

  @override
  String viewSharePluginTitle(String value) {
    return 'Плагин DSH «$value»';
  }

  @override
  String viewShareInstallCommand(String value) {
    return 'Установка: dsh plugin add $value';
  }

  @override
  String viewSharePhoneInstall(String value) {
    return 'Установить на телефон: $value';
  }

  @override
  String get viewShareImages => 'Изображения';

  @override
  String get viewSharePickMessages => 'Выбрать сообщения';

  @override
  String viewShareDoneCount(int count) {
    return 'Готово ($count)';
  }

  @override
  String get viewShareImageMarker => '[Изображение]';

  @override
  String viewShareImagesMarker(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count изображения',
      many: '$count изображений',
      few: '$count изображения',
      one: '$count изображение',
    );
    return '[$_temp0]';
  }

  @override
  String get viewShareYou => 'Вы';

  @override
  String get viewShareImageFailed => 'Не удалось создать изображение. Повторите.';

  @override
  String get viewShareQuestion => 'Вопрос';

  @override
  String get viewShareModelSteps => 'Модель и шаги';

  @override
  String get viewShareImagePreview => 'Предпросмотр изображения для отправки';

  @override
  String get viewShareSaveImage => 'Сохранить изображение';

  @override
  String viewScheduleHoursAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ч',
      many: '$count ч',
      few: '$count ч',
      one: '$count ч',
    );
    return 'Через $_temp0';
  }

  @override
  String viewScheduleHoursOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ч',
      many: '$count ч',
      few: '$count ч',
      one: '$count ч',
    );
    return 'Просрочено на $_temp0';
  }

  @override
  String viewScheduleMinutesAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мин',
      many: '$count мин',
      few: '$count мин',
      one: '$count мин',
    );
    return 'Через $_temp0';
  }

  @override
  String viewScheduleMinutesOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count мин',
      many: '$count мин',
      few: '$count мин',
      one: '$count мин',
    );
    return 'Просрочено на $_temp0';
  }

  @override
  String viewScheduleSecondsAhead(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сек',
      many: '$count сек',
      few: '$count сек',
      one: '$count сек',
    );
    return 'Через $_temp0';
  }

  @override
  String viewScheduleSecondsOverdue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count сек',
      many: '$count сек',
      few: '$count сек',
      one: '$count сек',
    );
    return 'Просрочено на $_temp0';
  }

  @override
  String viewScheduleDate(String date, String clock) {
    return '$date $clock';
  }

  @override
  String viewScheduleYearDate(String year, String date, String clock) {
    return '$date, $year $clock';
  }

  @override
  String viewScheduleWeekdayName(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '1': 'Пн',
      '2': 'Вт',
      '3': 'Ср',
      '4': 'Чт',
      '5': 'Пт',
      '6': 'Сб',
      'other': 'Вс',
    });
    return '$_temp0';
  }

  @override
  String viewReplayDate(String month, int day) {
    String _temp0 = intl.Intl.selectLogic(month, {
      '1': 'янв',
      '2': 'фев',
      '3': 'мар',
      '4': 'апр',
      '5': 'мая',
      '6': 'июн',
      '7': 'июл',
      '8': 'авг',
      '9': 'сен',
      '10': 'окт',
      '11': 'ноя',
      '12': 'дек',
      'other': '$month',
    });
    return '$_temp0 $day';
  }

  @override
  String viewReplayHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ч',
      many: '$count ч',
      few: '$count ч',
      one: '$count ч',
    );
    return '$_temp0';
  }

  @override
  String viewReplayHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ч',
      many: '$hours ч',
      few: '$hours ч',
      one: '$hours ч',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes мин',
      many: '$minutes мин',
      few: '$minutes мин',
      one: '$minutes мин',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String viewUiHundredMillion(String value) {
    return '$value млрд';
  }

  @override
  String viewUiTenThousand(String value) {
    return '$value тыс.';
  }

  @override
  String viewUiMillion(String value) {
    return '$value млн';
  }

  @override
  String get viewListSeparator => ', ';

  @override
  String get viewAttachmentSeparator => ', ';

  @override
  String viewUiInvalidJsonOffset(String message, int offset) {
    return 'Неверный JSON ($message, рядом с символом $offset)';
  }

  @override
  String get viewUiUnavailableChart => 'Не удаётся показать диаграмму';

  @override
  String get viewUiUnavailableMetric => 'Не удаётся показать показатель';

  @override
  String get viewUiUnavailableCompare => 'Не удаётся показать сравнение';

  @override
  String get viewUiUnavailableSteps => 'Не удаётся показать шаги';

  @override
  String get viewUiUnavailableCallout => 'Не удаётся показать заметку';

  @override
  String get viewUiUnavailableOptions => 'Не удаётся показать варианты';

  @override
  String get viewUiUnavailableConfirm => 'Не удаётся показать подтверждение';

  @override
  String get viewUiUnavailableText => 'Не удаётся показать текст';

  @override
  String get viewUiUnavailableGroup => 'Не удаётся показать эту группу';

  @override
  String get viewUiUnavailablePart => 'Не удаётся показать этот раздел';

  @override
  String viewScheduleSingleNextLabel(String title, String when) {
    return 'Автоматизация: $title, следующая $when';
  }

  @override
  String viewScheduleCountNextLabel(int count, String when) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count автоматизации',
      many: '$count автоматизаций',
      few: '$count автоматизации',
      one: '$count автоматизация',
    );
    return '$_temp0, следующая $when';
  }

  @override
  String get viewUiSkippedStepLabel => 'Ожидалась строка; шаг пропущен';

  @override
  String viewLabeledValue(String label, String value) {
    return '$label: $value';
  }

  @override
  String viewDescribedValue(String label, String description) {
    return '$label, $description';
  }

  @override
  String get viewSemicolonSeparator => '; ';

  @override
  String viewChartSemantics(String kind, String data) {
    return '$kind. $data';
  }

  @override
  String viewMetricSemantics(String label, String value) {
    return '$label $value';
  }

  @override
  String viewMetricCaptionSemantics(String label, String value, String caption) {
    return '$label $value, $caption';
  }

  @override
  String viewScheduleZone(String rule, String city, String offset) {
    return '$rule ($city · $offset)';
  }

  @override
  String viewContinueNotice(String text) {
    return '\n($text)\n';
  }

  @override
  String viewShareAltMarker(String alt) {
    return '[$alt]';
  }

  @override
  String get viewModelThinkingXhigh => 'Сверхвысокая';

  @override
  String viewUiDialectWebOnly(String kind) {
    return '$kind · Смотреть в DSH Web';
  }

  @override
  String get viewUiDialectKindInteractive => 'Интерактивный блок';

  @override
  String get viewUiDialectKindChart => 'Диаграмма';

  @override
  String get viewUiDialectKindDiagram => 'Схема';

  @override
  String get viewUiDialectKindImage => 'Изображение';

  @override
  String get viewUiDialectKindAudio => 'Аудио';

  @override
  String get viewUiDialectKindVideo => 'Видео';

  @override
  String get viewUiDialectKindScene => '3D-сцена';

  @override
  String get viewUiDialectKindFiles => 'Дерево файлов';

  @override
  String get viewUiDialectKindMap => 'Карта';

  @override
  String get viewUiDialectKindOther => 'Этот блок';

  @override
  String get viewUiDialectInvalid => 'Этот блок показывается в DSH Web';

  @override
  String get viewUiDialectNote => 'Показывается в DSH Web';

  @override
  String get voiceSettingsTitle => 'Голосовой ввод';

  @override
  String get voiceModeAuto => 'Автоматически';

  @override
  String get voiceModeSystem => 'Системный';

  @override
  String get voiceModeEngine => 'Голосовая модель';

  @override
  String get voiceModeAutoHint => 'Использует голосовую модель, если она готова, иначе сервис телефона';

  @override
  String get voiceModeSystemHint => 'Использовать сервис распознавания, выбранный на телефоне';

  @override
  String get voiceModeEngineHint => 'Распознаёт речь голосовой моделью движка';

  @override
  String get voiceFallbackStarted => 'Переключено на голосовую модель. Повторите, пожалуйста.';

  @override
  String get voiceChooseSystem => 'Выберите сервис распознавания речи в настройках системы';

  @override
  String get voiceConfigureEngine => 'Сначала скачайте голосовую модель в настройках голоса';

  @override
  String get voiceConfigureEither => 'Сервис телефона недоступен. Скачайте голосовую модель в настройках голоса.';

  @override
  String get voiceErrorNetworkTimeout => 'Время распознавания речи истекло. Проверьте подключение.';

  @override
  String get voiceErrorNetwork => 'Распознавание речи не смогло подключиться к сети';

  @override
  String get voiceErrorAudio => 'Не удалось записать звук. Проверьте микрофон.';

  @override
  String get voiceErrorServer => 'Системный сервис речи дал сбой. Попробуйте позже.';

  @override
  String get voiceErrorClient => 'Не удалось запустить системное распознавание. Проверьте сервис речи.';

  @override
  String get voiceErrorSpeechTimeout => 'Речь не распознана. Повторите, пожалуйста.';

  @override
  String get voiceErrorNoMatch => 'Не разобрали. Попробуйте ещё раз.';

  @override
  String get voiceErrorBusy => 'Системный сервис речи занят. Попробуйте позже.';

  @override
  String get voiceErrorPermission => 'Для голосового ввода нужен доступ к микрофону';

  @override
  String get voiceErrorTooManyRequests => 'Слишком много запросов к сервису речи. Попробуйте позже.';

  @override
  String get voiceErrorDisconnected => 'Системный сервис речи отключился';

  @override
  String get voiceErrorLanguageUnsupported => 'Системное распознавание не поддерживает этот язык';

  @override
  String get voiceErrorLanguageUnavailable => 'Сначала скачайте этот язык в сервисе речи';

  @override
  String get voiceErrorSupportCheck => 'Сервис речи не может проверить поддержку распознавания';

  @override
  String get voiceErrorDownloadEvents => 'Сервис речи не может сообщать о ходе загрузки модели';

  @override
  String voiceErrorUnknown(int code) {
    return 'Ошибка сервиса речи $code. Попробуйте другой сервис распознавания.';
  }

  @override
  String get voiceSettingsFailed => 'Не удалось прочитать настройки речи. Попробуйте снова.';

  @override
  String get voiceModeSection => 'Распознавание';

  @override
  String get voiceModelSection => 'Голосовая модель';

  @override
  String get voiceModelFooter =>
      'После загрузки китайский, английский, кантонский, японский и корейский распознаются на телефоне; записи остаются на нём.';

  @override
  String get voiceModelWaiting => 'Доступно после запуска движка';

  @override
  String get voiceModelUnsupported => 'В этом движке нет голосовой модели';

  @override
  String get voiceModelAbsent => 'Не скачана';

  @override
  String get voiceModelPreparing => 'Проверка и загрузка';

  @override
  String get voiceModelReady => 'Готова';

  @override
  String get voiceModelFailed => 'Ошибка загрузки';

  @override
  String voiceModelBytes(String done, String total) {
    return '$done из $total';
  }

  @override
  String voiceModelReadyNote(String size) {
    return 'Занимает $size; работает без сети';
  }

  @override
  String voiceModelAbsentNote(String size) {
    return 'Скачать около $size';
  }

  @override
  String get voiceModelWaitingNote => 'Загрузка начнётся после запуска движка';

  @override
  String get voiceModelFailNetwork => 'Источник загрузки недоступен';

  @override
  String get voiceModelFailTimeout => 'Загрузка остановилась';

  @override
  String get voiceModelFailCertificate => 'Сбой защищённого соединения; проверьте дату на телефоне';

  @override
  String get voiceModelFailServer => 'Источник загрузки временно недоступен';

  @override
  String get voiceModelFailIntegrity => 'Файлы не прошли проверку';

  @override
  String voiceModelFailStorage(String size) {
    return 'Недостаточно места; нужно ещё около $size';
  }

  @override
  String get voiceModelFailEngine => 'Движок не ответил';

  @override
  String get voiceModelFailUnknown => 'Загрузка не завершилась';

  @override
  String get voiceModelDownload => 'Скачать';

  @override
  String get voiceModelResume => 'Продолжить';

  @override
  String get voiceModelRedownload => 'Скачать заново';

  @override
  String get voiceModelMeteredTitle => 'Скачать через мобильную сеть?';

  @override
  String voiceModelMeteredBody(String size) {
    return 'Голосовая модель занимает около $size, будет использован мобильный трафик.';
  }

  @override
  String get voiceModelDeleteTitle => 'Удалить голосовую модель?';

  @override
  String get voiceModelDeleteBody =>
      'Голосовой ввод переключится на сервис телефона. Модель можно будет скачать снова в любой момент.';

  @override
  String get voiceModelDeleteFailed => 'Не удалось удалить голосовую модель. Попробуйте снова.';

  @override
  String get voiceModelDeleteStopping => 'Загрузка ещё останавливается. Повторите удаление чуть позже.';

  @override
  String voiceModelStartedToast(String size) {
    return 'Загрузка голосовой модели · около $size';
  }

  @override
  String voiceModelResumedToast(String size) {
    return 'Продолжение загрузки голосовой модели · осталось около $size';
  }

  @override
  String get voiceModelReadyToast => 'Голосовой ввод готов';

  @override
  String voiceModelFailedToast(String reason) {
    return 'Не удалось скачать голосовую модель: $reason';
  }

  @override
  String voiceModelNoticeDownloading(int percent) {
    return 'Загрузка голосовой модели $percent%';
  }

  @override
  String get voiceModelNoticePreparing => 'Проверка голосовой модели';

  @override
  String get voiceModelNoticeFailed => 'Не удалось скачать голосовую модель. Откройте приложение, чтобы повторить.';

  @override
  String get voiceScribeReadFailed => 'Не удалось прочитать настройки голоса. Повторите.';

  @override
  String get voiceScribeSavedReadFailed => 'Сохранено. Обновите, чтобы увидеть актуальные настройки.';

  @override
  String get voiceScribeSaveUnconfirmed => 'Не удалось подтвердить сохранение. Обновите или повторите.';

  @override
  String get voiceScribeTitle => 'Настройки голоса';

  @override
  String get voiceScribePolishPrompt => 'Промпт обработки';

  @override
  String get voiceScribeLanguage => 'Язык распознавания';

  @override
  String get voiceScribeRefresh => 'Обновить';

  @override
  String get voiceScribeHostChanged => 'Подключение изменилось. Откройте заново, чтобы продолжить.';

  @override
  String get voiceScribeUnsupported => 'Настройки голоса недоступны при этом подключении.';

  @override
  String get voiceScribePluginDefault => 'По умолчанию';

  @override
  String get voiceScribeBuiltInPrompt => 'Встроенный промпт';

  @override
  String get voiceScribeProviders => 'Службы распознавания';

  @override
  String get voiceScribeKeySet => 'Ключ задан';

  @override
  String get voiceScribeNoKey => 'Нет ключа';

  @override
  String get voiceScribeHotwords => 'Горячие слова';

  @override
  String voiceScribeHotwordRules(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count правила',
      many: '$count правил',
      few: '$count правила',
      one: '$count правило',
    );
    return '$_temp0';
  }

  @override
  String get wallpaperTitle => 'Обои';

  @override
  String get wallpaperDefault => 'По умолчанию';

  @override
  String get wallpaperCustom => 'Свои';

  @override
  String get wallpaperFrame => 'Кадрировать';

  @override
  String get wallpaperBlur => 'Размытие';

  @override
  String get wallpaperLighten => 'Осветление';

  @override
  String get wallpaperDim => 'Затемнение';

  @override
  String get wallpaperReplace => 'Заменить изображение';

  @override
  String get wallpaperPreview => 'Предпросмотр';

  @override
  String get wallpaperFooter =>
      'Показываются на главном экране, в чатах и в боковой панели. Осветление действует в светлой теме, затемнение — в тёмной; текст всегда остаётся читаемым. PNG, JPEG или WebP, до 15 МБ.';

  @override
  String get wallpaperChanged => 'Обои изменены';

  @override
  String get wallpaperTooLarge => 'Изображение больше 15 МБ';

  @override
  String get wallpaperUnsupported => 'Используйте PNG, JPEG или WebP';

  @override
  String get wallpaperUnreadable => 'Не удалось прочитать это изображение';

  @override
  String get wallpaperUnavailable => 'Не удалось открыть ваши фото';

  @override
  String get wallpaperBroken => 'Не читается';

  @override
  String get wallpaperEditorHint => 'Перетаскивайте или масштабируйте';

  @override
  String get wallpaperEditorReset => 'Сбросить';

  @override
  String get wallpaperSampleTitle => 'Выходные у моря';

  @override
  String get wallpaperSampleStatus => 'Только что';

  @override
  String get wallpaperSampleQuestion => 'Суббота подходит для пляжа?';

  @override
  String get wallpaperSampleAnswer =>
      'Да. В субботу днём солнечно, лёгкий ветер и волны меньше полуметра — лучший день на этой неделе.';

  @override
  String get wallpaperSampleNote => 'Вечером быстро холодает, возьмите лёгкую куртку.';

  @override
  String get wallpaperSampleTool => 'Проверено 3 источника погоды';

  @override
  String get searchKwWallpaper => 'фон,фоновое изображение,фон чата,свой фон,задник,размытие,фото';

  @override
  String get webTitle => 'DSH Web';

  @override
  String get webSshAppOnly => 'Ссылки SSH-туннеля открываются только в приложении';

  @override
  String get webRelayUnavailable => 'DSH Web недоступен через DSH Remote. Откройте его на том компьютере.';

  @override
  String get webSshHost => 'SSH-хост';

  @override
  String get webLocalAppOnly => 'Ссылка этого телефона содержит токен запуска и открывается только в приложении';

  @override
  String get webEngineStatus => 'Состояние движка';

  @override
  String get webEngineStarting => 'Запуск движка';

  @override
  String get webEngineStartFailed => 'Не удалось запустить движок';

  @override
  String get webEngineNotRunning => 'Движок не запущен';

  @override
  String get webEngineProblem => 'В движке произошла ошибка';

  @override
  String get webStartingSoon => 'DSH Web будет готов через мгновение';

  @override
  String get webStartToOpen => 'Запустите движок этого телефона, чтобы открыть DSH Web';

  @override
  String get webRestart => 'Перезапустить';

  @override
  String get webStartEngine => 'Запустить движок';

  @override
  String get webSwitchToWeb => 'Перейти в веб';

  @override
  String get webNativeFeatures => 'Функции приложения';

  @override
  String get webSwitchToNative => 'Перейти в приложение';

  @override
  String get webAppSettings => 'Настройки приложения';

  @override
  String get webSwitchHost => 'Сменить хост';

  @override
  String get webAttachmentTooLarge => 'Вложение слишком большое для DSH Web';

  @override
  String get webTextCopied => 'Текст скопирован. Вставьте его в поле ввода.';

  @override
  String get webAttachmentFailed => 'Не удалось добавить вложения в DSH Web';

  @override
  String get webHostUnavailable => 'DSH Web недоступен на этом хосте';

  @override
  String get webChatGone => 'Этот чат исчез';

  @override
  String get webPageClosed => 'Страница закрыта';

  @override
  String get webChatsWorkspaces => 'Чаты и рабочие папки';

  @override
  String get webRefresh => 'Обновить';

  @override
  String get webOpenInBrowser => 'Открыть в браузере';

  @override
  String get webBrowserUnavailable => 'Не удаётся открыть в браузере';

  @override
  String get webReopen => 'Открыть снова';

  @override
  String get webPageNotOpened => 'Не удалось открыть страницу';

  @override
  String get webCheckConnection => 'Проверьте сеть или состояние движка и повторите';

  @override
  String get webTargetSessionMissing => 'Не удалось найти этот чат в DSH Web. Вы на главной странице.';

  @override
  String get webTargetNotLoaded => 'DSH Web ещё не загрузился';

  @override
  String get webTargetSettingsMissing => 'Не удалось найти эти настройки. Возможно, нужно войти или включить плагин.';

  @override
  String get webTargetPluginMissing => 'Не удалось найти этот плагин. Возможно, его нет в этом профиле.';

  @override
  String get webTargetSidebarFailed => 'Не удалось открыть боковую панель. Откройте этот чат в DSH Web и повторите.';

  @override
  String get webTargetCordisMissing => 'Не удалось найти панель Cordis. Возможно, плагин был удалён.';

  @override
  String get webTargetNewChatFailed => 'Не удалось начать чат. Вы на главной странице DSH Web.';

  @override
  String get webTargetPageFailed => 'Не удалось открыть эту страницу. Вы на главной странице DSH Web.';

  @override
  String webConnectHostFirst(String name) {
    return 'Подключитесь к «$name», чтобы открыть DSH Web';
  }
}
