//
//  ProductRepository.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import Foundation

class ProductRepository {
    private let service: ProductService
    init(service: ProductService) {
        self.service = service
    }
    func getProducts(completion: @escaping ([Product]?, Error?) -> Void) {
        service.getProducts(completion: completion)
    }
}
