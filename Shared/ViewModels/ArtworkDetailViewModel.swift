//
//  ArtworkDetailViewModel.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 21/01/2022.
//

import Foundation

class ArtworkDetailViewModel: ObservableObject {
    
    @Published var artist: Artist?
    @Published var theme: ArtworkDetailTheme = DefaultArtworkDetailTheme()
    @Published var isErrorPresented = false
    
    private var motionManager: DefaultMotionManager
    private var repository: AnyArtistRepository
    
    var artwork: Artwork
    
    var title: String {
        return artwork.artistTitle ?? "Anonymous work"
    }
    
    var birthDate: String {
        return "\(artist?.birthDate ?? 0)"
    }
    
    var deathDate: String {
        return "\(artist?.deathDate ?? 0)"
    }
    
    init(artwork: Artwork, repository: AnyArtistRepository, motionManager: DefaultMotionManager) {
        self.artwork = artwork
        self.repository = repository
        self.motionManager = motionManager
    }
    
    func imageUrl(for artwork: Artwork) -> URL? {
        guard let imageId = artwork.imageId?.uuidString.lowercased() else {
            return nil
        }
        
        let configuration = FetchImageConfiguration(imageId: imageId)
        
        guard let url = ServiceLayer.getUrl(from: configuration) else {
            return nil
        }
        
        return url
    }
    
    func fetchArtist(for artwork: Artwork) {
        guard let id = artwork.artistId else {
            return
        }
        
        Task {
            do {
                let artist = try await repository.fetchArtist(artistId: id)
                
                DispatchQueue.main.async {
                    self.artist = artist
                }
            } catch {
                DispatchQueue.main.async {
                    self.isErrorPresented = true
                }
            }
        }
    }
    
    func startGyros() {
        motionManager.startGyros { degrees in
            if degrees < -30 {
                self.theme = RedArtworkDetailTheme()
            }

            if degrees > 30 {
                self.theme = GreenArtworkDetailTheme()
            }
        }
    }
    
    func stopGyros() {
        motionManager.stopGyros()
    }
}
