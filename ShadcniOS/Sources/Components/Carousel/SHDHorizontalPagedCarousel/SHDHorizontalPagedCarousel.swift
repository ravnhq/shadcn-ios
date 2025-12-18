//
//  SHDHorizontalPagedCarousel.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/8/25.
//

import SwiftUI

/// An internal paged carousel component that displays items one at a time with page indicators.
///
/// ## Discussion
///
/// `SHDHorizontalPagedCarousel` is a specialized carousel container that presents items using
/// SwiftUI's `TabView` with page-based navigation. This component displays one item at a time with
/// smooth animated transitions between pages, and includes visual page indicators (dots) at the bottom
/// for user orientation.
///
/// The component uses `ScrollView(.horizontal)` with `scrollTargetBehavior(.viewAligned)` to achieve
/// page-based navigation, where each item snaps into view when scrolled. The implementation leverages
/// `scrollPosition(id:)` to track the current page and `scrollTargetLayout()` to
/// enable view-aligned snapping.
///
/// The component is designed for single-item-at-a-time browsing experiences, making it ideal for:
/// - Photo galleries with featured image display
/// - Featured content showcases with one prominent item
/// - Product carousels in e-commerce contexts
/// - Story-like sequential content navigation
///
/// The component manages internal state (`currentPage` and `scrollID`) to track the active page and supports
/// customization of proportion variants through the `proportionVariant(_:)` modifier.
/// This component is used internally by `SHDCarousel` and should not be directly instantiated by consumers.
///
/// ## Usage
///
/// ```swift
/// SHDHorizontalPagedCarousel(
///     items: photos,
///     modelItemView: { photo in
///         AsyncImage(url: photo.url)
///     },
///     proportion: .threeToFourWithSingleItem
/// )
/// ```
///
internal struct SHDHorizontalPagedCarousel<Item, Content: View>: View {

    @State private var scrollID: Int? = 0
    @State private var currentPage = 0
    var items: [Item]
    var modelItemView: (Item) -> Content
    var proportion: SHDCarouseItemAspectRatio

    var body: some View {
        VStack(spacing: .sm) {
            GeometryReader { proxy in
                let containerWidth = proxy.size.width
                let itemWidth = containerWidth * proportion.widthFactor
                let itemHeight = itemWidth / proportion.aspectRatio

                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                            modelItemView(item)
                                .frame(width: itemWidth, height: itemHeight)
                                .id(index)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollPosition(id: $scrollID)
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .frame(width: containerWidth, height: itemHeight)
                .onChange(of: scrollID) { newValue in
                    if let newValue {
                        withAnimation(.spring()) {
                            currentPage = newValue
                        }
                    }
                }
            }
            .aspectRatio(proportion.effectiveAspectRatio, contentMode: .fit)

            indicators
        }
        .padding(.vertical, .xxs)
        .padding(.horizontal, .sm)
    }

    private var indicators: some View {
        HStack(spacing: .sm) {
            ForEach(0..<items.count, id: \.self) { idx in
                Circle()
                    .fill(idx == currentPage
                          ? SHDColor.foregroundDefault.color
                          : SHDColor.foregroundDefault.color.opacity(0.3))
                    .frame(width: 8, height: 8)
            }
        }
    }

    /// Sets the proportion variant for items displayed in the paged carousel.
    ///
    /// This modifier allows customization of item dimensions specifically for single-item paging layouts,
    /// such as adjusting the aspect ratio and size for featured content presentation. The proportion
    /// affects both the width factor and aspect ratio calculations used to determine item dimensions
    /// within the scrollable container.
    ///
    /// - Parameters:
    ///   - proportion: The `SHDCarouseItemAspectRatio` to apply to the carousel items
    func proportionVariant(_ proportion: SHDCarouseItemAspectRatio) -> Self {
        mutating(keyPath: \.proportion, value: proportion)
    }
}

#Preview {
    SHDCarouselPreview()
}
