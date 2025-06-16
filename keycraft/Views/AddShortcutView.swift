import SwiftUI

struct AddShortcutView: View {
    @EnvironmentObject var shortcutsVM: ShortcutsViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var content = ""

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
            .navigationBarTitle("New Shortcut", displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Save") {
                    if !title.isEmpty || !content.isEmpty {
                        shortcutsVM.addShortcut(title: title, content: content)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            )
        }
    }
}
