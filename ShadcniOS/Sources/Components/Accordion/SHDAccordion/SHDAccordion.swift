//
//  SHDAccordion.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import SwiftUI

// MARK: - Accordion component
public struct SHDAccordion<Item: SHDAccordionRepresentable>: View {
    @State public var expandedIndex: Int?
    public var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public var body: some View {
        VStack {
            ForEach(items.indices, id: \.self) { index in
                SHDAccordionItem(
                    isExpanded: Binding(
                        get: { expandedIndex == index },
                        set: { isExpanded in
                            expandedIndex = isExpanded ? index : nil
                        }
                    ),
                    title: items[index].title,
                    content: items[index].content
                )
            }
        }
    }
}

// MARK: - Preview

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
            content:
                "Yes, It improves user experience by organizing information in a clean way, allowing users to click on a title to expand and see details, and then click again to collapse it"
        )
    ]

    SHDAccordion(items: sampleItems)
        .padding(.horizontal, .xxxl)
        .accordionStyle(size: .md)
}
