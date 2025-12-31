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
/// - `data`: A `RandomAccessCollection` of `Identifiable` elements to display in the vertical list.
/// - `content`: A view-builder closure that returns the view for a given element.
/// - `aspectRatio`: The `SHDCarouselItemAspectRatio` determining item dimensions and aspect ratios.
///
internal struct SHDVerticalCarousel<Data, Content>: View
where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {

    var data: Data
    var content: (Data.Element) -> Content
    var aspectRatio: SHDCarouselItemAspectRatio = .oneToOne

    var body: some View {
        ScrollView {
            VStack(spacing: .md) {
                ForEach(data) { item in
                    content(item)
                        .aspectRatio(
                            aspectRatio.aspectRatio,
                            contentMode: .fit
                        )
                }
            }
            .scrollIndicators(.hidden)
            .padding(.vertical, .xxs)
            .padding(.horizontal, .md)
        }
    }

    /// Sets the aspect ratio for items displayed in the vertical carousel.
    ///
    /// This modifier allows customization of item dimensions for vertical scrolling layouts.
    /// The aspect ratio affects how items are sized within the vertical scrollable container.
    ///
    /// - Parameters:
    ///   - aspectRatio: The `SHDCarouselItemAspectRatio` to apply to the carousel items
    func aspectRatio(_ aspectRatio: SHDCarouselItemAspectRatio) -> Self {
        mutating(keyPath: \.aspectRatio, value: aspectRatio)
    }
}
