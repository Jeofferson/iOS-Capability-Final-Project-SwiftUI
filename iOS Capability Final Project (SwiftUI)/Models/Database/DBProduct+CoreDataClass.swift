//
//  DBProduct+CoreDataClass.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//
//

import CoreData
import SwiftUI

@objc(DBProduct)
public class DBProduct: NSManagedObject {
    func toProduct() -> Product {
        Product(
            id: Int(id),
            name: name ?? L10n.Sample.Product.name,
            imageURL: URL(string: imageURLString ?? L10n.Sample.Product.imageURLString),
            category: L10n.Sample.Product.category,
            description: L10n.Sample.loremIpsum,
            rating: L10n.Sample.Product.rating,
            price: price
        )
    }
}

extension FetchedResults<DBProduct> {
    func toProducts() -> [Product] {
        map { $0.toProduct() }
    }
}
