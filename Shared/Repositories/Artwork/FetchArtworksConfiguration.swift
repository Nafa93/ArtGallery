//
//  FetchArtworksConfiguration.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 22/01/2022.
//

import Foundation

struct FetchArtworksConfiguration: RequestConfiguration {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "api.artic.edu"
    }
    
    var path: String {
        "/api/v1/artworks"
    }
    
    var parameters: [URLQueryItem]? {
        [
            URLQueryItem(name: "limit", value: "20"),
            URLQueryItem(name: "page", value: "\(page)"),
        ]
    }
    
    var method: MethodType {
        .GET
    }
    
    var page: Int
}
