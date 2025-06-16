import SwiftUI

struct EditShortcutView: View {
    @EnvironmentObject var shortcutsVM: ShortcutsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var shortcut: Shortcut
    @State private var title: String
    @State private var content: String

    init(shortcut: Shortcut) {
        self.shortcut = shortcut
        _title = State(initialValue: shortcut.title)
        _content = State(initialValue: shortcut.content)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("What is this shortcut doing?", text: $title)
                }
                Section(header: Text("Content")) {
                    TextEditor(text: $content)
                        .frame(height: 200)
                }
            }
            .navigationBarTitle("Edit", displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Save") {
                    shortcutsVM.updateShortcut(shortcut: shortcut, title: title, content: content)
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

