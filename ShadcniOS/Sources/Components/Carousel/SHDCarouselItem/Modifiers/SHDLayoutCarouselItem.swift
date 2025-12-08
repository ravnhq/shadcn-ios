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
                    width: SHDCarouselProportionVariant.threeToFour.width,
                    height: SHDCarouselProportionVariant.threeToFour.height
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

struct SHDProportionCarouselItem: ViewModifier {

    var proporcionVariant: SHDCarouselProportionVariant

    func body(content: Content) -> some View {
        switch proporcionVariant {
        case .oneToOne: content
        case .threeToFour: content
        case .sixteenToNine: content
        }
    }
}
