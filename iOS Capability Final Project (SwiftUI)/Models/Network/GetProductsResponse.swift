//
//  GetProductsResponse.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import Foundation

// MARK: - GetProductsResponseElement
struct GetProductsResponseElement: Codable {
    let id: Int
    let title: String
    let price: Double
    let getProductsResponseDescription, category: String
    let image: String
    let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case getProductsResponseDescription = "description"
        case category, image, rating
    }
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

typealias GetProductsResponse = [GetProductsResponseElement]

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func getProductsResponseTask(with url: URL, completionHandler: @escaping (GetProductsResponse?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

extension GetProductsResponseElement {
    func toProduct() -> Product {
        Product(
            id: id,
            name: title,
            imageURL: URL(string: image),
            category: category,
            description: getProductsResponseDescription,
            rating: "\(rating.rate) (\(rating.count))",
            price: price
        )
    }
}

extension GetProductsResponse {
    func toProducts() -> [Product] {
        map { $0.toProduct() }
    }
}
