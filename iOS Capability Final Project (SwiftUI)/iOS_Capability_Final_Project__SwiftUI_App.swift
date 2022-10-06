//
//  iOS_Capability_Final_Project__SwiftUI_App.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import SwiftUI

@main
struct iOS_Capability_Final_Project__SwiftUI_App: App {
    let persistenceController = PersistenceController.shared
    @StateObject var addedToCartStateManager = AddedToCartStateManager()
    
    var body: some Scene {
        WindowGroup {
            MainScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(addedToCartStateManager)
        }
    }
}
