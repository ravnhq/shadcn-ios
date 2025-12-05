//
//  SHDAccordionItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/13/25.
//

import SwiftUI

/// A single item within an accordion component, displaying a title
/// and expandable content area.
///
/// ## Discussion
/// The `SHDAccordionItem` manages its own expanded or collapsed state
/// through a binding, providing smooth spring-based animations
/// when toggling visibility.
///
/// - Parameters:
///   - selection: A binding to the currently selected item in the parent accordion.
///   - item: The item to be displayed and controlled by this accordion row.
///
/// ## Usage
/// ```swift
/// SHDAccordionItem(selection: $selectedItem, item: item)
///    .itemSize(size: size)
/// ```
internal struct SHDAccordionItem<Item: SHDAccordionRepresentable>: View {

    @Binding private var selection: Item?

    private var size: SHDAccordionSize = .md
    private let item: Item

    private var isExpanded: Bool {
        selection == item
    }

    init(selection: Binding<Item?>, item: Item) {
        self._selection = selection
        self.item = item
    }

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

    /// The header section containing the title and expand/collapse indicator.
    private var header: some View {
        HStack {
            Text(item.title)
                .textStyle(size.titleTextStyle)

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
            .textStyle(size.contentTextStyle)
    }

    // MARK: - Func modifier

    /// Returns: A modified accordion item with the specified size style
    ///
    /// - Parameter
    ///  - size: The size preset to apply to the item.
    func itemSize(size: SHDAccordionSize) -> Self {
        mutating(keyPath: \.size, value: size)
    }
}
