//
//  AnyArtistRepository.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import Foundation

protocol AnyArtistRepository: AnyObject {
    func fetchArtist(artistId: Int) async throws -> Artist
}
