//
//  SHDCarouselRepresentable.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/19/25.
//

import SwiftUI

/// A protocol that defines the requirements for items displayed in a carousel.
///
/// ## Discussion
///
/// `SHDCarouselRepresentable` is a protocol that carousel items must conform to in order
/// to be displayed in an `SHDCarousel`. The protocol ensures that each item can provide
/// its own view content and can be uniquely identified.
///
/// Conforming types must:
/// - Inherit `Identifiable` conformance (provided by the protocol)
/// - Provide a `content` property that returns a SwiftUI `View`
///
/// The `content` property is marked with `@ViewBuilder`, allowing you to use SwiftUI's
/// view builder syntax to compose complex views for each carousel item.
///
/// ## Usage
///
/// ```swift
/// struct ProductItem: SHDCarouselRepresentable {
///     var id = UUID()
///     var product: Product
///
///     var content: some View {
///         VStack {
///             AsyncImage(url: product.imageURL)
///             Text(product.name)
///                 .font(.headline)
///         }
///     }
/// }
///
/// let products = [
///     ProductItem(product: product1),
///     ProductItem(product: product2),
///     ProductItem(product: product3)
/// ]
///
/// SHDCarousel(items: products)
///     .layoutVariant(.groupHorizontal(.threeToFour))
/// ```
///
public protocol SHDCarouselRepresentable: Identifiable {
    /// The view content to display for this carousel item.
    ///
    /// This property is called by the carousel to render each item's view.
    /// Use SwiftUI's view builder syntax to compose the item's visual representation.
    associatedtype Content: View
    @ViewBuilder var content: Content { get }
}
