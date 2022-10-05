//
//  BaseService.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import Foundation

class BaseService {
    let defaultSession = URLSession(configuration: .default)
    func getURL(forPath path: String) -> URL? {
        URL(string: "\(L10n.baseURL)\(path)")
    }
}
