//
//  HomeView.swift
//  keycraft
//
//  Created by YI YONG LIM on 10/06/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var notesVM: NotesViewModel

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Welcome to KeyCraft!")
                    .font(.title)
                
                Text("Level up your productivity with KeyCraft, the fun and interactive way to master MacOS/Windows keyboard shortcuts. Whether you're a total newbie or a seasoned multitasker, this app turns learning into a game.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 25.0)
                    .padding(.top, 10.0)
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
