//
//  Note.swift
//  keycraft
//
//  Created by YI YONG LIM on 10/06/2025.
//

import Foundation

struct Note: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var content: String
    var date: Date
}
