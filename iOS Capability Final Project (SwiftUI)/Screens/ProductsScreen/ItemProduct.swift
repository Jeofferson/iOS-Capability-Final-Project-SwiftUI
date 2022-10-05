//
//  ItemProduct.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import SwiftUI

struct ItemProduct: View {
    @State private var isPresentingAlert = false
    let product: Product
    var body: some View {
        HStack(spacing: 20) {
            CachedAsyncImageView(imageURL: product.imageURL)
                .frame(width: 80, height: 80)
            HStack {
                VStack(alignment: .leading) {
                    Text(product.name)
                        .lineLimit(3)
                        .bold()
                    PriceView(price: product.price)
                        .font(.caption)
                }
                Spacer(minLength: 20)
                Image(systemName: L10n.Icon.notInsideCart)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .scaledToFit()
                    .foregroundColor(.accentColor)
                    .onTapGesture {
                        isPresentingAlert = true
                    }
            }
        }
        .padding(10)
        .alert(isPresented: $isPresentingAlert) {
            AlertManager.getAlertAddedToCart()
        }
    }
}

struct ItemProduct_Previews: PreviewProvider {
    static var previews: some View {
        ItemProduct(product: Product.example)
    }
}
