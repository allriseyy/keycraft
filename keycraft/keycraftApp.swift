import SwiftUI

@main
struct keycraftApp: App {
    @StateObject var shortcutsVM = ShortcutsViewModel()
    @StateObject var blitzVM: BlitzViewModel
    @State private var selectedTab: Tab = .home
    
    init() {
        let shortcuts = ShortcutsViewModel()
        _shortcutsVM = StateObject(wrappedValue: shortcuts)
        _blitzVM = StateObject(wrappedValue: BlitzViewModel(shortcutsVM: shortcuts))
    }
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
                    .environmentObject(shortcutsVM)
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
