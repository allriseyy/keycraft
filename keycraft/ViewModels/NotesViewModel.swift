//
//  NotesViewModel.swift
//  keycraft
//
//  Created by YI YONG LIM on 10/06/2025.
//

import Foundation

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = [] {
        didSet {
            saveNotes()
        }
    }
    
    let notesKey = "notes_data"
    
    init() {
        loadNotes()
    }
    
    func addNote(title: String, content: String) {
        let newNote = Note(id: UUID(), title: title, content: content, date: Date())
        notes.insert(newNote, at: 0)
    }
    
    func updateNote(note: Note, title: String, content: String) {
        if let index = notes.firstIndex(of: note) {
            notes[index].title = title
            notes[index].content = content
            notes[index].date = Date()
        }
    }
    
    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    
    // Persistence
    func saveNotes() {
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encoded, forKey: notesKey)
        }
    }
    
    func loadNotes() {
        if let data = UserDefaults.standard.data(forKey: notesKey),
           let decoded = try? JSONDecoder().decode([Note].self, from: data) {
            notes = decoded
        }
    }
}

