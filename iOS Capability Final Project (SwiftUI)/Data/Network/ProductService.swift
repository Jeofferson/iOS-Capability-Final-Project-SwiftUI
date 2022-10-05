//
//  ProductService.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import Foundation

class ProductService: BaseService {
    func getProducts(completion: @escaping ([Product]?, Error?) -> Void) {
        guard let url = getURL(forPath: "/products") else {
            return
        }
        defaultSession.getProductsResponseTask(with: url) { getProductsResponse, _, error in
            DispatchQueue.main.async {
                completion(getProductsResponse?.toProducts(), error)
            }
        }.resume()
    }
}
