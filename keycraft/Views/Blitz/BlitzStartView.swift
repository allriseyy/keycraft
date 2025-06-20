import SwiftUI

struct BlitzStartView: View {
    @EnvironmentObject var vm: BlitzViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Spacer()
                Text("🧠 Blitz")
                    .font(.largeTitle).bold()

                Text("Fast-paced Q&A game where you race against the clock to master keyboard shortcuts and boost your shortcut skills.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 25.0)
                    .padding(.top, 10.0)
                
                NavigationLink {
                    BlitzView()
                        .environmentObject(vm)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Start")
                        .font(.title2).bold()
                        .padding(.horizontal, 40).padding(.vertical, 18)
                        .background(Color.purple)
                        .foregroundColor(.white).cornerRadius(14)
                }
                .simultaneousGesture(TapGesture().onEnded {
//                    start timer here
                })
                Spacer()
            }
            .padding()
        }
    }
}
