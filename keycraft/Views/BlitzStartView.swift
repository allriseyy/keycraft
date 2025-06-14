//
//  BlitzStartView.swift
//  keycraft
//
//  Created by YI YONG LIM on 14/06/2025.
//

import SwiftUI

struct BlitzStartView: View {
    @EnvironmentObject var vm: GameViewModel
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Spacer()
                Text("🧠 Mini Quiz")
                    .font(.largeTitle).bold()
                
                NavigationLink {
                    BlitzView()
                        .environmentObject(vm)  // inject VM
                        .navigationBarBackButtonHidden(true) // ← hide back button
                } label: {
                    Text("Start")
                        .font(.title2).bold()
                        .padding(.horizontal, 40).padding(.vertical, 18)
                        .background(Color.purple)
                        .foregroundColor(.white).cornerRadius(14)
                }
                Spacer()
            }
            .padding()
        }
    }
}
