//
//  SHDButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

public struct SHDButton: View {
    let text: String
    let leadingIcon: SHDIconAsset?
    let onTap: () -> Void

    var iconDuplicated: Bool = false
    var iconStyle: Bool = false

    init(
        label: String,
        icon: SHDIconAsset?,
        action: @escaping () -> Void,
    ) {
        self.text = label
        self.leadingIcon = icon
        self.onTap = action
    }

    public var body: some View {
        Button(action: onTap) {
            HStack(spacing: .sm) {
                if let leadingIcon {
                    SHDIcon(leadingIcon)
                }

                if !iconStyle {
                    Text(text)

                    if iconDuplicated {
                        if let leadingIcon {
                            SHDIcon(leadingIcon)
                        }
                    }
                }
            }
            .padding(.horizontal, !iconStyle ? 16 : 8)
        }
    }

    public func iconStyle(iconStyle: Bool = true) -> Self {
        mutating(keyPath: \.iconStyle, value: iconStyle)
    }

    public func iconDuplicated(iconDuplicated: Bool = true) -> Self {
        mutating(keyPath: \.iconDuplicated, value: iconDuplicated)
    }
}

#Preview {
    SHDButtonPreview()
}
