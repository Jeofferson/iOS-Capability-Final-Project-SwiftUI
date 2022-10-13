//
//  ProductService.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/13/22.
//

import Foundation

protocol ProductService: BaseService {
    func getProducts(completion: @escaping ([Product]?, Error?) -> Void)
}
