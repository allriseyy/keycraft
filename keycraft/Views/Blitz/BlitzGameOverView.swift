import SwiftUI

struct GameOverView: View {
    @EnvironmentObject private var vm: BlitzViewModel
    @Environment(\.dismiss) private var dismiss   // to pop to root
    
    var body: some View {
        VStack(spacing: 30) {
            Text("🎉 Game Over")
                .font(.largeTitle).bold()
            
            VStack(spacing: 12) {
                Text("Time: \(vm.elapsed) s")
                Text("Lives left: \(vm.lives)")
            }
            .font(.title3)
            
            Button {
                vm.restart()
//                vm.startTimer()
            } label: {
                Text("Play Again")
                    .padding(.horizontal, 36).padding(.vertical, 16)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(14)
            }
            
            Button("Exit") {
                dismiss()    // returns to StartView
                vm.restart()
            }
            .padding(.top, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
