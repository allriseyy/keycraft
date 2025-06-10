//
//  ContentView.swift
//  keycraft
//
//  Created by YI YONG LIM on 04/06/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                Image("charmander")
                    .resizable()
                    .cornerRadius(30)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("Charmander")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.orange)
            }
        }
    }
}

#Preview {
    ContentView()
}
