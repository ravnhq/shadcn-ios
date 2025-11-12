//
//  SHDAccordionTextStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/12/25.
//

import SwiftUI

struct SHDAccordionTextStyle: ViewModifier {
    var size: SHDAccordionSize
    var isTitle: Bool = false

    func body(content: Content) -> some View {
        content
            .textStyle(isTitle ? size.titleFont : size.contentFont)
            .padding(.vertical, size.verticalPadding)
    }
}

public extension View {
    func accordionStyle(size: SHDAccordionSize, isTitle: Bool = false) -> some View {
        self.modifier(SHDAccordionTextStyle(size: size, isTitle: isTitle))
    }
}
