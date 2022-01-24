//
//  LeadingFullWidthModifier.swift
//  ArtGallery (iOS)
//
//  Created by Nicolas Alejandro Fernandez Amorosino on 24/01/2022.
//

import SwiftUI

extension View {
    func leadingFullWidth() -> some View {
        self.modifier(LeadingFullWidthModifier())
    }
}

struct LeadingFullWidthModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, alignment: .leading)
    }
}
