//
//  YukMyYumAppApp.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-11-27.
//

import SwiftUI
import Firebase
import FirebaseFirestore

@main
struct YukMyYumAppApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var viewModel = AuthViewModel()
    
    
    init() {
        FirebaseApp.configure()
    }

    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
    
    
}
