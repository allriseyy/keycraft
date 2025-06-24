import SwiftUICore
struct PixelProgressCircle: View {
    var progress: Double  // 0–1
    var lineWidth: CGFloat = 8

    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .square))
                .foregroundColor(Color.gray.opacity(0.3))
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .square))
                .rotationEffect(.degrees(-90))
                .foregroundColor(.green)
            Text("\(Int(progress * 100))%")
                .pixelFont(12)
        }
        .frame(width: 100, height: 100)
    }
}
