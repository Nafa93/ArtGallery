//
//  PrimaryButtonStyle.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(16)
            .background(Color.blue)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

extension View {
    func primaryButtonStyle() -> some View {
        self.buttonStyle(PrimaryButtonStyle())
    }
}
