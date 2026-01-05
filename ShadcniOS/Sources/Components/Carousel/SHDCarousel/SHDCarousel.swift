//
//  SHDCarousel.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/1/25.
//

import SwiftUI

/// A flexible carousel component for displaying collections of items
/// with multiple layout and aspect ratio configurations.
///
/// ## Discussion
///
/// `SHDCarousel` is a generic carousel component that displays a sequence of items
///     in a horizontally or vertically scrollable container.
/// It supports multiple layout variants (group horizontal, single horizontal, and group vertical)
///     and aspect ratio variants (1:1, 3:4, 16:9, and 3:4 with single item).
/// The component uses a `@ViewBuilder` closure to allow flexible content customization,
///     enabling you to render any SwiftUI view for each item in the carousel.
///
/// The carousel adapts its internal structure based on the selected layout variant:
/// - `Group Horizontal` (e.g., `.groupHorizontal(.oneToOne)`) displays multiple items in a horizontal scroll,
///     automatically switching to a paged carousel when the `.sixteenToNine`
///     aspect ratio is used for full-width presentation.
/// - `Single Horizontal` (`.singleHorizontal`) uses a paged carousel (paged scrolling)
///     for a single-item-at-a-time experience.
/// - `Group Vertical` (`.groupVertical`) presents items in a vertical scroll with customizable aspect ratios.
///
/// The component manages internal state for layout and aspect ratio variants through its modifier method
///  (`layoutVariant(_:)`), which accepts a layout variant that includes the aspect ratio.
/// This design follows SwiftUI's immutable value semantics while providing a fluent API for configuration.
///
/// Layout and spacing characteristics:
/// - Horizontal carousels: `.sm` horizontal padding, `.xxs` vertical padding
/// - Vertical carousel: `.md` horizontal padding, `.xxs` vertical padding
/// - Horizontal scroll uses `HStack` with `.md` spacing between items
/// - Vertical scroll uses `VStack` with `.md` spacing between items
/// - Items adapt their dimensions based on the selected aspect ratio variant
///
/// The carousel supports three layout variants:
/// - `.groupHorizontal(SHDCarouselItemAspectRatio)`: Multiple items visible horizontally,
///     automatically switches to paged carousel for `.sixteenToNine` aspect ratio
/// - `.singleHorizontal`: One item at a time with horizontal paging
/// - `.groupVertical`: Multiple items visible vertically in a scrollable container
///
/// The carousel supports four aspect ratio variants with proportional sizing:
/// - `.oneToOne`: Square items (45% container width × 45% width)
/// - `.threeToFour`: 3:4 aspect ratio items (40% width × 53% width)
/// - `.sixteenToNine`: 16:9 aspect ratio items (85% width × 48% width), commonly used for video content.
///     When used with `.groupHorizontal`, automatically switches to a paged carousel
///     for optimal presentation.
/// - `.threeToFourWithSingleItem`: Tall 3:4 aspect ratio optimized for
///     single-item layouts (90% width × 120% width)
///
/// Creates a carousel with the specified items.
///
/// The carousel will use the default layout (`.groupHorizontal(.oneToOne)`) variant
/// unless a different variant is applied using the `.layoutVariant(...)` modifier.
///
/// Items are provided as a `RandomAccessCollection` whose elements conform to `Identifiable`.
/// The visual content for each element is supplied via the initializer's `content` closure.
///
/// - Parameters:
///   - data: A `RandomAccessCollection` of `Identifiable` elements to display in the carousel.
///     The `content` closure is invoked for each element to produce its view.
///
/// ## Usage
///
/// ```swift
/// struct ColorItem: Identifiable {
///     var id = UUID()
///     var name: String
///     var color: Color
/// }
///
/// let colors = [
///     ColorItem(name: "Red", color: .red),
///     ColorItem(name: "Green", color: .green),
///     ColorItem(name: "Blue", color: .blue)
/// ]
///
/// SHDCarousel(colors) { item in
///     VStack {
///         Rectangle()
///             .fill(item.color)
///         Text(item.name)
///             .font(.headline)
///     }
///     .frame(maxWidth: .infinity, maxHeight: .infinity)
/// }
/// .layoutVariant(.groupHorizontal(.oneToOne))
/// ```
///
public struct SHDCarousel<Data, Content>: View
where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {

    @State private var hasExcededBounds: Bool = false
    private var data: Data
    private var content: (Data.Element) -> Content
    private var layoutVariant: SHDCarouselLayout = .groupHorizontal(.oneToOne)

    public init(
        _ data: Data,
        @ViewBuilder _ content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.content = content
    }

    public var body: some View {
        switch layoutVariant {
        case .groupHorizontal(let proportion):
            SHDHorizontalCarousel(
                hasExcededBounds: $hasExcededBounds,
                data: data,
                content: content
            )
            .aspectRatio(proportion)
        case .singleHorizontal:
            SHDHorizontalCarousel(
                hasExcededBounds: $hasExcededBounds,
                data: data,
                content: content
            )
            .aspectRatio(.threeToFourWithSingleItem)
        case .groupVertical:
            SHDVerticalCarousel(
                data: data,
                content: content
            )
            .aspectRatio(.sixteenToNine)
        }
    }

    /// Sets the layout variant for how items are arranged within the carousel.
    ///
    /// The layoutVariant(_:) modifier customizes how the carousel displays its items
    /// while keeping the items and content unchanged.
    ///
    /// - Parameters:
    ///     - layoutVariant: The `SHDCarouselLayout`
    ///         to apply (`.groupHorizontal`, `.singleHorizontal`, `.groupVertical`)
    public func layoutVariant(_ layoutVariant: SHDCarouselLayout)
        -> Self {
        mutating(keyPath: \.layoutVariant, value: layoutVariant)
    }
}

#Preview {
    SHDCarouselPreview()
}
