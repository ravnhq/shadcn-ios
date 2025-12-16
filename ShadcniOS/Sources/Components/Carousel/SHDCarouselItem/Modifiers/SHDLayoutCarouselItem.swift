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
/// The modifier applies layout-aware aspect ratios instead of fixed pixel sizes:
/// - `Group Horizontal`: Uses the provided `proportionVariant` aspect ratio so sizing stays responsive
/// - `Single Horizontal`: Locks to the tall `.threeToFourWithSingleItem` aspect ratio for paged layouts
/// - `Group Vertical`: Locks to the wide `.sixteenToNine` aspect ratio for vertical scrolling contexts
///
/// Using aspect ratios keeps the items fluid so their final width and height can adapt to the parent
/// container (for example, geometry-driven layouts) while still maintaining consistent proportions.
///
internal struct SHDLayoutCarouselItem: ViewModifier {

    var layoutVariant: SHDCarouselLayout
    var proportionVariant: SHDCarouseItemAspectRatio

    func body(content: Content) -> some View {
        switch layoutVariant {
        case .groupHorizonal:
            content
                .aspectRatio(
                    proportionVariant.aspectRatio,
                    contentMode: .fit
                )
        case .singleHorizonal:
            content
                .aspectRatio(
                    SHDCarouseItemAspectRatio.threeToFourWithSingleItem.aspectRatio,
                    contentMode: .fit
                )

        case .groupVertical:
            content
                .aspectRatio(
                    SHDCarouseItemAspectRatio.sixteenToNine.aspectRatio,
                    contentMode: .fit
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
extension View {
    func horizontalFrameVariantion(
        layoutVariant: SHDCarouselLayout,
        proportionVariant: SHDCarouseItemAspectRatio
    ) -> some View {
        modifier(
            SHDLayoutCarouselItem(
                layoutVariant: layoutVariant,
                proportionVariant: proportionVariant
            )
        )
    }
}
