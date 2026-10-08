import SwiftUI
import Observation

@Observable
final class InterfaceLanguage {
    static let shared = InterfaceLanguage()
    var code: String = UserDefaults.standard.string(forKey: "compositorInterfaceLanguage") ?? "zh-Hans" {
        didSet {
            UserDefaults.standard.set(code, forKey: "compositorInterfaceLanguage")
            DispatchQueue.main.async { Self.updateSystemMenus() }
        }
    }
    static let translations: [String: String] = {
        guard let url = Bundle.main.url(forResource: "ChineseInterface", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let result = try? JSONDecoder().decode([String: String].self, from: data) else { return [:] }
        return result
    }()
    static func updateSystemMenus() {
        let pairs = ["File": "文件", "Edit": "编辑", "View": "显示", "Window": "窗口", "Help": "帮助"]
        guard let menu = NSApp.mainMenu else { return }
        func update(_ menu: NSMenu) {
            for item in menu.items {
                if let english = translations.first(where: { $0.value == item.title })?.key {
                    item.title = shared.code == "en" ? english : item.title
                } else if shared.code != "en", let chinese = translations[item.title] {
                    item.title = chinese
                }
                for (en, zh) in pairs where item.title == en || item.title == zh {
                    item.title = shared.code == "en" ? en : zh
                }
                if let submenu = item.submenu { update(submenu) }
            }
        }
        update(menu)
    }
}

/// Translate UI strings only. Model identifiers and the .comp format remain unchanged.
func L(_ value: String) -> String {
    guard InterfaceLanguage.shared.code != "en" else { return value }
    let table = InterfaceLanguage.translations
    if let translated = table[value] { return translated }
    // Tool status lines are assembled from independently reusable phrases.
    if value.contains(" · ") {
        return value.components(separatedBy: " · ").map { table[$0] ?? $0 }.joined(separator: " · ")
    }
    for prefix in ["Undo ", "Redo ", "Add ", "Edit ", "Copy ", "Remove ", "Hide ", "Show ", "Select image: ", "Select text: ", "Select mask: ", "Link mask: ", "Unlink mask: "] where value.hasPrefix(prefix) {
        let rest = String(value.dropFirst(prefix.count))
        return (table[String(prefix.dropLast())] ?? String(prefix.dropLast())) + " " + (table[rest] ?? rest)
    }
    return value
}

struct InterfaceLanguagePicker: View {
    @Bindable private var language = InterfaceLanguage.shared
    var body: some View {
        HStack(spacing: 8) {
            Text("语言 / Language").font(.caption).foregroundStyle(.secondary)
            Picker("语言 / Language", selection: $language.code) {
                Text("中文").tag("zh-Hans")
                Text("English").tag("en")
            }
            .pickerStyle(.segmented).labelsHidden().frame(width: 160)
            .accessibilityIdentifier("interfaceLanguagePicker")
        }
    }
}
