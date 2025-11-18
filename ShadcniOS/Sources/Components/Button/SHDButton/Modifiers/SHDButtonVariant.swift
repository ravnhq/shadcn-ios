//
//  SHDButtonVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

struct SHDButtonVariantStyle: ButtonStyle {
    let variant: VariantButton

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, .xxs)
            .contentShape(Rectangle())
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(variant.borderColor.color, lineWidth: variant.borderColor == .clear ? 0 : 1)
            )
            .cornerRadius(.lg)
    }
}

extension View {
    public func buttonVariant(_ variant: VariantButton) -> some View {
        buttonStyle(SHDButtonVariantStyle(variant: variant))
    }
}
