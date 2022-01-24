//
//  ArtworkListViewModel.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 21/01/2022.
//

import Foundation
import Combine
import SwiftUI

class ArtworkListViewModel: ObservableObject {
    
    @Published var artworks: [Artwork] = []
    @Published var isErrorPresented = false
    @Published var isLoading = false
    
    private var repository: AnyArtworkRepository
    
    private var currentPage = 1
    
    init(repository: AnyArtworkRepository) {
        self.repository = repository
    }
    
    func fetchArtworks() {
        isLoading = true
        
        Task {
            do {
                print("FETCHING #\(currentPage)")
                let artworks = try await repository.fetchArtworks(for: currentPage)
                
                DispatchQueue.main.async {
                    self.artworks.append(contentsOf: artworks)
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.isErrorPresented = true
                    self.isLoading = false
                }
            }
        }
    }
    
    func getViewModel(for artwork: Artwork) -> ArtworkDetailViewModel {
        return ArtworkDetailViewModel(artwork: artwork,
                                      repository: ArtistRepository(),
                                      motionManager: DefaultMotionManager())
    }
    
    func loadMoreContentIfNeeded(currentItem item: Artwork) {
        let thresholdIndex = artworks.index(artworks.endIndex, offsetBy: -5)
        
        if artworks.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            self.currentPage += 1
            fetchArtworks()
        }
      }
}
