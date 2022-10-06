//
//  ErrorManager.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/7/22.
//

import Foundation

struct ErrorManager {
    static func throwFatalError(error: Error?) {
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    }
}
