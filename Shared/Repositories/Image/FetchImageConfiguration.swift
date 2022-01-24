//
//  FetchImageConfiguration.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import Foundation

struct FetchImageConfiguration: RequestConfiguration {
    var scheme: String {
        "https"
    }
    
    var host: String {
        "www.artic.edu"
    }
    
    var path: String {
        "/iiif/2/\(imageId)/full/843,/0/default.jpg"
    }
    
    var parameters: [URLQueryItem]? {
        nil
    }
    
    var method: MethodType {
        .GET
    }
    
    var imageId: String
}
