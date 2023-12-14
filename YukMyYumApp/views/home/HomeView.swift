//
//  HomeView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-12-12.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                NavigationLink(destination: MapView()) {
                    Text("Let's explore!")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: ProfileView()) {
                    Text("Profile")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: ProfileView()) {
                    Text("Go to Third View")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
