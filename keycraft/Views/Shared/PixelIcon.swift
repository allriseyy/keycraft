import SwiftUI

/// A simple wrapper around an SF Symbol, sized to your pixel grid.
struct PixelIcon: View {
    /// The SF Symbol name, e.g. "command.circle", "keyboard", etc.
    let systemName: String
    /// Desired icon size in points
    let size: CGFloat
    
    init(systemName: String, size: CGFloat = 48) {
        self.systemName = systemName
        self.size = size
    }
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            // if you still want that pixel-font shadow:
            .shadow(color: .black.opacity(0.25), radius: 1, x: 1, y: 1)
    }
}
