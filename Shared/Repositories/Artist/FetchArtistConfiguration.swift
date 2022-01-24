//
//  FetchArtistConfiguration.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import Foundation

struct FetchArtistConfiguration: RequestConfiguration {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "api.artic.edu"
    }
    
    var path: String {
        "/api/v1/artists/\(artistId)"
    }
    
    var parameters: [URLQueryItem]? {
        nil
    }
    
    var method: MethodType {
        .GET
    }
    
    var artistId: Int
}
