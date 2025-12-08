//
//  SHDLayoutCarouselItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/8/25.
//

import SwiftUI

struct SHDLayoutCarouselItem: ViewModifier {

    var layoutVariant: SHDCarouselLayoutVariant
    var proporcionVariant: SHDCarouselProportionVariant

    func body(content: Content) -> some View {
        switch layoutVariant {
        case .groupHorizonal:
            return AnyView(content.frame(width: proporcionVariant.width, height: proporcionVariant.height))
        case .singleHorizonal:
            return AnyView(content.frame(width: SHDCarouselProportionVariant.threeToFour.width, height: SHDCarouselProportionVariant.threeToFour.width))
        case .groupVertical:
            return AnyView(content.frame(width: SHDCarouselProportionVariant.sixteenToNine.width, height: SHDCarouselProportionVariant.sixteenToNine.height))
        }
    }
}

extension View {
    func horizontalFrameVariantion(
        layoutVariant: SHDCarouselLayoutVariant,
        proporcionVariant: SHDCarouselProportionVariant
    ) -> some View {
        modifier(
            SHDLayoutCarouselItem(
                layoutVariant: layoutVariant,
                proporcionVariant: proporcionVariant
            )
        )
    }
}
