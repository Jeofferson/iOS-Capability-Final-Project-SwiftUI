//
//  AlertManager.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//

import SwiftUI

class AlertManager {
    static func getAlertAddedToCart() -> Alert {
        Alert(title: Text(L10n.Title.addedToCart), dismissButton: .default(Text(L10n.Confirm.ok)))
    }
}
