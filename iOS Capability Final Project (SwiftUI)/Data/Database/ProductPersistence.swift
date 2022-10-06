//
//  ProductPersistence.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//

import CoreData

extension PersistenceController {
    func getDBProduct(viewContext: NSManagedObjectContext, withID id: Int) -> DBProduct? {
        var dbProducts: [DBProduct] = []
        do {
            let request = DBProduct.fetchRequest() as NSFetchRequest<DBProduct>
            request.predicate = NSPredicate(format: "id == %@", NSNumber(value: id))
            dbProducts = try viewContext.fetch(request)
        } catch {
            ErrorManager.throwFatalError(error: error)
        }
        return dbProducts.isEmpty ? nil : dbProducts[0]
    }
    func saveOrDeleteProduct(viewContext: NSManagedObjectContext, product: Product) {
        if let dbProduct = getDBProduct(viewContext: viewContext, withID: product.id) {
            viewContext.delete(dbProduct)
        } else {
            _ = product.toDBProduct(viewContext: viewContext)
        }
        PersistenceController.shared.save()
    }
}
