//
//  EditNoteView.swift
//  keycraft
//
//  Created by YI YONG LIM on 10/06/2025.
//

import SwiftUI

struct EditNoteView: View {
    @EnvironmentObject var notesVM: NotesViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var note: Note
    @State private var title: String
    @State private var content: String

    init(note: Note) {
        self.note = note
        _title = State(initialValue: note.title)
        _content = State(initialValue: note.content)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Note Title", text: $title)
                }
                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(height: 200)
                }
            }
            .navigationBarTitle("Edit", displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Save") {
                    notesVM.updateNote(note: note, title: title, content: content)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

