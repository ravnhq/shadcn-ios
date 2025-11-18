//
//  SHDButtonSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

struct SHDButtonSize: ViewModifier {
    let size: SizeButton

    func body(content: Content) -> some View {
        content
            .textStyle(size.textSize)
    }
}

extension View {
    public func shdButtonSize(_ size: SizeButton) -> some View {
        modifier(SHDButtonSize(size: size))
    }
}
