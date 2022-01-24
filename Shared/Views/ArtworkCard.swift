//
//  ArtworkCard.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import SwiftUI

struct ArtworkCard: View {
    var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
            
            HStack {
                Text(title)
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .padding(16)
        }
        .padding(.horizontal, 24)
        .foregroundColor(.white)
    }
}

struct ArtworkCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ArtworkCard(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vitae sagittis augue. Proin id tortor mi. Pellentesque dignissim scelerisque laoreet. Donec at sem augue. Sed tincidunt vestibulum eleifend.")
            
            Spacer().layoutPriority(1)
        }
    }
}
