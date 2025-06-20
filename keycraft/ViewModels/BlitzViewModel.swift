import SwiftUI
import Combine

@MainActor
final class BlitzViewModel: ObservableObject {
    @Published private(set) var ticker = 0
    @Published private(set) var lives = 3
    @Published private(set) var time_elapsed = 0
    @Published var finished = false
    private var shortcutsVM: ShortcutsViewModel

    init(shortcutsVM: ShortcutsViewModel) {
        self.shortcutsVM = shortcutsVM
    }
    
    func shuffledAnswers(for shortcut: Shortcut) -> [String] {
        var distractors = shortcutsVM.shortcuts
            .filter { $0.content != shortcut.content }
            .map   { $0.content }
        distractors.shuffle()
        let wrong_choices = Array(distractors.prefix(3))
        var choices = wrong_choices + [shortcut.content]
        choices.shuffle()
        return choices
    }


    func chooseAnswer(_ selected: String, correct: String) {
        if selected == correct {
            ticker += 1
            if ticker >= shortcutsVM.shortcuts.count {
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
        ticker = 0
        lives = 3
        time_elapsed = 0
        finished = false
    }
}
