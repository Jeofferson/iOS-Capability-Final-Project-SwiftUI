//
//  CustomAsyncImage.swift
//  iOS Capability Final Project (SwiftUI)
//
//  Created by Jeofferson Dela Pena on 10/5/22.
//

import SwiftUI
import CachedAsyncImage

struct CustomAsyncImage: View {
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

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImage(imageURL: nil)
    }
}
