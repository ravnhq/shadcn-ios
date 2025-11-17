//
//  SHDButtonStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

struct SHDButtonStyle: ViewModifier {
    let style: StyleButton

    init(style: StyleButton = .buttonDefault) {
        self.style = style
    }

    func body(content: Content) -> some View {
        content.opacity(style.opacity)
    }
}

extension  View {
    func shdButtonStyle(_ style: StyleButton) -> some View {
        modifier(SHDButtonStyle(style: style))
    }
}
