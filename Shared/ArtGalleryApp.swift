//
//  ArtGalleryApp.swift
//  Shared
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 18/01/2022.
//

import SwiftUI

@main
struct ArtGalleryApp: App {    
    var body: some Scene {
        WindowGroup {
            ArtworkList(viewModel: ArtworkListViewModel(repository: ArtworkRepository()))
        }
    }
}
