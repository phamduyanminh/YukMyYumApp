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
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
