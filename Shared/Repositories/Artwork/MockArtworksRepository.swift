//
//  MockArtworksRepository.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import Foundation

final class MockArtworkRepository: AnyArtworkRepository {
    func fetchArtworks(for page: Int) async throws -> [Artwork] {
        let firstArtwork = Artwork(id: 0, title: "First artwork", imageId: UUID(), artistTitle: "Artist Name", artistId: 0)
        let secondArtwork = Artwork(id: 1, title: "Second artwork", imageId: UUID(), artistTitle: "Artist Name", artistId: 0)
        
        return [firstArtwork, secondArtwork]
    }
}
