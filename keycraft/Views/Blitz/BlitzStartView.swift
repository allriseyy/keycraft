import SwiftUI

struct BlitzStartView: View {
    @EnvironmentObject var vm: BlitzViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Spacer()
                Text("🧠 Mini Quiz")
                    .font(.largeTitle).bold()
                
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
