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
        
        Group{
//            if viewModel.userSession != nil{
//                ProfileView()
//            }else{
//                LoginView()
//            }
            LoginView()
        }//Group
        .onAppear(){
            //viewModel.initUserSession()
        }
        
    }//body

}//struct



#Preview {
    ContentView()
}
