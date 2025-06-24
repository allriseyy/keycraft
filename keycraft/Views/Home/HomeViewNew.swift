import SwiftUICore
import SwiftUI
struct HomeViewNew: View {
    @EnvironmentObject var shortcutsVM: ShortcutsViewModel
    @State private var todayShortcut: Shortcut?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    topGreeting
                    shortcutOfTheDaySection
                    progress
                    Spacer(minLength: 32)
                }
            }
            .background(Color.black.edgesIgnoringSafeArea(.top))
        }
    }
}

private extension HomeViewNew {
    var topGreeting: some View {
        Text("KeyCraft")
            .pixelFont(24)
            .padding(.top, 16)
    }
}

private extension HomeViewNew {
    var shortcutOfTheDaySection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Shortcut of the Day")
                .pixelFont(10)

            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.blue)
                HStack {
                    PixelIcon(systemName: "command.circle")
                    VStack(alignment: .leading, spacing: 12) {
                        Text(todayShortcut?.title ?? "Picking a shortcut…")
                            .pixelFont(10)
                        Text(todayShortcut?.content ?? "Loading its content…")
                            .pixelFont(8)
                    }
                    Spacer()
                }
                .padding(8)
            }
            .frame(height: 60)
        }
        .padding(.horizontal)
        .onAppear {
            todayShortcut = shortcutsVM.shortcuts.randomElement()
        }
    }
}

private extension HomeViewNew {
    var progress: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Progress")
                .pixelFont(10)
            PixelProgressCircle(progress: 0.6)
        }
    }
}
