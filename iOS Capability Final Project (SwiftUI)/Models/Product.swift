//
//  Product.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import CoreData

struct Product: Identifiable, Equatable {
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
    func toDBProduct(viewContext: NSManagedObjectContext) -> DBProduct {
        let dbProduct = DBProduct(context: viewContext)
        dbProduct.id = Int64(id)
        dbProduct.name = name
        dbProduct.imageURLString = imageURL?.absoluteString
        dbProduct.price = price
        dbProduct.timestamp = Date()
        return dbProduct
    }
    func isAddedToCart(viewContext: NSManagedObjectContext) -> Bool {
        PersistenceController.shared.getDBProduct(viewContext: viewContext, withID: id) != nil
    }
}

extension Array<Product> {
    func toDBProducts(viewContext: NSManagedObjectContext) -> [DBProduct] {
        map { $0.toDBProduct(viewContext: viewContext) }
    }
}
