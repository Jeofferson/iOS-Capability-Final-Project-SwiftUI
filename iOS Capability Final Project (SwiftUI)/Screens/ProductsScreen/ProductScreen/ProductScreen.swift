//
//  ProductScreen.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//

import SwiftUI

struct ProductScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var addedToCartStateManager: AddedToCartStateManager
    @State private var isPresentingAlert = false
    let product: Product
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack {
                    CachedAsyncImageView(imageURL: product.imageURL)
                        .frame(height: 240)
                    VStack(alignment: .leading, spacing: 20) {
                        Text(product.name)
                            .font(.title)
                            .bold()
                        VStack(alignment: .leading, spacing: 10) {
                            PriceView(price: product.price)
                            RatingView(rating: product.rating)
                        }
                        VStack(alignment: .leading, spacing: 10) {
                            Text(L10n.Label.description)
                                .italic()
                            Text(product.description)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .frame(
                      maxWidth: .infinity,
                      alignment: .leading
                    )
                    .padding(20)
                }
            }
            Group {
                Button(
                    action: {
                        PersistenceController.shared.saveOrDeleteProduct(
                            viewContext: viewContext,
                            product: product
                        )
                        isPresentingAlert = true
                    }, label: {
                        HStack {
                            Image(
                                systemName: product.isAddedToCart(viewContext: viewContext)
                                    ? L10n.Icon.removeFromCart
                                    : L10n.Icon.addToCart
                            )
                            .foregroundColor(.white)
                            Text(
                                product.isAddedToCart(viewContext: viewContext)
                                   ? L10n.Action.removeFromCart
                                   : L10n.Action.addToCart
                            )
                            .foregroundColor(.white)
                            .bold()
                        }
                    }
                )
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(Color.accentColor)
            }
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 10)
            .border(width: 0.5, edges: [.top, .bottom], color: Color(.lightGray))
        }
        .navigationTitle(product.category.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $isPresentingAlert) {
            AlertManager.getAddedToOrRemovedFromCartAlert(viewContext: viewContext, product: product)
        }
    }
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductScreen(product: Product.example)
                .environment(
                    \.managedObjectContext,
                     PersistenceController.preview.container.viewContext
                )
                .environmentObject(AddedToCartStateManager())
        }
    }
}
