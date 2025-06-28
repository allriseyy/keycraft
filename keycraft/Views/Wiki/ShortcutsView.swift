import SwiftUI

struct ShortcutsView: View {
    @EnvironmentObject var shortcutsVM: ShortcutsViewModel
    @State private var editingShortcut: Shortcut? = nil
    @State private var showingAddShortcut = false

    var body: some View {
        NavigationView {
            VStack(spacing: 4) {
                HStack {
                    Text("Wiki")
                        .pixelFont(20)
                        .bold()
                    Spacer()
                    Button(action: {
                        showingAddShortcut = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 20))
                    }
                    Button(action: {
                        shortcutsVM.addDummyWiki()
                    }) {
                        Image(systemName: "doc.on.doc.fill")
                            .font(.system(size: 20))
                    }
                    .padding(.leading, 8)
                }
                .padding(.horizontal)
                .padding(.bottom, 4)

                List {
                    ForEach(shortcutsVM.shortcuts) { shortcut in
                        Button(action: {
                            editingShortcut = shortcut
                        }) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(shortcut.title)
                                    .font(.headline)

                                HStack {
                                    Spacer()
                                    Text(shortcut.content)
                                        .font(.subheadline)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .onDelete(perform: shortcutsVM.deleteShortcut)

                    if !shortcutsVM.shortcuts.isEmpty {
                        Button(role: .destructive) {
                            shortcutsVM.deleteAllShortcuts()
                        } label: {
                            HStack {
                                Spacer()
                                Text("Delete All Shortcuts")
                                    .foregroundColor(.red)
                                Spacer()
                            }
                        }
                    }
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
