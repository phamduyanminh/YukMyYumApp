//
//  ContentView.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-11-27.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
//        LoginView()
        Group{
            if viewModel.userSession != nil{
                HomeView()
            }else{
                LoginView()
            }
        }//Group
        .onAppear(){
            viewModel.initUserSession()
        }
        
    }//body

}//struct



#Preview {
    ContentView()
}
