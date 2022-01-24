//
//  AnyArtworkRepository.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 22/01/2022.
//

import Foundation

protocol AnyArtworkRepository: AnyObject {
    func fetchArtworks(for page: Int) async throws -> [Artwork]
}
