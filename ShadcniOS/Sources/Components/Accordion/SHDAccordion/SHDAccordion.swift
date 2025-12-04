//
//  SHDAccordion.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import SwiftUI

// MARK: - Accordion component

/// A customizable accordion view that displays a list of expandable items.
///
/// ## Discussion
/// This component is useful for interfaces that require hierarchical or
/// collapsible content, such as FAQs, grouped settings, step-by-step guides, or
/// disclosure-based layouts. Internally, the accordion manages the currently
/// expanded item using state, allowing seamless propagation of selection changes
/// across all rendered `SHDAccordionItem` views.
///
/// The appearance and layout of the accordion can be customized via the
/// `accordionSize(_:)` modifier, which adjusts the spacing and size parameters
/// according to a predefined `SHDAccordionSize` value.
///
/// ## Parameters
/// ### Init
/// - items: An array of elements conforming to `SHDAccordionRepresentable`.
///   These values define both the displayable header and expandable content
///   of each accordion row.
///
/// ## Usage
/// ```swift
/// struct FAQItem: SHDAccordionRepresentable {
///     let title: String
///     let content: String
/// }
///
/// let faqItems = [
///     FAQItem(title: "Is it accessible?",
///             content: "Yes. It adheres to the WAI-ARIA design pattern."),
///     FAQItem(title: "Is it animated?",
///             content: "Yes. It provides a smooth, spring-based animation.")
/// ]
///
/// SHDAccordion(items: faqItems)
///    .accordionSize(size: .md)
/// ```
public struct SHDAccordion<Item: SHDAccordionRepresentable>: View {

    @State private var selectedItem: Item?
    private var size: SHDAccordionSize = .md
    private var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public var body: some View {
        VStack(spacing: size.verticalSpacing) {
            ForEach(items, id: \.self) { item in
                SHDAccordionItem(selection: $selectedItem, item: item)
                    .itemSize(size: size)
            }
        }
    }

    /// Returns a  modified accordion view with the specified size style
    ///
    /// - Parameters: 
    ///     - size: The size preset to apply to all accordion items
    public func accordionSize(size: SHDAccordionSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}
