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
    @StateObject var blitzVM = GameViewModel()
    @State private var selectedTab: Tab = .home
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
                BlitzStartView()
                    .tabItem {
                        Label("Blitz", systemImage: "bolt.fill")
                    }
                    .environmentObject(blitzVM)
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
