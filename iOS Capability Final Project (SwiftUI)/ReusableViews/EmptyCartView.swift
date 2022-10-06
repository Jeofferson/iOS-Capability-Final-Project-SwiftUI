//
//  EmptyCartView.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/7/22.
//

import SwiftUI

struct EmptyCartView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: L10n.Icon.emptyCart)
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
            Text(L10n.Label.emptyCart)
        }
    }
}

struct EmptyCartView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCartView()
    }
}
