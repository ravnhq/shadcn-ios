//
//  SHDAccordion.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import SwiftUI

// MARK: - Accordion component

/// A customizable accordion view that displays a list of expandable items
///
/// The `SHDAccordion` component renders a vertically stacked list of items
/// conforming to the `SHDAccordionRepresentable` protocol
/// Each item can be individually expanded to reveal its content, while
/// automatically collapsing any other expanded item
///
/// This component is ideal for FAQs, collapsible sections, or any
/// situation where content should be organized in an expandable format
///
/// Example usage:
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
///     .accordionStyle(size: .md)
/// ```
///
/// The accordion ensures only one item is expanded at a time by tracking
/// the currently expanded in its internal state
public struct SHDAccordion<Item: SHDAccordionRepresentable>: View {

    // MARK: - Properties

    /// the size variant that defines the visual appearance of the accordion items
    private var size: SHDAccordionSize = .md

    /// The index of the currently expanded accordion item
    @State var selectedItem: Item?

    /// The collection of items displayed in the accordion
    public var items: [Item]

    // MARK: - Initialization

    /// Creates a new accordion view with the specified list of items
    ///
    /// - Parameter items: The list of items conforming to `SHDAccordionRepresentable`
    ///   to be displayed in the accordion
    public init(items: [Item]) {
        self.items = items
    }

    // MARK: - Body

    public var body: some View {
        VStack {
            ForEach(items, id: \.self) { item in
                SHDAccordionItem(selection: $selectedItem, item: item)
                    .accordionItemSize(size: size)
            }
        }
    }

    // MARK: - Func modifier

    /// Applies a visual style configuration to the accordion
    ///
    /// - Parameter size: The size preset to apply to all accordion items
    /// - Returns: A modified accordion view with the specified size style
    public func accordionStyle(size: SHDAccordionSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}

// MARK: - Preview

/// A simple sample model used to preview the accordion.
struct SampleModel: SHDAccordionRepresentable {
    var title: String
    var content: String
}

#Preview("Accordion Group") {
    let sampleItems = [
        SampleModel(
            title: "Is it accessible?",
            content: "Yes. It adheres to the WAI-ARIA design pattern."
        ),
        SampleModel(
            title: "Is it animated?",
            content: """
                Yes, It improves user experience by organizing information in a clean way,
                allowing users to click on a title to expand and see details, and then click again
                to collapse it
                """
        ),
    ]
    SHDAccordion(items: sampleItems)
        .accordionStyle(size: .md)
        .padding(.horizontal, .xxxl)
}
