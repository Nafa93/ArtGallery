//
//  MockArtistRepository.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import Foundation

final class MockArtistRepository: AnyArtistRepository {
    func fetchArtist(artistId: Int) async throws -> Artist {
        return Artist(birthDate: 1993, deathDate: 2093)
    }
}
