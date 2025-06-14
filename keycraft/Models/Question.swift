//
//  Question.swift
//  keycraft
//
//  Created by YI YONG LIM on 14/06/2025.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let answers: [String]      // MUST contain 4 strings
    let correctIndex: Int      // 0-3
}

struct GameData {
    /// Hard-coded bank (replace with JSON or API if you like)
    static let sample: [Question] = [
        Question(text: "The capital of the UK is …",
                 answers: ["London", "Paris", "Berlin", "Madrid"],
                 correctIndex: 0),
        Question(text: "Which planet is called the Red Planet?",
                 answers: ["Earth", "Mars", "Venus", "Jupiter"],
                 correctIndex: 1),
        Question(text: "What does H₂O stand for?",
                 answers: ["Oxygen", "Salt", "Water", "Hydrogen"],
                 correctIndex: 2),
        Question(text: "Who painted the Mona Lisa?",
                 answers: ["Van Gogh", "Picasso", "Da Vinci", "Rembrandt"],
                 correctIndex: 2),
        Question(text: "How many continents are there?",
                 answers: ["5", "6", "7", "8"],
                 correctIndex: 2)
    ]
}

