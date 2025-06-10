//
//  NotesView.swift
//  keycraft
//
//  Created by YI YONG LIM on 10/06/2025.
//

import SwiftUI

struct NotesView: View {
    @EnvironmentObject var notesVM: NotesViewModel
    @State private var editingNote: Note? = nil

    var body: some View {
        NavigationView {
            List {
                ForEach(notesVM.notes) { note in
                    Button(action: {
                        editingNote = note
                    }) {
                        VStack(alignment: .leading) {
                            Text(note.title).font(.headline)
                            Text(note.content).font(.subheadline).lineLimit(2)
                            Text(note.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .onDelete(perform: notesVM.deleteNote)
            }
            .navigationBarTitle("My Notes")
            .sheet(item: $editingNote) { note in
                EditNoteView(note: note)
            }
        }
    }
}
