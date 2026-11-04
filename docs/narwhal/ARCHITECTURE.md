# Narwhal — архитектура и границы доверия

> Короткий инженерный обзор для тех, кто читает код или собирает fork. Схемы — в [README.md](../../README.md#как-это-работает) и [README.md → проверка обновлений](../../README.md#проверка-обновлений-оригинала).

## Слои

| Слой | Где | За что отвечает |
| --- | --- | --- |
| Flutter UI | `app/lib/` | Экраны, Riverpod-состояние, темы, три языка (`app/lib/l10n/parts/*_{ru,en,zh}.arb`). |
| Dart-клиент | `packages/dsh_client/`, `packages/dsh_remote/` | HTTP/SSE и мультиплексирование к движку; WebRTC/LAN/TURN/relay для DSH Remote. |
| Android/Kotlin | `app/android/` | Установка и распаковка рантайма, процесс PRoot, foreground-сервис, уведомления, оверлей, служба доступности, файловые и медиаплагины. |
| Рантайм | `runtime/` | Ubuntu 24.04 base, Node.js 24, `@deepseek-ai/dsh`; версии закреплены в `runtime/build-runtime.sh`, патчи — в `runtime/patches/` с `pins.json`. |
| Мост | `runtime/bridge/dsh-go-bridge/` | `/dsh-go/v1/*`: нативные карточки и панели плагинов, удаление сессий. |
| Удалённые хосты | `packages/dsh_remote/`, `app/lib/remote/` | SSH и DSH Remote; доверие к хосту проверяется по отпечатку. |

## Локальный запуск

1. APK распаковывает архив рантайма в приватную папку приложения, сверяет manifest и только потом запускает окружение.
2. Внутри PRoot стартует `dsh web --host 127.0.0.1 --port 3080 --no-open`; токен запуска движок печатает в stdout.
3. `dsh_client` меняет токен на cookie. Дальше HTTP и WebSocket идут с cookie; токен не остаётся в URL.
4. Веб-режим — запасной путь: WebView один раз открывает локальный адрес с токеном.
5. Логи движка идут в приложение через EventChannel с монотонным `seq`; строки уже отредактированы на стороне рантайма.

Порт `3080` слушает только loopback: снаружи телефона движок недоступен, и обращается к нему только само приложение.

## Удалённый хост

- **SSH.** Пароль или приватный ключ остаются на телефоне; при первом подключении приложение показывает отпечаток ключа хоста и просит подтвердить доверие.
- **DSH Remote.** Соединение шифруется end-to-end; маршрут выбирается как LAN/P2P → TURN → Relay, фактический путь виден в карточке подключения. Хост проверяется по отпечатку личности.
- Чаты, рабочие папки и плагины принадлежат хосту, а не телефону. При переключении хоста меняется и состояние интерфейса.
- Ограничения DSH Remote: только изображения во вложениях, веб-режим не открывается, плагины — только включение и выключение, DS Bot и экспорт журнала чата недоступны.

## Проверка обновлений

- Сборка хранит версию оригинала, с которой сделана (`UPSTREAM_BASE_VERSION`, сейчас `1.0.9`), и запрашивает `api.github.com/repos/ccch1mneyyy/dsh-Go/releases/latest`.
- Результат — строка в «О приложении» и переход на страницу релиза. APK не скачивается и не устанавливается: у оригинала другая подпись, установка поверх этой сборки всё равно невозможна.
- Поэтому fork-сборки собираются с `DSH_SELF_UPDATE=false`: встроенный апдейтер оригинала в них выключен, вместо него работает отчёт. Собственный канал обновлений Narwhal этим механизмом не затрагивается.
- Сетевой запрос один, анонимный, с лимитом GitHub 60 запросов в час на IP. Схема — в [README.md](../../README.md#проверка-обновлений-оригинала).

### Обновления Narwhal

- Своя строка в «О приложении» запрашивает `api.github.com/repos/rukazax/narwhal/releases/latest` не чаще раза в неделю и только пока приложение открыто.
- Найденный релиз — это версия, размер APK и две кнопки: «Обновить» и «Страница релиза».
- «Обновить» сначала показывает, что произойдёт. После подтверждения APK скачивается в кэш, сверяется с SHA-256 из поля `digest` (несовпадение — отказ и удаление файла) и передаётся системному установщику через FileProvider `content://` с `ACTION_VIEW`. Разрешение «установка неизвестных приложений» приложение само не включает: оно открывает системную страницу для Narwhal.
- Автоматическая недельная проверка ничего не скачивает: она только помечает доступную версию. Установка всегда начинается с нажатия и подтверждения.

## Приватность

- **Трекеров нет.** В зависимостях приложения нет рекламных и аналитических SDK; сеть — движок, выбранный провайдер моделей и проверка релизов.
- **Анонимная статистика.** Включена по умолчанию, раскрывается на первом запуске и выключается одним переключателем. Состав: версии приложения и Android, архитектура, производитель телефона (не модель), язык, способ запуска движка, суточные счётчики действий. Случайный ID меняется каждые 90 дней; при выключении ID и локальные счётчики удаляются.
- **Журналы чатов.** Отдельный переключатель (`session-log-deepseek`) и только на хостах, где движок это поддерживает; к анонимной статистике отношения не имеет.
- **Телеметрия движка.** OpenTelemetry используется только для обратной связи — событий отзывов, без текста переписки.
- **Секреты.** Ключи и токены не логируются и не попадают в шаринг: маскирование применяется к журналам, карточкам и экспорту. SSH-ключи и пароли хранятся на телефоне.
- **Ссылки.** Шаринг шифруется end-to-end, ключ лежит в ссылке; кто получил ссылку, тот читает содержимое. Локальный веб-интерфейс принимает только обращения приложения.

## Ограничения

- Сборка рассчитана на сайдлоад (`targetSdk 28`, не конфигурация для Google Play).
- Управление телефоном работает только с локальным движком и не загружается в безопасном режиме.
- Наборы-питомцы не входят в сборку; механика и настройки при этом на месте.

---

# Narwhal — architecture and trust boundaries

> A short engineering overview for people reading the code or building the fork. Diagrams live in [README.en.md](../../README.en.md#how-it-works) and [README.en.md → update check](../../README.en.md#upstream-update-check).

## Layers

| Layer | Where | Responsibility |
| --- | --- | --- |
| Flutter UI | `app/lib/` | Screens, Riverpod state, themes, three languages (`app/lib/l10n/parts/*_{ru,en,zh}.arb`). |
| Dart client | `packages/dsh_client/`, `packages/dsh_remote/` | HTTP/SSE and multiplexing to the engine; WebRTC/LAN/TURN/relay for DSH Remote. |
| Android/Kotlin | `app/android/` | Runtime install and unpack, PRoot process, foreground service, notifications, overlay, accessibility service, file and media plugins. |
| Runtime | `runtime/` | Ubuntu 24.04 base, Node.js 24, `@deepseek-ai/dsh`; versions pinned in `runtime/build-runtime.sh`, patches in `runtime/patches/` with `pins.json`. |
| Bridge | `runtime/bridge/dsh-go-bridge/` | `/dsh-go/v1/*`: native plugin cards and panels, session deletion. |
| Remote hosts | `packages/dsh_remote/`, `app/lib/remote/` | SSH and DSH Remote; host trust is checked against a fingerprint. |

## Local start

1. The APK unpacks the runtime archive into app-private storage, verifies the manifest, and only then starts the environment.
2. Inside PRoot it runs `dsh web --host 127.0.0.1 --port 3080 --no-open`; the engine prints its launch token to stdout.
3. `dsh_client` exchanges the token for a cookie. HTTP and WebSocket traffic then carries the cookie; the token does not stay in URLs.
4. Web mode is the fallback: a WebView opens the local address with the token once.
5. Engine logs reach the app over an EventChannel with a monotonic `seq`; lines are already redacted on the runtime side.

Port `3080` is bound to loopback only: the engine is not reachable from outside the phone, and only the app itself talks to it.

## Remote host

- **SSH.** The password or private key stays on the phone; on first connection the app shows the host key fingerprint and asks you to confirm trust.
- **DSH Remote.** The connection is end-to-end encrypted; the route is chosen as LAN/P2P → TURN → Relay, and the actual path is shown on the connection card. The host is verified by its identity fingerprint.
- Chats, workspaces and plugins belong to the host, not the phone. Switching hosts switches the interface state with them.
- DSH Remote limits: images only as attachments, no web mode, plugins can only be toggled, DS Bot and chat log export are unavailable.

## Update check

- The build stores the upstream version it was based on (`UPSTREAM_BASE_VERSION`, currently `1.0.9`) and requests `api.github.com/repos/ccch1mneyyy/dsh-Go/releases/latest`.
- The result is a row in About and a link to the release page. No APK is downloaded or installed: upstream is signed with another key, so installing it over this build could not work anyway.
- Fork builds therefore use `DSH_SELF_UPDATE=false`: the original's in-app updater is off and the report replaces it. Narwhal's own update channel is not part of this mechanism.
- One anonymous network request, subject to GitHub's limit of 60 requests per hour per IP. Diagram: [README.en.md](../../README.en.md#upstream-update-check).

### Narwhal updates

- The fork's own row in About requests `api.github.com/repos/rukazax/narwhal/releases/latest` at most once a week, and only while the app is open.
- A release found this way is a version, the APK's size and two keys: "Update" and "Release page".
- "Update" first says what will happen. After the confirmation the APK is downloaded into the cache, checked against the `digest` field's SHA-256 (a mismatch is refused and the file deleted) and handed to the system installer through a FileProvider `content://` URI with `ACTION_VIEW`. The app never turns "install unknown apps" on itself: it opens the system page for Narwhal.
- The weekly automatic check downloads nothing: it only marks the available version. Installing always starts with a tap and a confirmation.

## Privacy

- **No trackers.** No ad or analytics SDKs in the app's dependencies; the network is the engine, the model provider you chose, and release checks.
- **Anonymous stats.** On by default, disclosed on first launch and turned off with one switch. It sends app and Android versions, CPU architecture, phone maker (not model), language, engine start mode, and daily action counts. A random ID rotates every 90 days; turning the switch off deletes the ID and local counters.
- **Chat logs.** A separate switch (`session-log-deepseek`), shown only where the host supports it; unrelated to anonymous stats.
- **Engine telemetry.** OpenTelemetry is feedback-only: review events, without the text of conversations.
- **Secrets.** Keys and tokens are not logged and do not reach shares: masking applies to logs, cards and exports. SSH keys and passwords stay on the phone.
- **Links.** Sharing is end-to-end encrypted with the key in the link; anyone who has the link can read the content. The local web interface accepts the app's own requests only.

## Limits

- The build targets sideloading (`targetSdk 28`, not a Google Play configuration).
- Phone control works with the local engine only and is not loaded in Safe mode.
- Mascot packs are not bundled; the mechanics and settings are still there.
