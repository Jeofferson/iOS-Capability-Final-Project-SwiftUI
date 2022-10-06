//
//  Persistence.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<10 {
            let newDBProduct = DBProduct(context: viewContext)
            newDBProduct.id = Int64(i)
            newDBProduct.name = L10n.Sample.Product.name
            newDBProduct.imageURLString = L10n.Sample.Product.imageURLString
            newDBProduct.price = Double((i + 1) * 10)
            newDBProduct.timestamp = Date()
        }
        result.save(viewContext: viewContext)
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Main")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { (_, error) in
            ErrorManager.throwFatalError(error: error)
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    func save(viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                ErrorManager.throwFatalError(error: error)
            }
        }
    }
}
