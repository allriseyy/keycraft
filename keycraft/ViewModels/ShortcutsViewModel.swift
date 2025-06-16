import Foundation

class ShortcutsViewModel: ObservableObject {
    @Published var shortcuts: [Shortcut] = [] {
        didSet {
            saveShortcuts()
        }
    }
    
    let shortcutsKey = "shortcuts_data"
    
    init() {
        loadShortcuts()
    }
    
    func addShortcut(title: String, content: String) {
        let newShortcut = Shortcut(id: UUID(), title: title, content: content, date: Date())
        shortcuts.insert(newShortcut, at: 0)
    }
    
    func updateShortcut(shortcut: Shortcut, title: String, content: String) {
        if let index = shortcuts.firstIndex(of: shortcut) {
            shortcuts[index].title = title
            shortcuts[index].content = content
            shortcuts[index].date = Date()
        }
    }
    
    func deleteShortcut(at offsets: IndexSet) {
        shortcuts.remove(atOffsets: offsets)
    }
    
    func saveShortcuts() {
        if let encoded = try? JSONEncoder().encode(shortcuts) {
            UserDefaults.standard.set(encoded, forKey: shortcutsKey)
        }
    }
    
    func loadShortcuts() {
        if let data = UserDefaults.standard.data(forKey: shortcutsKey),
           let decoded = try? JSONDecoder().decode([Shortcut].self, from: data) {
            shortcuts = decoded
        }
        
    }
}

