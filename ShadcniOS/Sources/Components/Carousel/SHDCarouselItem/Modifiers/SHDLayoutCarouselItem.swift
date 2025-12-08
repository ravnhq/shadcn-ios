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
            content
                .frame(
                    width: proporcionVariant.width,
                    height: proporcionVariant.height
                )
        case .singleHorizonal:
            content
                .frame(
                    width: SHDCarouselProportionVariant.threeToFourWithSingleItem.width,
                    height: SHDCarouselProportionVariant.threeToFourWithSingleItem.height
                )

        case .groupVertical:
            content
                .frame(
                    width: SHDCarouselProportionVariant.sixteenToNine.width,
                    height: SHDCarouselProportionVariant.sixteenToNine.height
                )
        }
    }
}

extension View {
    func horizontalFrameVariantion(
        layoutVariant: SHDCarouselLayoutVariant,
        proportionVariant: SHDCarouselProportionVariant
    ) -> some View {
        modifier(
            SHDLayoutCarouselItem(
                layoutVariant: layoutVariant,
                proporcionVariant: proportionVariant
            )
        )
    }
}
