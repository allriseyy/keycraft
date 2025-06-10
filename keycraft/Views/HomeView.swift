//
//  HomeView.swift
//  keycraft
//
//  Created by YI YONG LIM on 10/06/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var notesVM: NotesViewModel
    @State private var showingAddNote = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Welcome to QuickNotes!")
                    .font(.title)
                Spacer()
            }
            .navigationBarTitle("Home", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    showingAddNote = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            )
            .sheet(isPresented: $showingAddNote) {
                AddNoteView()
                    .environmentObject(notesVM)
            }
        }
    }
}
