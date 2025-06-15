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
    @Published private(set) var questions: [Question]
    @Published private(set) var current = 0
    @Published private(set) var lives = 3
    @Published private(set) var elapsed = 0
    @Published var finished = false
    
    private var start = Date()
    private var timerCancellable: AnyCancellable?

    init(questions: [Question] = GameData.sample) {
        self.questions = questions
    }
    
    func choose(_ index: Int) {
        guard !finished else { return }
        
        let correct = questions[current].correctIndex
        if index == correct {
            if current + 1 < questions.count {
                current += 1
            } else {
                finished = true
                stopTimer()
            }
        } else {
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
    }
    
    func startTimer() {
        start = Date()  // 👈 Set the start time when timer begins
        elapsed = 0     // Optional: reset displayed timer

        timerCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.elapsed = Int(Date().timeIntervalSince(self?.start ?? Date()))
            }
    }
    
    func stopTimer() {
        timerCancellable?.cancel()
    }
}
