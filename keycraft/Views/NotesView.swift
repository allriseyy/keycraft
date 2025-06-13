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
    @State private var showingAddNote = false

    var body: some View {
        NavigationView {
            VStack {
                // Custom Title Row
                HStack {
                    Text("My Notes")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button(action: {
                        showingAddNote = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
                .padding([.top, .horizontal])

                // Notes List
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
            }
            .sheet(item: $editingNote) { note in
                EditNoteView(note: note)
            }
            .sheet(isPresented: $showingAddNote) {
                AddNoteView()
                    .environmentObject(notesVM)
            }
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
            .environmentObject(NotesViewModel())
    }
}
