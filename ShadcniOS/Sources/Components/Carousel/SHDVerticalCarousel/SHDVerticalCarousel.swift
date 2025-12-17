//
//  SHDVerticalCarousel.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/15/25.
//

import SwiftUI

/// An internal vertical scroll container for presenting carousel items in a column.
///
/// ## Discussion
///
/// `SHDVerticalCarousel` renders carousel items inside a vertical `ScrollView`, stacking them
/// in a `VStack`. It delegates the actual item rendering and sizing to `SHDCarouselItem`,
/// which applies layout- and proportion-aware frames using the provided
/// `layoutVariant` and `proportionVariant`.
///
/// This layout is intended to support the `.groupVertical` case of `SHDCarouselLayout`,
/// allowing multiple items to be visible at once depending on the selected
/// `SHDCarouseItemAspectRatio` and device size. Vertical scrolling hides indicators for a
/// clean, content-focused browsing experience, while horizontal and vertical padding create
/// consistent spacing with other carousel layouts.
///
/// ## Parameters → Init
///
/// - `items`: An array of items to display in the vertical list.
/// - `layoutVariant`: The `SHDCarouselLayout` controlling layout semantics
///     (typically `.groupVertical` for this type).
/// - `proportionVariant`: The `SHDCarouseItemAspectRatio` determining item dimensions.
/// - `content`: A `@ViewBuilder` closure that takes an individual item and returns
///     the view to display for that item.
///
internal struct SHDVerticalCarousel<Item, Content: View>: View {

    var items: [Item]
    var modelItemView: (Item) -> Content
    var layoutVariant: SHDCarouselLayout = .groupHorizonal(.oneToOne)
    var proportionVariant: SHDCarouseItemAspectRatio = .oneToOne

    var body: some View {
        ScrollView {
            VStack(spacing: .md) {
                ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                    modelItemView(item)
                        .aspectRatio(
                            SHDCarouseItemAspectRatio.sixteenToNine.aspectRatio,
                            contentMode: .fit
                        )
                }
            }
            .scrollIndicators(.hidden)
            .padding(.vertical, .xxs)
            .padding(.horizontal, .md)
        }
    }
}
