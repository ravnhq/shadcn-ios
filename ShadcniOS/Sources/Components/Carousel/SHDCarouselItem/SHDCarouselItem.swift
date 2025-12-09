//
//  SHDCarouselItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

/// An internal view component that renders carousel items with layout and proportion-based styling.
///
/// ## Discussion
///
/// `SHDCarouselItem` is a container view that renders a collection of items using a `ForEach` loop.
/// Each item is rendered using the provided `content` closure and automatically sized based on the
/// specified `layoutVariant` and `proportionVariant`. This component handles the internal layout logic
/// for group-based carousel presentations (both horizontal and vertical groups).
///
/// The component applies frame dimensions and sizing through the `horizontalFrameVariantion(_:_:)` modifier,
/// which automatically adapts item sizes based on the carousel's layout mode:
/// - `Group Horizontal` uses the exact dimensions from the proportion variant
/// - `Single Horizontal` uses the tall `.threeToFourWithSingleItem` dimensions for full-height paging
/// - `Group Vertical` uses the wide `.sixteenToNine` dimensions for consistent horizontal presentation
///
/// This component is used internally by `SHDCarousel` and should not be directly instantiated by consumers.
/// The sizing and layout logic is encapsulated to maintain consistency across the carousel family.
///
/// ## Usage
///
/// ```swift
/// SHDCarouselItem(
///     layoutVariant: .groupHorizonal,
///     proportionVariant: .oneToOne,
///     items: products,
///     content: { product in
///         ProductCard(product: product)
///     }
/// )
/// ```
///
internal struct SHDCarouselItem<Item, Content: View>: View {

    var layoutVariant: SHDCarouselLayoutVariant
    var proportionVariant: SHDCarouselProportionVariant
    var items: [Item]
    var content: (Item) -> Content

    var body: some View {
        ForEach(Array(items.enumerated()), id: \.offset) { _, item in
            content(item)
                .horizontalFrameVariantion(
                    layoutVariant: layoutVariant,
                    proportionVariant: proportionVariant
                )
        }
    }
}
