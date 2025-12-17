//
//  SHDCarouselTabView.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/8/25.
//

import SwiftUI

/// An internal paged carousel component that displays items one at a time with page indicators.
///
/// ## Discussion
///
/// `SHDCarouselTabView` is a specialized carousel container that presents items using SwiftUI's `TabView`
/// with page-based navigation. This component displays one item at a time with smooth animated transitions
/// between pages, and includes visual page indicators (dots) at the bottom for user orientation.
///
/// The component is designed for single-item-at-a-time browsing experiences, making it ideal for:
/// - Photo galleries with featured image display
/// - Featured content showcases with one prominent item
/// - Product carousels in e-commerce contexts
/// - Story-like sequential content navigation
///
/// The component manages internal state (`currentPage`) to track the active page and supports
/// customization of proportion variants through the `singleProportionVariant(_:)` modifier.
/// This component is used internally by `SHDCarousel` and should not be directly instantiated by consumers.
///
/// ## Usage
///
/// ```swift
/// SHDCarouselTabView(
///     layoutVariant: .singleHorizonal,
///     proportionVariant: .threeToFourWithSingleItem,
///     items: photos,
///     content: { photo in
///         AsyncImage(url: photo.url)
///     }
/// )
/// .singleProportionVariant(.threeToFourWithSingleItem)
/// ```
///
internal struct SHDCarouselTabView<Item, Content: View>: View {

    @State private var currentPage = 0
    var layoutVariant: SHDCarouselLayout
    var proportionVariant: SHDCarouseItemAspectRatio
    var items: [Item]
    var modelItemView: (Item) -> Content

    var body: some View {
        VStack(spacing: .sm) {
            GeometryReader { proxy in
                let containerWidth = proxy.size.width
                let itemWidth = containerWidth * proportionVariant.widthFactor
                let itemHeight = itemWidth / proportionVariant.aspectRatio

                TabView(selection: $currentPage) {
                    ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                        modelItemView(item)
                            .frame(width: itemWidth, height: itemHeight)
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(width: containerWidth, height: itemHeight)
            }
            .aspectRatio(
                proportionVariant.aspectRatio / proportionVariant.widthFactor,
                contentMode: .fit
            )

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
    /// such as adjusting the aspect ratio and size for featured content presentation.
    ///
    /// - Parameters:
    ///   - proportionVariant: The `SHDCarouseItemAspectRatio` to apply to the carousel items
    func proportionVariant(_ proportionVariant: SHDCarouseItemAspectRatio) -> Self {
        mutating(keyPath: \.proportionVariant, value: proportionVariant)
    }
}

#Preview {
    SHDCarouselPreview()
}
