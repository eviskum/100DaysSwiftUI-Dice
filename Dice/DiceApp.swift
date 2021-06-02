//
//  DiceApp.swift
//  Dice
//
//  Created by Esben Viskum on 02/06/2021.
//

import SwiftUI

@main
struct DiceApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
