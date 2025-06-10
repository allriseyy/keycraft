//
//  AddNoteView.swift
//  keycraft
//
//  Created by YI YONG LIM on 10/06/2025.
//

import SwiftUI

struct AddNoteView: View {
    @EnvironmentObject var notesVM: NotesViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var content = ""

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
            .navigationBarTitle("New Note", displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Save") {
                    if !title.isEmpty || !content.isEmpty {
                        notesVM.addNote(title: title, content: content)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            )
        }
    }
}
