//
//  Double+Extensions.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//

import Foundation

extension Double {
    func toDollarFormattedString() -> String {
        String(format: "$%.02f", self)
    }
}
