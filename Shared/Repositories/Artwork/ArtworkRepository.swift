//
//  ArtworkRepository.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 22/01/2022.
//

import Foundation

final class ArtworkRepository: AnyArtworkRepository {
    func fetchArtworks(for page: Int) async throws -> [Artwork] {
        let configuration = FetchArtworksConfiguration(page: page)
        let response: GetArtworksResponse = try await ServiceLayer.request(configuration: configuration)
        return response.data
    }
}
