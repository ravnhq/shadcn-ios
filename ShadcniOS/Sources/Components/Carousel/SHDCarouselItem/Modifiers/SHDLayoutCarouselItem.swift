//
//  SHDLayoutCarouselItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/8/25.
//

import SwiftUI

struct SHDLayoutCarouselItem: ViewModifier {

    var layoutVariant: SHDCarouselLayoutVariant
    var proporcionVariant: SHDCarouselProprotionVariant

    func body(content: Content) -> some View {
        switch layoutVariant {
        case .groupVertical:
            return AnyView(content.frame(width: 398, height: 212))
        default:
            return AnyView(content.frame(width: proporcionVariant.width, height: proporcionVariant.height))
        }
    }
}

extension View {
    func horizontalFrameVariantion(
        layoutVariant: SHDCarouselLayoutVariant,
        proporcionVariant: SHDCarouselProprotionVariant
    ) -> some View {
        modifier(
            SHDLayoutCarouselItem(
                layoutVariant: layoutVariant,
                proporcionVariant: proporcionVariant
            )
        )
    }
}
