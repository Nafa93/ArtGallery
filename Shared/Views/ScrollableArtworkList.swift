//
//  ScrollableArtworkList.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import SwiftUI

struct ScrollableArtworkList<Content: View>: View {
    var artworks: [Artwork]
    var content: (Artwork) -> Content
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(artworks) { artwork in
                    content(artwork)
                }
            }
        }
    }
}
