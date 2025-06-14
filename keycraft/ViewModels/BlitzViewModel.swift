//
//  BlitzViewModel.swift
//  keycraft
//
//  Created by YI YONG LIM on 14/06/2025.
//

import SwiftUI
import Combine

@MainActor
final class GameViewModel: ObservableObject {
    // Published game state
    @Published private(set) var questions: [Question]
    @Published private(set) var current = 0
    @Published private(set) var lives = 3
    @Published private(set) var elapsed = 0           // seconds
    @Published var finished = false                   // triggers GameOverView
    
    // Internals
    private var start = Date()
    private var timerCancellable: AnyCancellable?

    // MARK: - init
    init(questions: [Question] = GameData.sample) {
        self.questions = questions
    }
    
    // MARK: - Intent(s)
    func choose(_ index: Int) {
        guard !finished else { return }
        
        let correct = questions[current].correctIndex
        if index == correct {               // ✅ right answer
            if current + 1 < questions.count {
                current += 1
            } else {
                finished = true             // all questions done
                stopTimer()
            }
        } else {                            // ❌ wrong answer
            lives -= 1
            if lives == 0 {
                finished = true
                stopTimer()
            }
        }
    }
    
    func restart() {
        current = 0
        lives = 3
        elapsed = 0
        finished = false
        start = Date()
    }
    
    // MARK: - Timer helpers
    func startTimer() {
        timerCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.elapsed = Int(Date().timeIntervalSince(self?.start ?? .now))
            }
    }
    
    func stopTimer() {
        timerCancellable?.cancel()
    }
}
