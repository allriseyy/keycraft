import SwiftUI

struct BlitzStartView: View {
  @EnvironmentObject var vm: BlitzViewModel

  /// Controls whether we’re in “splash” mode or showing the real content
    @State private var showSplash = true
    @State private var titleScale: CGFloat = 0.5
    @State private var descOffset: CGFloat = 50
    @State private var buttonPulse = false

  /// Match this to your rocket animation’s duration
  private let splashDuration: TimeInterval = 2.0

  var body: some View {
    NavigationStack {
      ZStack {
        //–– Your real intro content ––
          VStack(spacing: 40) {
              Spacer()

              // 🧠 Title with bounce
              Text("Blitz")
                  .font(.system(size: 60, weight: .black))
                  .foregroundStyle(
                      LinearGradient(
                          colors: [.yellow, .orange, .pink],
                          startPoint: .top,
                          endPoint: .bottom
                      )
                  )
                  .scaleEffect(titleScale)
                  .onAppear {
                      withAnimation(.interpolatingSpring(stiffness: 70, damping: 7).delay(splashDuration + 0.1)) {
                          titleScale = 1.0
                      }
                  }

              // Description sliding up
              Text("Fast-paced Q&A game where you race against the clock to master keyboard shortcuts and boost your skills.")
                  .pixelFont(15)
                  .foregroundColor(.black.opacity(0.9))
                  .multilineTextAlignment(.center)
                  .padding(.horizontal, 30)
                  .offset(y: descOffset)
                  .onAppear {
                      withAnimation(.easeOut(duration: 0.8).delay(splashDuration + 0.3)) {
                          descOffset = 0
                      }
                  }

              // Start button with pulsing effect
              NavigationLink {
                  BlitzView()
                      .environmentObject(vm)
                      .navigationBarBackButtonHidden(true)
              } label: {
                  Text("Start")
                      .font(.title2).bold()
                      .padding(.horizontal, 40)
                      .padding(.vertical, 18)
                      .background(.white)
                      .foregroundColor(.purple)
                      .cornerRadius(14)
                      .scaleEffect(buttonPulse ? 1.05 : 0.95)
              }
              .simultaneousGesture(TapGesture().onEnded {
                  // you could start a timer here
              })
              .onAppear {
                  // Continuous pulse
                  withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(splashDuration + 0.5)) {
                      buttonPulse = true
                  }
              }

              Spacer()
          }
          .opacity(showSplash ? 0 : 1)
          .animation(.easeInOut(duration: 0.5), value: showSplash)

        //–– Splash overlay ––
        if showSplash {
          Color.white
            .ignoresSafeArea()

            LottieABCView(filename: "rocket", loopMode: .playOnce)
            .frame(width: 200, height: 200)
            .transition(.opacity)
            .onAppear {
              // after the animation, remove splash
              DispatchQueue.main.asyncAfter(deadline: .now() + splashDuration) {
                withAnimation {
                  showSplash = false
                }
              }
            }
        }
      }
    }
    .onAppear {
        showSplash = true
    }
  }
}
