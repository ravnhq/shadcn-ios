//
//  SHDAvatarIconConfiguration.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/28/25.
//

import SwiftUI

internal struct SHDAvatarConfiguration: ViewModifier {

    var variant: SHDAvatarVariant = .light
    var size: SHDAvatarSize = .md

    func body(content: Content) -> some View {
        content
            .minimumScaleFactor(0.01)
            .textStyle(size.textStyle)
            .padding(.all, size.textPadding)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .overlay {
                RoundedRectangle(cornerRadius: .full)
                    .stroke(
                        variant.borderColor.color,
                        lineWidth: variant.borderColor == .clear ? 0 : 1
                    )
            }
            .clipShape(RoundedRectangle(cornerRadius: .full))
    }
}

internal extension View {

    func avatarVariant(variant: SHDAvatarVariant = .light, size: SHDAvatarSize = .md) -> some View {
        modifier(SHDAvatarConfiguration(variant: variant, size: size))
    }
}

#Preview {
    SHDAvatarPreview()
}
