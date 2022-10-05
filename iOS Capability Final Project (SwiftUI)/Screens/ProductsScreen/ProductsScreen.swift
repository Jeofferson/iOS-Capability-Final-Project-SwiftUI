//
//  ProductsScreen.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import SwiftUI

struct ProductsScreen: View {
    @EnvironmentObject var viewModel: ProductsViewModel
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                NavigationLink(destination: Text(product.name)) {
                    ItemProduct(product: product)
                }
            }
        }
        .listStyle(.grouped)
        .onAppear(perform: viewModel.getProducts)
        .navigationTitle(L10n.appTitle)
    }
}

struct ProductsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductsScreen()
                .environmentObject(
                    ProductsViewModel(
                        repository: ProductRepository(
                            service: ProductService()
                        )
                    )
                )
        }
    }
}
