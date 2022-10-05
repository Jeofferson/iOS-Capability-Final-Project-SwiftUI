//
//  Product.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import Foundation

struct Product: Identifiable {
    let id: Int
    let name: String
    let price: Double
    let imageURL: URL?
    static let example = Product(
        id: 1,
        name: L10n.Sample.Product.name,
        price: 10,
        imageURL: URL(string: L10n.Sample.Product.imageURLString)
    )
}

extension GetProductsResponse {
    func toProducts() -> [Product] {
        map {
            Product(
                id: $0.id,
                name: $0.title,
                price: $0.price,
                imageURL: URL(string: $0.image)
            )
        }
    }
}
