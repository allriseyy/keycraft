//
//  ProfileView.swift
//  keycraft
//
//  Created by YI YONG LIM on 10/06/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                Text("Profile")
                    .font(.title)
                Text("Your info here!")
            }
            .navigationBarTitle("Profile")
        }
    }
}
