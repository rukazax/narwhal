# 品牌与素材

本仓库是 [DSH Go](https://github.com/ccch1mneyyy/dsh-go) 的修改版（fork），代码以 AGPL-3.0 发布（见 [LICENSE](LICENSE) 与 [NOTICE](NOTICE)）。

## 上游的品牌与吉祥物不在本仓库

上游 DSH Go / DSH-TUI 的品牌标识、Deepy 小鲸鱼、鲸娘、鲸鱼尾巴动效、首页和 README 展示图都归 ccch1mneyyy（DSH-TUI）所有，**保留所有权利，不在 AGPL-3.0 授权范围内**。上游允许为构建、测试和运行其仓库而使用它们，但以修改版身份再发布时必须换成自己的名称和素材。本 fork 的做法是直接删除，不随源码分发：

| 上游素材 | 上游位置 | 在本 fork |
|---|---|---|
| Deepy 小鲸鱼（像素桌宠） | `app/assets/pets/deepy-whale/`、源文件 `app/tool/pet_src/deepy-whale/` | 已删除 |
| 鲸娘（像素桌宠） | `app/assets/pets/whale-girl/`、源文件 `app/tool/pet_src/whale-girl/` | 已删除 |
| 求 Star 弹窗的鲸娘贴纸 | `app/assets/star/star_whale.webp` | 已删除；弹窗改画应用自己的星形图标 |
| 鲸鱼尾巴运行指示器与聊天页空状态的静止鲸尾 | `app/assets/whale/`、源文件 `app/tool/whale_src/` | 已删除；`WhaleSprites.shipped` 为 `false`，指示器不绘制、也不占位 |
| go.dshtui.com 首页（作者交付、未附许可证） | `site/home/` | 已删除 |
| README 首图、功能展示图、桌宠动图、社交预览、社群二维码 | `docs/assets/` | 已删除 |
| 分享页的上游品牌 favicon 与 apple-touch-icon | `site/share/favicon.svg`、`site/share/apple-touch-icon.png` | 已替换为本 fork 自己画的通用分享图标（没有吉祥物或品牌字样） |

被删素材的说明在 `THIRD_PARTY_NOTICES.md` 里也不再列出；该文件只列本仓库仍然收录的第三方内容。

## 本仓库保留的素材

| 素材 | 位置 | 来源与许可 |
|---|---|---|
| 应用标识（Narwhal）与由它生成的启动图标、`brand_glyph.g.dart` | `app/lib/ui/shell/brand_glyph.g.dart`（生成）、`app/lib/ui/settings/appearance/launcher_narwhal.dart`、`app/android/app/src/main/res/mipmap-*/`、`drawable/ic_launcher_*`；生成器 `app/tool/make_narwhal_mark.py` | 本 fork 自己的 Narwhal 图形，不取自上游的吉祥物或品牌素材；随本仓库按 AGPL-3.0 处理。应用名称与图形标识的商标可用性由发布方确认 |
| 玻璃质感功能图块 | `app/assets/tiles/glassy/`（打包）与 `app/assets/tiles/{duotone,geometric}/`（矢量母版，不打包） | 本仓库自己绘制，AGPL-3.0；由 `app/tool/make_feature_tiles.py` 生成 |
| 界面图标字体 | `app/assets/fonts/DshIcons.ttf`、`app/lib/ui/theme/dsh_glyphs.dart` | 由 Phosphor Icons（MIT）生成，见 `THIRD_PARTY_NOTICES.md` |
| 代码字体 | `app/assets/fonts/JetBrainsMono-*.ttf`、`OFL.txt` | SIL OFL 1.1 |
| 社区页内容 | `app/assets/community/community.json` | 本仓库自己的文案，AGPL-3.0 |
| 分享页图标（通用分享图形，无吉祥物与品牌字样） | `site/share/favicon.svg`、`site/share/apple-touch-icon.png` | 本 fork 自己绘制，AGPL-3.0 |
| 内置用户指南与插件技能 | `app/assets/skills/` | 本仓库自己的文档，AGPL-3.0 |
| WebRTC 许可汇编 | `app/assets/licenses/webrtc-150.7871.04.md` | 上游发布的许可文本，随包收录 |

`app/assets/brand/` 里还剩一套早期的 SVG 母版（`glyph-*.svg`、`tile.svg`），画的是 DeepSeek 的企业鲸鱼标志，已不再用于生成 `brand_glyph.g.dart`，也不随 App 打包。它们不属于本 fork 的素材，发布前应删除或换成自己的母版（本 fork 的 Narwhal 不受影响：标识与图标已由 `app/tool/make_narwhal_mark.py` 生成）。

`app/tool/` 下的脚本（`make_narwhal_mark.py`、`make_brand_mark.py`、`make_icon_font.py`、`make_feature_tiles.py`、`make_pet_pack.py`、`make_whale_sprites.py` 等）与其他源码一样以 AGPL-3.0 发布。`make_pet_pack.py` 和 `make_whale_sprites.py` 只做格式转换/拼图，本身不含任何美术；它们引用的上游源图（`tool/pet_src/`、`tool/whale_src/`）不在本仓库，需要时请自备素材并把 `WhaleSprites.shipped` 打开。

## 桌宠功能的状态

包的解析、渲染、浮层和设置都保留，但本 fork **不随包分发任何宠物包**：`app/lib/pets/pet_prefs.dart` 的 `builtInPets` 为空、默认值是「不显示」，所以设置 › 宠物 只显示「不显示」这一个格子，聊天页不画宠物、也不报错。要加自己的宠物，把 pack.json 与序列帧放进 `app/assets/pets/<id>/`，再把 `<id>` 写进 `builtInPets`（格式见 `docs/design/pets.md` 第 3 节）。

## 第三方

第三方代码、字体、图标和运行时组件见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)；修改记录见 [NOTICE](NOTICE)。
