//
//  CenterFullWidthModifier.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import SwiftUI

extension View {
    func centerFullWidth() -> some View {
        self.modifier(CenterFullWidthModifier())
    }
}

struct CenterFullWidthModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, alignment: .center)
    }
}
