import SwiftUICore
struct PixelFont: ViewModifier {
    var size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom("PressStart2P-Regular", size: size))
            .foregroundColor(.white)
            .shadow(color: .black, radius: 1, x: 1, y: 1)
    }
}
extension View {
    func pixelFont(_ size: CGFloat) -> some View {
        modifier(PixelFont(size: size))
    }
}
