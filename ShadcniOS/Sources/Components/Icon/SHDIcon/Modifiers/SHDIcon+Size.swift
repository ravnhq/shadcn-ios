//
//  SHDIcon+Size.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/6/25.
//

import SwiftUI

internal struct IconSize: ViewModifier {
    let size: SHDIconSize

    public func body(content: Content) -> some View {
        content
            .frame(width: size.rawValue, height: size.rawValue)
    }
}

extension View {
    func iconSize(_ size: SHDIconSize) -> some View {
        self.modifier(IconSize(size: size))
    }
}
