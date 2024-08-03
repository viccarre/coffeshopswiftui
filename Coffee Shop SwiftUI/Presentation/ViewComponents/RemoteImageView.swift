//
//  RemoteImageView.swift
//  Coffee Shop SwiftUI
//
//  Created by Victor Carreno on 02/08/24.
//

import SwiftUI
import CachedAsyncImage

struct RemoteImageView: View {
    
    private let url: URL?
    
    init(url: URL?) {
        self.url = url
    }
    var body: some View {
        ZStack {
            CachedAsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .frame(maxWidth: 60, maxHeight: 60)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

#Preview {
    RemoteImageView(url: DummyData.drinks[0].imageUrl)
}
