//
//  CartScreen.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import SwiftUI

struct CartScreen: View {
    @State private var cartProducts = [Product.example]
    var body: some View {
        List {
            ForEach(cartProducts) { product in
                ItemProduct(product: product, isInsideCartScreen: true)
            }
            .onDelete {_ in
                cartProducts.remove(at: 0)
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle(L10n.Title.cart)
        .toolbar {
            EditButton()
        }
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CartScreen()
        }
    }
}
