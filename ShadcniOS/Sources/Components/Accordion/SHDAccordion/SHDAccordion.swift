//
//  SHDAccordion.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import SwiftUI

internal struct SHDAccordionItem: View {

    public var title: String
    public var content: String
    @Binding var isExpanded: Bool

    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
                SHDIcon(.arrowChevronUp)
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.spring(response: 0.40, dampingFraction: 0.7)) {
                    isExpanded.toggle()
                }
            }
            Divider()
            if isExpanded {
                Text(content)
                    .padding(.top, .xxs)
            }
        }
    }
}

// MARK: - Accordion component

public struct SHDAccordion<Item: SHDAccordionRepresentable>: View {

    public var items: [Item]
    @State public var expandedIndex: Int?

    public init(items: [Item]) {
        self.items = items
    }

    public var body: some View {
        VStack {
            ForEach(items.indices, id: \.self) { index in
                SHDAccordionItem(
                    title: items[index].title,
                    content: items[index].content,
                    isExpanded: Binding(
                        get: { expandedIndex == index },
                        set: { isExpanded in
                            expandedIndex = isExpanded ? index : nil
                        }
                    )
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
        SampleModel(title: "Hello world", content: "Expandable content"),
        SampleModel(title: "Hello world 2", content: "Expandable content 2"),
        SampleModel(title: "Hello world 3", content: "Expandable content 3")
    ]

    SHDAccordion(items: sampleItems)
        .padding(.horizontal, .xxxl)
        .accordionStyle(size: .sm)
    Divider()
    SHDAccordion(items: sampleItems)
        .padding(.horizontal, .xxxl)
        .accordionStyle(size: .md)
    Divider()
    SHDAccordion(items: sampleItems)
        .padding(.horizontal, .xxxl)
        .accordionStyle(size: .lg)
}
