import SwiftUI

struct ShortcutsView: View {
    @EnvironmentObject var shortcutsVM: ShortcutsViewModel
    @State private var editingShortcut: Shortcut? = nil
    @State private var showingAddShortcut = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Wiki")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Button(action: {
                        showingAddShortcut = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                }
                .padding([.top, .horizontal])

                List {
                    ForEach(shortcutsVM.shortcuts) { shortcut in
                        Button(action: {
                            editingShortcut = shortcut
                        }) {
                            HStack() {
                                Text(shortcut.title).font(.headline)
                                Spacer()
                                Text(shortcut.content).font(.subheadline).lineLimit(2)
                            }
                            .padding(.vertical, 2)
                        }
                    }
                    .onDelete(perform: shortcutsVM.deleteShortcut)
                }
            }
            .sheet(item: $editingShortcut) { shortcut in
                EditShortcutView(shortcut: shortcut)
            }
            .sheet(isPresented: $showingAddShortcut) {
                AddShortcutView()
                    .environmentObject(shortcutsVM)
            }
        }
    }
}
