//
//  SHDAccordion.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import SwiftUI

public protocol SHDAccordionRepresentable: Hashable {
    var title: String { get set }
    var content: String { get set }
}

internal struct SHDAccordionItem: View {
    public var title: String
    public var content: String
    @Binding var isExpanded: Bool

    var body: some View {
        VStack(spacing: 0) {
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
                    .padding(.top, 8)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .padding(.horizontal, .xxxl)
    }
}

// MARK: - Accordion Group component

public struct SHDAccordionGroup<Item: SHDAccordionRepresentable>: View {
    public var items: [Item]
    @State private var expandedIndex: Int?
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
    SHDAccordionGroup(items: sampleItems)
}
