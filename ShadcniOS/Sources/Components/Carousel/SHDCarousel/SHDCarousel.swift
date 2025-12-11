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
/// The carousel adapts its internal structure based on the selected layout and proportion variants:
/// - `Group Horizontal` displays multiple items in a horizontal scroll, switching to a tab-based
///     view when the 16:9 proportion is selected for full-width presentation.
/// - `Single Horizontal` uses a tab-based view (paged scrolling) for a single-item-at-a-time experience.
/// - `Group Vertical` presents items in a vertical scroll with customizable proportions.
///
/// The component manages internal state for layout and proportion variants through its modifier methods
///  (`carouselLayoutVariant(_:)` and `carouselProportionVariant(_:)`).
/// This design follows SwiftUI's immutable value semantics while providing a fluent API for configuration.
///
/// Layout and spacing characteristics:
/// - Horizontal padding: `.md` on sides, `.xxs` vertical padding
/// - Horizontal scroll uses `HStack` with `.md` spacing between items
/// - Vertical scroll uses `VStack` with customizable spacing
/// - Items adapt their dimensions based on the selected proportion variant
///
/// The carousel supports four layout variants:
/// - `.groupHorizonal`: Multiple items visible horizontally, paged for 16:9 proportions
/// - `.singleHorizonal`: One item at a time with horizontal paging
/// - `.groupVertical`: Multiple items visible vertically in a scrollable container
///
/// The carousel supports four proportion variants:
/// - `.oneToOne`: Square items (212×212 points)
/// - `.threeToFour`: 3:4 aspect ratio items (159×212 points)
/// - `.sixteenToNine`: 16:9 aspect ratio items (377×212 points), commonly used for video content
/// - `.threeToFourWithSingleItem`: Tall 3:4 proportion optimized for single-item layouts (380×507 points)
///
/// Creates a carousel with the specified items and content view builder.
///
/// The carousel will use the default layout (`.groupHorizonal`) and proportion (`.oneToOne`) variants
/// unless different variants are applied using the `.carouselLayoutVariant(...)` and
/// `.carouselProportionVariant(...)` modifiers.
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
/// .carouselLayoutVariant(.groupHorizonal)
/// .carouselProportionVariant(.oneToOne)
/// ```
///
public struct SHDCarousel<Item, Content: View>: View {

    private var items: [Item]
    private var content: (Item) -> Content
    private var layoutVariant: SHDCarouselLayoutVariant = .groupHorizonal
    private var proportionVariant: SHDCarouselProportionVariant = .oneToOne

    private var carouselContent: some View {
        SHDCarouselItem(
            layoutVariant: layoutVariant,
            proportionVariant: proportionVariant,
            items: items,
            content: content
        )
    }

    private var carouselPagedContent: some View {
        SHDCarouselTabView(
            layoutVariant: layoutVariant,
            proportionVariant: proportionVariant,
            items: items,
            content: content
        )
        .singleProportionVariant(
            layoutVariant == .groupHorizonal
                ? proportionVariant : .threeToFourWithSingleItem
        )
    }

    public init(
        items: [Item],
        @ViewBuilder content: @escaping (Item) -> Content
    ) {
        self.items = items
        self.content = content
    }

    public var body: some View {
        Group {
            switch layoutVariant {
            case .groupHorizonal:
                if proportionVariant == .sixteenToNine {
                    carouselPagedContent
                        .padding(.vertical, .xxs)
                        .padding(.horizontal, .md)
                } else {
                    SHDCarouselGroupHorizontal(
                        items: items,
                        proportionVariant: proportionVariant,
                        content: content
                    )
                }

            case .singleHorizonal:
                carouselPagedContent
                    .padding(.vertical, .xxs)
                    .padding(.horizontal, .md)

            case .groupVertical:
                ScrollView(showsIndicators: false) {
                    VStack {
                        carouselContent
                    }
                    .padding(.vertical, .xxs)
                    .padding(.horizontal, .md)

                }
            }
        }
    }

    /// Sets the layout variant for how items are arranged within the carousel.
    ///
    /// The carouselLayoutVariant(_:) modifier customizes how the carousel displays its items
    /// while keeping the items and content unchanged.
    ///
    /// - Parameters:
    ///     - layoutVariant: The `SHDCarouselLayoutVariant`
    ///         to apply (`.groupHorizonal`, `.singleHorizonal`, `.groupVertical`)
    public func carouselLayoutVariant(_ layoutVariant: SHDCarouselLayoutVariant)
        -> Self {
        mutating(keyPath: \.layoutVariant, value: layoutVariant)
    }

    /// Sets the proportion variant to configure item dimensions and aspect ratios.
    ///
    /// The carouselProportionVariant(_:) modifier customizes the dimensions and aspect ratios
    /// of carousel items while keeping the items and content unchanged.
    ///
    /// - Parameters:
    ///     - proportionVariant: The `SHDCarouselProportionVariant`
    ///         to apply (`.oneToOne`, `.threeToFour`, `.sixteenToNine`, `.threeToFourWithSingleItem`)
    public func carouselProportionVariant(
        _ proportionVariant: SHDCarouselProportionVariant
    ) -> Self {
        mutating(keyPath: \.proportionVariant, value: proportionVariant)
    }
}

#Preview {
    SHDCarouselPreview()
}
