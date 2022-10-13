//
//  ProductServiceMock.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/13/22.
//

import Foundation

class ProductServiceMock: BaseService, ProductService {
    func getProducts(completion: @escaping ([Product]?, Error?) -> Void) {
        completion([Product.example, Product.example], nil)
    }
}
