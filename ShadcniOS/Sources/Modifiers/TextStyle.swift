//
//  TextStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import SwiftUI

struct TextStyle: ViewModifier {
    let style: SHDTextStyle

    func body(content: Content) -> some View {
        content
            .font(
                .custom(
                    style.weight.postScriptName,
                    size: style.size,
                    relativeTo: style.relativeFont
                )
            )
            .kerning(style.letterSpacing)
            .lineSpacing(style.lineHeight - style.size)
            .underline(style.underline)
    }
}

extension View {
    func textStyle(_ style: SHDTextStyle) -> some View {
        self.modifier(TextStyle(style: style))
    }
}
