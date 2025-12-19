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
/// in a `VStack`. Items are sized based on the provided `aspectRatio`, which determines
/// their aspect ratio and dimensions.
///
/// This layout is intended to support the `.groupVertical` case of `SHDCarouselLayout`,
/// allowing multiple items to be visible at once depending on the selected
/// `SHDCarouselItemAspectRatio` and device size. Vertical scrolling hides indicators for a
/// clean, content-focused browsing experience, while horizontal and vertical padding create
/// consistent spacing with other carousel layouts.
///
/// ## Parameters → Init
///
/// - `items`: An array of items conforming to `SHDCarouselRepresentable` to display in the vertical list.
///     Each item provides its own content view through the protocol's `content` property.
/// - `aspectRatio`: The `SHDCarouselItemAspectRatio` determining item dimensions and aspect ratios.
///
internal struct SHDVerticalCarousel<Item: SHDCarouselRepresentable>: View {

    var items: [Item]
    var aspectRation: SHDCarouselItemAspectRatio = .oneToOne

    var body: some View {
        ScrollView {
            VStack(spacing: .md) {
                ForEach(items) { item in
                    item.content
                        .aspectRatio(
                            aspectRation.aspectRatio,
                            contentMode: .fit
                        )
                }
            }
            .scrollIndicators(.hidden)
            .padding(.vertical, .xxs)
            .padding(.horizontal, .md)
        }
    }
    
    func aspectRatio(_ aspectRation: SHDCarouselItemAspectRatio) -> Self {
        mutating(keyPath: \.aspectRation, value: aspectRation)
    }
}
