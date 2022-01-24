//
//  ArtworkDetail.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 21/01/2022.
//

import SwiftUI

struct ArtworkDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ArtworkDetailViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    AsyncImage(
                        url: viewModel.imageUrl(for: viewModel.artwork),
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fill)
                                 .frame(width: geometry.size.width,
                                        alignment: .center)
                        },
                        placeholder: {
                            ProgressView()
                                .frame(width: geometry.size.width,
                                       height: geometry.size.height * 0.5,
                                       alignment: .center)
                        }
                    )
                    .overlay(
                        LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .center)
                    )
                    
                    VStack(spacing: 16) {
                        Text(viewModel.title)
                            .padding(24)
                            .centerFullWidth()
                            .font(viewModel.theme.titleFont)
                            .foregroundColor(.black)
                        
                        if viewModel.artist != nil {
                            Text("(\(viewModel.birthDate)) - (\(viewModel.deathDate))")
                                .centerFullWidth()
                                .font(viewModel.theme.bodyFont)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button {
                        viewModel.fetchArtist(for: viewModel.artwork)
                    } label: {
                        Text("Show More")
                            .centerFullWidth()
                    }
                    .padding(.horizontal, 16)
                    .font(viewModel.theme.bodyFont)
                }
                .primaryButtonStyle()
            }
            .background(viewModel.theme.backgroundColor)
            .edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                                .frame(width: 24, height: 24)
                            
                            Text("Artists List")
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .onAppear {
                viewModel.startGyros()
            }
            .onDisappear {
                viewModel.stopGyros()
            }
            .alert("Failed to load artist data", isPresented: $viewModel.isErrorPresented, actions: {
                Button {
                    viewModel.isErrorPresented = false
                    viewModel.fetchArtist(for: viewModel.artwork)
                } label: {
                    Text("OK")
                }
                
                Button {
                    viewModel.isErrorPresented = false
                } label: {
                    Text("Cancel")
                }

            }, message: {
                Text("Do you wanna try to reload the artist data?")
            })
        }
    }
}

struct ArtworkDetail_Previews: PreviewProvider {
    static var previews: some View {
        let artwork = Artwork(id: 1,
                              title: "Artwork",
                              imageId: UUID(),
                              artistTitle: "Nicolas Fernandez",
                              artistId: 1)
        
        ArtworkDetail(viewModel: ArtworkDetailViewModel(artwork: artwork,
                                                        repository: MockArtistRepository(),
                                                        motionManager: DefaultMotionManager()))
    }
}
