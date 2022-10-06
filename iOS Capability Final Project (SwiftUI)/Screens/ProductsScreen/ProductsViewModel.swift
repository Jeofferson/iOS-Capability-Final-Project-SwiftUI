//
//  ProductsViewModel.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var products: [Product] = []
    private let service: ProductService
    init(service: ProductService) {
        self.service = service
    }
    func getProducts() {
        service.getProducts { [weak self] products, error in
            guard let self = self else { return }
            guard let products = products, error == nil else { return }
            self.products = products
        }
    }
}
