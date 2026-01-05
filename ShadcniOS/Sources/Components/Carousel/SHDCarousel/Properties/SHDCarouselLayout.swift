//
//  SHDCarouselLayout.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

/// Defines how carousel items are arranged and displayed within the container.
///
/// ## Discussion
///
/// `SHDCarouselLayout` controls the presentation mode and scroll direction of carousel items.
/// The layout variant determines whether multiple items are visible simultaneously or one item at a time,
/// and whether scrolling occurs horizontally or vertically.
///
/// The three layout variants provide different user experiences:
/// - `Group Horizontal` displays multiple items visible at once in a horizontal scroll container,
///   allowing users to see context from adjacent items. When used with the `.sixteenToNine` aspect ratio
///   (e.g., `.groupHorizontal(.sixteenToNine)`) and bounds are not exceeded, it automatically switches to a paged carousel
///   for a full-width, single-item-at-a-time experience.
/// - `Single Horizontal` uses a paged carousel for horizontal browsing,
///   displaying one item at a time with page indicators. This variant is ideal for photo galleries
///   and image-focused carousels.
/// - `Group Vertical` arranges items vertically in a scrollable container, allowing multiple items
///   to be visible at once depending on screen size and item aspect ratios. This variant is useful for
///   displaying lists of similar items in portrait orientation.
///
/// Layout behavior:
/// - Horizontal layouts apply `.sm` horizontal padding and `.xxs` vertical padding
/// - Vertical layout applies `.md` horizontal padding and `.xxs` vertical padding
/// - Group layouts use `HStack` (horizontal) or `VStack` (vertical) with `.md` spacing between items
/// - Single Horizontal automatically provides visual page indicators for navigation
///
/// ## Usage
///
/// ```swift
/// struct ProductItem: Identifiable {
///     var id = UUID()
///     var product: Product
/// }
///
/// SHDCarousel(products) { item in
///     ProductCard(product: item.product)
/// }
/// .layoutVariant(.groupHorizontal(.threeToFour))
///
/// struct ImageItem: Identifiable {
///     var id = UUID()
///     var url: URL
/// }
///
/// SHDCarousel(images) { item in
///     AsyncImage(url: item.url)
/// }
/// .layoutVariant(.singleHorizontal)
/// ```
///
public enum SHDCarouselLayout: Equatable, Hashable {
    /// Multiple items visible in a horizontal scroll.
    ///
    /// Items are displayed side-by-side with `.md` spacing.
    /// When using the `.sixteenToNine` aspect ratio variant (and bounds are not exceeded),
    /// automatically switches to a paged carousel for full-width presentation.
    case groupHorizontal(SHDCarouselItemAspectRatio)

    /// Single item at a time with horizontal paging.
    ///
    /// Items are displayed one per "page" with animated paging transitions and optional page indicators.
    /// This layout is optimal for sequential browsing experiences.
    case singleHorizontal

    /// Multiple items visible in a vertical scroll.
    ///
    /// Items are stacked vertically with customizable spacing, allowing multiple items to be visible
    /// depending on aspect ratio variant and device screen size.
    case groupVertical
}
