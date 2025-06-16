import SwiftUI

@main
struct keycraftApp: App {
    @StateObject var shortcutsVM = ShortcutsViewModel()
    @StateObject var blitzVM = GameViewModel()
    @State private var selectedTab: Tab = .home
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                ShortcutsView()
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
            .environmentObject(shortcutsVM)
        }
    }
}
