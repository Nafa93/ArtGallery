//
//  Artwork.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 21/01/2022.
//

import Foundation

struct Artwork: Codable, Identifiable {
    var id: Int
    var title: String
    var imageId: UUID?
    var artistTitle: String?
    var artistId: Int?
}
