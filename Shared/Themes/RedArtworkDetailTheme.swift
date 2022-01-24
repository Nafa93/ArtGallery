//
//  RedArtworkDetailTheme.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import SwiftUI

struct RedArtworkDetailTheme: ArtworkDetailTheme {
    var titleFont: Font {
        .system(size: 30)
    }
    
    var bodyFont: Font {
        .system(size: 30)
    }
    
    var backgroundColor: Color {
        .red
    }
}
