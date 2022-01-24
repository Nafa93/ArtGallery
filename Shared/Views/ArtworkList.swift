//
//  ArtworkList.swift
//  Shared
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 18/01/2022.
//

import SwiftUI

struct ArtworkList: View {
    @StateObject var viewModel: ArtworkListViewModel
    
    var body: some View {
        NavigationView {
            ScrollableArtworkList(artworks: viewModel.artworks) { artwork in
                NavigationLink(destination: destinationView(for: artwork)) {
                    ArtworkCard(title: artwork.title)
                        .onAppear {
                            viewModel.loadMoreContentIfNeeded(currentItem: artwork)
                        }
                }
            }
            .onAppear {
                if viewModel.artworks.isEmpty {
                    viewModel.fetchArtworks()
                }
            }
            .navigationTitle("Artwork List")
            .navigationBarTitleDisplayMode(.inline)
            
            if viewModel.isLoading {
                ProgressView()
                    .foregroundColor(.gray)
            }
        }
        .alert("Failed to load artworks", isPresented: $viewModel.isErrorPresented, actions: {
            Button {
                viewModel.isErrorPresented = false
                viewModel.fetchArtworks()
            } label: {
                Text("OK")
            }
            
            Button {
                viewModel.isErrorPresented = false
            } label: {
                Text("Cancel")
            }

        }, message: {
            Text("Do you wanna try to reload the artworks?")
        })
    }
    
    func destinationView(for artwork: Artwork) -> some View {
        ArtworkDetail(viewModel: viewModel.getViewModel(for: artwork))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArtworkList(viewModel: ArtworkListViewModel(repository: MockArtworkRepository()))
        }
    }
}
