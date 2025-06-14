//
//  keycraftApp.swift
//  keycraft
//
//  Created by YI YONG LIM on 04/06/2025.
//

//import SwiftUI
//
//@main
//struct keycraftApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//            WarCardGameView()
//        }
//    }
//}

import SwiftUI

@main
struct keycraftApp: App {
    @StateObject var notesVM = NotesViewModel()
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                NotesView()
                    .tabItem {
                        Label("Learn", systemImage: "note.text")
                    }
                ContentView()
                    .tabItem {
                        Label("Blitz", systemImage: "bolt.fill")
                    }
                WarCardGameView()
                    .tabItem {
                        Label("Game", systemImage: "gamecontroller.fill")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
            }
            .environmentObject(notesVM)
        }
    }
}
