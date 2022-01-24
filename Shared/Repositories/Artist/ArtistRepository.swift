//
//  ArtistRepository.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import Foundation

final class ArtistRepository: AnyArtistRepository {
    func fetchArtist(artistId: Int) async throws -> Artist {
        let configuration = FetchArtistConfiguration(artistId: artistId)
        let response: GetArtistResponse = try await ServiceLayer.request(configuration: configuration)
        return response.data
    }
}
