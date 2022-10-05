//
//  Price.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//

import SwiftUI

struct Price: View {
    let price: Double
    var body: some View {
        Text(price.toDollarFormattedString())
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.accentColor)
            )
            .font(.caption)
            .bold()
            .foregroundColor(.white)
    }
}

struct Price_Previews: PreviewProvider {
    static var previews: some View {
        Price(price: Product.example.price)
    }
}
