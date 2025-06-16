import Foundation

struct Shortcut: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var content: String
    var date: Date
}
