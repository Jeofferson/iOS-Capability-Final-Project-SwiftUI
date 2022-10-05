//
//  PriceView.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/6/22.
//

import SwiftUI

struct PriceView: View {
    let price: Double
    var body: some View {
        Text(price.toDollarFormattedString())
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.accentColor)
            )
            .bold()
            .foregroundColor(.white)
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(price: Product.example.price)
    }
}
