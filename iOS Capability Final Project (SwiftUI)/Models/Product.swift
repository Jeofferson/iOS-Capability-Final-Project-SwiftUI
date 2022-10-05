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
    let imageURL: URL?
    let category: String
    let description: String
    let rating: String
    let price: Double
    static let example = Product(
        id: 1,
        name: L10n.Sample.Product.name,
        imageURL: URL(string: L10n.Sample.Product.imageURLString),
        category: L10n.Sample.Product.category,
        description: L10n.Sample.loremIpsum,
        rating: L10n.Sample.Product.rating,
        price: 10
    )
}

extension GetProductsResponse {
    func toProducts() -> [Product] {
        map {
            Product(
                id: $0.id,
                name: $0.title,
                imageURL: URL(string: $0.image),
                category: $0.category,
                description: $0.getProductsResponseDescription,
                rating: "\($0.rating.rate) (\($0.rating.count))",
                price: $0.price
            )
        }
    }
}
