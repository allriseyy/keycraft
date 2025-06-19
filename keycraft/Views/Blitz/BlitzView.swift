import SwiftUI

struct BlitzView: View {
    @EnvironmentObject private var vm: BlitzViewModel
    @EnvironmentObject var shortcutsVM: ShortcutsViewModel
    
    var body: some View {
        if vm.finished {
            GameOverView()
        } else {
            VStack {
                header
                Spacer(minLength: 30)
                questionArea
                Spacer(minLength: 20)
                answersGrid
            }
            .padding()
            .animation(.spring(), value: vm.current)    // smooth transition
            .navigationBarBackButtonHidden(true)        // no back button
        }
    }
    
    // MARK: - Sub-views
    private var header: some View {
        HStack {
            Text("⏱ \(vm.elapsed)s")
                .font(.headline)
            Spacer()
            ForEach(0..<3, id: \.self) { i in
                Image(systemName: i < vm.lives ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
        }
    }
    
    private var questionArea: some View {
        Text(shortcutsVM.shortcuts[vm.current].title)
            .font(.title2).bold()
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }
    
    private var answersGrid: some View {
        let currentShortcut = shortcutsVM.shortcuts[vm.current]
        let allAnswers = vm.shuffledAnswers(for: currentShortcut) // <-- You define this method
        
        return VStack(spacing: 16) {
            ForEach(Array(allAnswers.enumerated()), id: \.offset) { idx, answer in
                Button {
                    vm.chooseAnswer(answer, correct: currentShortcut.content)
                } label: {
                    Text(answer)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.blue.opacity(0.85))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
        }
    }

}
