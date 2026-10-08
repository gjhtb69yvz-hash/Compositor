# Chinese localization / 中文本地化

**Chinese localization and bilingual interface contribution: Baoju.**

**中文本地化与双语界面贡献：Baoju。**

Based on Compositor 1.4.7 by Robbie Tilton / Wonder Assembly LLC.
The original MIT license and copyright are retained.

## Scope

- A persistent 中文 / English segmented switch in the editor.
- Translations for tools, parameters, pickers, filters, layer controls, Camera Raw, help text and application commands.
- Native blend-mode choices retain English model identifiers using representedObject; translated labels do not change the .comp format.
- Translation dictionary: `Compositor/Resources/ChineseInterface.json`.
- Runtime and switch: `Compositor/UI/InterfaceLanguage.swift`.

## Validation

A local arm64 build was compiled with Swift 6.2.4 command-line tools on macOS 26.3.1. The development build used a local packaging adaptation without Sparkle; this proposed upstream contribution retains the original Sparkle integration.

Manually checked Chinese/English switching, Lasso labels, brush drawing, gradient choices, blend-mode selection (Multiply), filter menus, Camera Raw controls, project save/reopen and attribution in About.

Full Xcode build and CompositorTests were not run because full Xcode was not installed. This is submitted as a draft for maintainer review and CI, not a claim that every dialog or error path has been tested. macOS-owned file panels and Services follow the system language. Font names, file names, project names and serialized model identifiers are not translation targets. Some dynamically composed strings and AppKit accessibility labels may need a further pass.

## Building

Use the existing Compositor Xcode project and build instructions. The synchronized Compositor source folder includes the translation resources. No private project files, personal settings, local application binaries, signing keys or accounts are included.

The separately built local community application is ad-hoc signed and is not an official notarized upstream release.
