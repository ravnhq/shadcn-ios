//
//  SHDAvatarIconConfiguration.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/28/25.
//

import SwiftUI

internal struct SHDAvatarIconConfiguration: ViewModifier {

    var variant: SHDAvatarVariant = .light

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: .full))
            .overlay {
                Circle()
                    .stroke(
                        variant.borderColor.color,
                        lineWidth: variant.borderColor == .clear ? 0 : 1
                    )
            }
    }
}

internal extension View {

    func avatarIconVariant(_ variant: SHDAvatarVariant = .filled) -> some View {
        modifier(SHDAvatarIconConfiguration(variant: variant))
    }
}
