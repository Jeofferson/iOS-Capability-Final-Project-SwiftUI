//
//  CachedAsyncImageView.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import SwiftUI
import CachedAsyncImage

struct CachedAsyncImageView: View {
    let imageURL: URL?
    var body: some View {
        CachedAsyncImage(
            url: imageURL,
            content: { image in
                image
                    .resizable()
                    .scaledToFit()
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}

struct CachedAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        CachedAsyncImageView(imageURL: Product.example.imageURL)
    }
}
