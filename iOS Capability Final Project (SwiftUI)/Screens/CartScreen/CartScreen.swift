//
//  CartScreen.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import SwiftUI
import CoreData

struct CartScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var addedToCartStateManager: AddedToCartStateManager
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \DBProduct.timestamp, ascending: false)],
        animation: .default
    )
    private var dbProducts: FetchedResults<DBProduct>
    var body: some View {
        Group {
            if dbProducts.isEmpty {
                EmptyCartView()
            } else {
                List {
                    ForEach(dbProducts.toProducts()) { product in
                        ItemProduct(product: product, isInsideCartScreen: true)
                    }
                    .onDelete { indexSet in
                        withAnimation {
                            indexSet.map { dbProducts[$0] }.forEach(viewContext.delete)
                            PersistenceController.shared.save()
                        }
                        addedToCartStateManager.state.toggle()
                    }
                }
                .listStyle(.insetGrouped)
                .toolbar {
                    EditButton()
                }
            }
        }
        .navigationTitle(L10n.Title.cart)
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CartScreen()
                .environment(
                    \.managedObjectContext,
                     PersistenceController.preview.container.viewContext
                )
                .environmentObject(AddedToCartStateManager())
        }
    }
}
