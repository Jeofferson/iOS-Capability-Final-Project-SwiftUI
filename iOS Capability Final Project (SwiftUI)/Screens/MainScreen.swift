//
//  MainScreen.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import SwiftUI

struct MainScreen: View {
    @StateObject var productsViewModel = ProductsViewModel(
        repository: ProductRepository(
            service: ProductService()
        )
    )
    var body: some View {
        TabView {
            NavigationStack {
                ProductsScreen()
                    .environmentObject(productsViewModel)
            }
            .tabItem {
                Image(systemName: L10n.Icon.TabView.shop)
            }
            NavigationStack {
                CartScreen()
            }
            .tabItem {
                Image(systemName: L10n.Icon.TabView.cart)
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
