import SwiftUI
import Combine

@MainActor
final class BlitzViewModel: ObservableObject {
    @Published private(set) var current = 0
    @Published private(set) var lives = 3
    @Published private(set) var elapsed = 0
    @Published var finished = false
    
    private var start = Date()
    private var timerCancellable: AnyCancellable?
    private var shortcutsVM: ShortcutsViewModel

    init(shortcutsVM: ShortcutsViewModel) {
        self.shortcutsVM = shortcutsVM
    }
    
    func shuffledAnswers(for shortcut: Shortcut) -> [String] {
            var options = shortcutsVM.shortcuts.map { $0.content }
            options.shuffle()
            if !options.contains(shortcut.content) {
                options[0] = shortcut.content
                options.shuffle()
            }
            return Array(options.prefix(4))
        }

    func chooseAnswer(_ selected: String, correct: String) {
            if selected == correct {
                current += 1
                if current >= shortcutsVM.shortcuts.count {
                    finished = true
                }
            } else {
                lives -= 1
                if lives <= 0 {
                    finished = true
                }
            }
        }
    
    func restart() {
        current = 0
        lives = 3
        elapsed = 0
        finished = false
    }
}
