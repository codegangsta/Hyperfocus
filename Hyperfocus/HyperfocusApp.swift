//
//  HyperfocusApp.swift
//  Hyperfocus
//
//  Created by Jeremy Saenz on 8/19/23.
//

import SwiftUI

@main
struct HyperfocusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
