import SwiftUI
import Lottie

struct LottieABCView: UIViewRepresentable {
  let filename: String
  let loopMode: LottieLoopMode

  init(filename: String, loopMode: LottieLoopMode = .playOnce) {
    self.filename = filename
    self.loopMode = loopMode
  }

  func makeUIView(context: Context) -> UIView {
    let container = UIView()
    let aniView = LottieAnimationView()
    if let anim = LottieAnimation.named(filename) {
      aniView.animation = anim
    } else {
      print("❌ Lottie file \(filename).json not found")
    }
    aniView.contentMode = .scaleAspectFit
    aniView.loopMode   = loopMode
    aniView.play()
    aniView.translatesAutoresizingMaskIntoConstraints = false
    container.addSubview(aniView)
    NSLayoutConstraint.activate([
      aniView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      aniView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      aniView.topAnchor.constraint(equalTo: container.topAnchor),
      aniView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
    ])
    return container
  }

  func updateUIView(_ uiView: UIView, context: Context) { }
}
