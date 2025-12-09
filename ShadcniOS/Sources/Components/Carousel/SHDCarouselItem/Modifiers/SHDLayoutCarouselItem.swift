//
//  SHDLayoutCarouselItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/8/25.
//

import SwiftUI

/// A view modifier that applies layout-specific frame sizing to carousel items.
///
/// ## Discussion
///
/// `SHDLayoutCarouselItem` is an internal view modifier that automatically applies appropriate
/// frame dimensions to carousel items based on the carousel's layout and proportion variants.
/// This ensures consistent sizing across different layout modes while allowing the underlying
/// content view to adapt to its assigned dimensions.
///
/// The modifier applies different sizing strategies:
/// - `Group Horizontal`: Uses the exact dimensions specified by the `proportionVariant`
/// - `Single Horizontal`: Always uses the tall `.threeToFourWithSingleItem` dimensions (380×507 points)
///   to maximize vertical space for prominent content in paged browsing
/// - `Group Vertical`: Always uses the wide `.sixteenToNine` dimensions (377×212 points)
///   to maintain consistent horizontal presentation in vertical scrolling
///
/// Frame sizing is applied as a fixed constraint, preventing content from expanding or contracting
/// beyond the designated dimensions. This maintains visual consistency and predictable spacing in carousels.
///
internal struct SHDLayoutCarouselItem: ViewModifier {

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

/// Applies layout-specific frame sizing to a carousel item view.
///
/// This modifier adjusts the frame dimensions of the view based on the carousel's layout mode,
/// ensuring that items are consistently sized within their presentation context.
///
/// - Parameters:
///   - layoutVariant: The carousel's layout variant that determines sizing strategy
///   - proportionVariant: The carousel's proportion variant used for group horizontal layouts
internal extension View {
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
