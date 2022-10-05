//
//  RatingView.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//

import SwiftUI

struct RatingView: View {
    let rating: String
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: L10n.Icon.rating)
                .foregroundColor(.accentColor)
            Text(rating)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: Product.example.rating)
    }
}
