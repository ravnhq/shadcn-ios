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
            .padding(.vertical, 8)
            .contentShape(Rectangle())
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .cornerRadius(.lg)
    }
}

extension View {
    func buttonVariant(_ variant: VariantButton) -> some View {
        buttonStyle(SHDButtonVariantStyle(variant: variant))
    }
}
