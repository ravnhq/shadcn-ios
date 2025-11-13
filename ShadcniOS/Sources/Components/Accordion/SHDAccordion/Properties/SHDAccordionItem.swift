//
//  SHDAccordionItem.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/13/25.
//

import SwiftUI

internal struct SHDAccordionItem: View {
    @Binding var isExpanded: Bool
    public var title: String
    public var content: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
                SHDIcon(.arrowChevronDown)
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
