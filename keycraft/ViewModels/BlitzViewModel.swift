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
        // 1️⃣  Build a pool of *wrong* answers only
        var distractors = shortcutsVM.shortcuts
            .filter { $0.content != shortcut.content }
            .map   { $0.content }
        distractors.shuffle()

        // 2️⃣  Pick up to 3 wrong answers
        let wrong = Array(distractors.prefix(3))

        // 3️⃣  Combine with the correct answer
        var choices = wrong + [shortcut.content]

        // 4️⃣  Shuffle the final 4 so the correct answer’s position is random
        choices.shuffle()
        return choices
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
