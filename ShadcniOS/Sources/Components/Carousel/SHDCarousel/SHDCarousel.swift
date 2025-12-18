//
//  SHDCarousel.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

/// A flexible carousel component for displaying collections of items
/// with multiple layout and proportion configurations.
///
/// ## Discussion
///
/// `SHDCarousel` is a generic carousel component that displays a sequence of items
///     in a horizontally or vertically scrollable container.
/// It supports multiple layout variants (group horizontal, single horizontal, and group vertical)
///     and proportion variants (1:1, 3:4, 16:9, and 3:4 with single item).
/// The component uses SwiftUI's `@ViewBuilder` to allow flexible content customization,
///     enabling you to render any SwiftUI view for each item in the carousel.
///
/// The carousel adapts its internal structure based on the selected layout variant:
/// - `Group Horizontal` (e.g., `.groupHorizonal(.oneToOne)`) displays multiple items in a horizontal scroll,
///     switching to a tab-based view when the `.sixteenToNine` proportion is used for full-width presentation.
/// - `Single Horizontal` (`.singleHorizonal`) uses a tab-based view (paged scrolling) for a single-item-at-a-time experience.
/// - `Group Vertical` (`.groupVertical`) presents items in a vertical scroll with customizable proportions.
///
/// The component manages internal state for layout and proportion variants through its modifier method
///  (`carouselLayoutVariant(_:)`), which accepts a layout variant that includes the proportion.
/// This design follows SwiftUI's immutable value semantics while providing a fluent API for configuration.
///
/// Layout and spacing characteristics:
/// - Horizontal padding: `.md` on sides, `.xxs` vertical padding
/// - Horizontal scroll uses `HStack` with `.md` spacing between items
/// - Vertical scroll uses `VStack` with customizable spacing
/// - Items adapt their dimensions based on the selected proportion variant
///
/// The carousel supports three layout variants:
/// - `.groupHorizonal(SHDCarouseItemAspectRatio)`: Multiple items visible horizontally, paged for `.sixteenToNine` proportion
/// - `.singleHorizonal`: One item at a time with horizontal paging
/// - `.groupVertical`: Multiple items visible vertically in a scrollable container
///
/// The carousel supports four proportion variants with proportional sizing:
/// - `.oneToOne`: Square items (45% container width × 45% width)
/// - `.threeToFour`: 3:4 aspect ratio items (40% width × 53% width)
/// - `.sixteenToNine`: 16:9 aspect ratio items (85% width × 48% width), commonly used for video content
/// - `.threeToFourWithSingleItem`: Tall 3:4 proportion optimized for
///     single-item layouts (90% width × 120% width)
///
/// Creates a carousel with the specified items and content view builder.
///
/// The carousel will use the default layout (`.groupHorizonal(.oneToOne)`) variant
/// unless a different variant is applied using the `.carouselLayoutVariant(...)` modifier.
///
/// - Parameters:
///   - items: An array of items to display in the carousel.
///     The carousel will create one view for each item using the provided content closure.
///   - content: A `@ViewBuilder` closure that takes an individual item and returns
///     the view to display for that item. This closure is called for each item in the carousel.
///
/// ## Usage
///
/// ```swift
/// let colors = ["Red", "Green", "Blue"]
///
/// SHDCarousel(items: colors) { colorName in
///     VStack {
///         Rectangle()
///             .fill(.red)
///         Text(colorName)
///             .font(.headline)
///     }
///     .frame(maxWidth: .infinity, maxHeight: .infinity)
/// }
/// .carouselLayoutVariant(.groupHorizonal(.oneToOne))
/// ```
///
public struct SHDCarousel<Item, Content: View>: View {

    private var items: [Item]
    private var modelItemView: (Item) -> Content
    private var layoutVariant: SHDCarouselLayout = .groupHorizonal(.oneToOne)

    public init(
        items: [Item],
        @ViewBuilder modelItemView: @escaping (Item) -> Content
    ) {
        self.items = items
        self.modelItemView = modelItemView
    }

    public var body: some View {
        switch layoutVariant {
        case .groupHorizonal(let proportion):
            SHDHorizontalCarousel(
                items: items,
                modelItemView: modelItemView,
                proportion: proportion
            )
        case .singleHorizonal:
            SHDCarouselTabView(
                items: items,
                modelItemView: modelItemView,
                proportion: SHDCarouseItemAspectRatio.threeToFourWithSingleItem
            )
        case .groupVertical:
            SHDVerticalCarousel(
                items: items,
                modelItemView: modelItemView,
                layoutVariant: layoutVariant,
                proportionVariant: SHDCarouseItemAspectRatio.sixteenToNine
            )
        }
    }

    /// Sets the layout variant for how items are arranged within the carousel.
    ///
    /// The carouselLayoutVariant(_:) modifier customizes how the carousel displays its items
    /// while keeping the items and content unchanged.
    ///
    /// - Parameters:
    ///     - layoutVariant: The `SHDCarouselLayout`
    ///         to apply (`.groupHorizonal`, `.singleHorizonal`, `.groupVertical`)
    public func carouselLayoutVariant(_ layoutVariant: SHDCarouselLayout)
        -> Self {
        mutating(keyPath: \.layoutVariant, value: layoutVariant)
    }
}

#Preview {
    SHDCarouselPreview()
}
