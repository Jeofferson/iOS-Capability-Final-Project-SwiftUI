//
//  AlertManager.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//

import SwiftUI
import CoreData

struct AlertManager {
    static func getAddedToOrRemovedFromCartAlert(viewContext: NSManagedObjectContext, product: Product) -> Alert {
        Alert(
            title: Text(
                product.isAddedToCart(viewContext: viewContext)
                    ? L10n.Title.addedToCart
                    : L10n.Title.removedFromCart
            ),
            dismissButton: .default(Text(L10n.Confirm.ok))
        )
    }
}
