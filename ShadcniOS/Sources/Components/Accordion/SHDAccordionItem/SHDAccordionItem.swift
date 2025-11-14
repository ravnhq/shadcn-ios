//
//  SHDAccordionItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/13/25.
//

import SwiftUI

/// A single item within an accordion component, displaying a title
/// and expandable content area
///
/// The `SHDAccordionItem` manage its own expanded or collapsed state
/// through a binding, providing smooth spring-based animations
/// when toggling visibility
///
/// Exmaple usage:
/// ```swift
/// SHDAccordionItem(
///     selection: $selectedItem,
///     item: item
///     )
///    .accordionItemSize(size: size)
/// ```
internal struct SHDAccordionItem<Item: SHDAccordionRepresentable>: View {

    // MARK: - Properties

    /// The visual size style applied to this accordion item
    private var size: SHDAccordionSize = .md

    /// A binding to the currently selected item in the parent accordion.
    ///
    /// When this item is equal to the bound value, it is considered expanded.
    @Binding var selection: Item?

    /// The data model representing the accordion item
    let item: Item

    // Indicates wheter the current accordion item is expanded
    private var isExpanded: Bool {
        selection == item
    }

    // MARK: - Initialization

    /// Creates a new accordion item
    ///
    /// - Parameters:
    ///     - selection: A binding to the parent accordion's selected item
    ///     - item: The item data conforming to `SHDAccordionRepresentable`
    init(selection: Binding<Item?>, item: Item) {
        self._selection = selection
        self.item = item
    }

    // MARK: - Body

    var body: some View {
        VStack(spacing: size.verticalSpacing) {
            header
            if isExpanded {
                content
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }

            Divider()
        }
        .clipped()
    }

    // MARK: - Subviews

    /// The header section containing the title and expand/collapse indicator.
    private var header: some View {
        HStack {
            Text(item.title)
                .textStyle(size.titleFont)

            Spacer()

            SHDIcon(.arrowChevronDown)
                .rotationEffect(.degrees(isExpanded ? 180 : 0))
                .animation(.easeInOut(duration: 0.25), value: isExpanded)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.spring(response: 0.40, dampingFraction: 0.7)) {
                selection = isExpanded ? nil : item
            }
        }
    }

    /// The expanded content area shown when the item is active.
    private var content: some View {
        Text(item.content)
            .textStyle(size.contentFont)
    }

    // MARK: - Func modifier

    /// Applies a size configuration to this accordion item.
    ///
    /// - Parameter size: The size preset to apply to the item.
    /// - Returns: A modified accordion item with the specified size style.
    func itemSize(size: SHDAccordionSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}
