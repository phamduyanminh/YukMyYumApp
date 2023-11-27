//
//  YukMyYumAppApp.swift
//  YukMyYumApp
//
//  Created by Minh Pham on 2023-11-27.
//

import SwiftUI

@main
struct YukMyYumAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
