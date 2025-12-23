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
/// SwiftUI's `ScrollView` with page-based navigation. This component displays one item at a time with
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
/// customization of aspect ratios through the `aspectRatio(_:)` modifier.
/// This component is used internally by `SHDCarousel` and should not be directly instantiated by consumers.
///
/// ## Usage
///
/// ```swift
/// struct PhotoItem: Identifiable {
///     var id = UUID()
///     var url: URL
/// }
///
/// SHDHorizontalPagedCarousel(
///     data: photos
/// ) { photo in
///     AsyncImage(url: photo.url)
/// }
/// .aspectRatio(.threeToFourWithSingleItem)
/// ```
///
internal struct SHDHorizontalPagedCarousel<Data, Content>: View
where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {

    @State private var scrollID: Data.Element.ID?
    @State private var currentPage = 0
    var data: Data
    var content: (Data.Element) -> Content
    var aspectRatio: SHDCarouselItemAspectRatio = .oneToOne
    private let spacing: CGFloat = 12

    var body: some View {
        VStack(spacing: .sm) {
            GeometryReader { proxy in
                let containerWidth = proxy.size.width
                let itemWidth = containerWidth * aspectRatio.widthFactor
                let itemHeight = itemWidth / aspectRatio.aspectRatio
                let sideInsight = (containerWidth - itemWidth) / 2

                ScrollView(.horizontal) {
                    LazyHStack(spacing: spacing) {
                        ForEach(data) { item in
                            content(item)
                                .frame(width: itemWidth, height: itemHeight)
                                .id(item.id)
                        }
                    }
                    .scrollTargetLayout()
                }
                .contentMargins(.horizontal, sideInsight, for: .scrollContent)
                .scrollPosition(id: $scrollID)
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
                .frame(height: itemHeight)
                .onChange(of: scrollID) { newValue in
                    guard let newValue else { return }
                    if let index = data.firstIndex(where: { $0.id == newValue }) {
                        withAnimation(.spring()) {
                            currentPage = data.distance(from: data.startIndex, to: index)
                        }
                    }
                }
            }
            .aspectRatio(aspectRatio.effectiveAspectRatio, contentMode: .fit)

            indicators
        }
        .onAppear {
            scrollID = data.first?.id
        }
        .padding(.vertical, .xxs)
        .padding(.horizontal, .sm)
    }

    private var indicators: some View {
        HStack(spacing: .sm) {
            ForEach(0..<data.count) { idx in
                Circle()
                    .fill(idx == currentPage
                          ? SHDColor.foregroundDefault.color
                          : SHDColor.foregroundDefault.color.opacity(0.3))
                    .frame(width: 8, height: 8)
            }
        }
    }

    /// Sets the aspect ratio for items displayed in the paged carousel.
    ///
    /// This modifier allows customization of item dimensions specifically for single-item paging layouts,
    /// such as adjusting the aspect ratio and size for featured content presentation. The aspect ratio
    /// affects both the width factor and aspect ratio calculations used to determine item dimensions
    /// within the scrollable container.
    ///
    /// - Parameters:
    ///   - aspectRatio: The `SHDCarouselItemAspectRatio` to apply to the carousel items
    func aspectRatio(_ aspectRatio: SHDCarouselItemAspectRatio) -> Self {
        mutating(keyPath: \.aspectRatio, value: aspectRatio)
    }
}

#Preview {
    SHDCarouselPreview()
}
