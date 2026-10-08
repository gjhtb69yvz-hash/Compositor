# Compositor 中英文社区版

中文本地化与双语界面贡献：**Baoju**。基于 Robbie Tilton 的 Compositor，保留原始 MIT 许可证和版权声明。

**[下载中英文版安装包](https://github.com/gjhtb69yvz-hash/Compositor/releases/tag/v1.4.7-baoju.1)** · [中文工具索引](docs/zh-CN-index.md) · [完整中英文术语表](docs/zh-CN-terms.md) · [English / 原项目说明](README.en.md)

## 中文导航

| 想做什么 | 入口 |
| --- | --- |
| 安装使用 | [发行版下载与安装说明](https://github.com/gjhtb69yvz-hash/Compositor/releases/tag/v1.4.7-baoju.1) |
| 查找工具、菜单和参数 | [中文功能索引](docs/zh-CN-index.md) |
| 按中文或英文查词 | [中英文术语对照](docs/zh-CN-terms.md)，浏览器内按 Command-F 搜索 |
| 获取中文语言文件 | 发行版中的 `Compositor-Baoju-中文语言文件.zip` |
| 获取对应安装包的源码 | 发行版中的 `Compositor-1.4.7-Baoju-双语源码.zip` |
| 查看汉化贡献范围 | [本地化说明](docs/chinese-localization.md) |
| 查看原作者接收进展 | [上游草稿 PR #234](https://github.com/robbietilton/Compositor/pull/234) |

## 安装

需要 **Apple silicon（M 系列）Mac、macOS 26.0 或以上**。下载 `Compositor-1.4.7-Baoju-macOS-arm64.zip`，解压后将 **Compositor 中英文版.app** 拖入“应用程序”。编辑器右上角提供 **中文 / English** 即时切换并保存选择。

这是 **Baoju 社区预览版**，并非原作者官方发行版。应用为临时签名，未通过 Apple Developer ID 公证；系统可能阻止首次打开。请核对来源及附件校验值，按 macOS 安全提示自行决定是否允许，无需关闭整体安全保护。

## 功能与验证

汉化覆盖选区、绘画修图、图层、滤镜、Camera Raw、工具参数、菜单和提示。系统文件窗口和服务跟随 macOS 语言，部分动态文本与辅助功能标签仍可能需补充。

已在 macOS 26.3.1 / Apple silicon 手动验证语言切换、套索、画笔、渐变、Multiply 混合模式、滤镜菜单、Camera Raw、项目保存重开及署名。完整 Xcode 自动测试未完成。

## 源码与更新

仓库源码保留上游 Sparkle 集成，供贡献审查。本地安装包使用命令行打包并停用原版自动更新；**与安装包对应的是发行附件“双语源码.zip”**。仓库自动生成的 Source code 压缩包与本地打包源码存在此差别。

## 致谢与许可

- 中文本地化与双语界面贡献：**Baoju**。
- 原作者：Robbie Tilton / Wonder Assembly LLC。
- [原项目](https://github.com/robbietilton/Compositor) · [MIT 许可证](LICENSE)。
