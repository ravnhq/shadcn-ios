//
//  SHDButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

public struct SHDButton: View {
    let text: String?
    let leadingIcon: SHDIconAsset?
    let onTap: () -> Void

    var iconSize: SHDIconSize = .md

    public init(
        label: String? = nil,
        icon: SHDIconAsset? = nil,
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
                        .iconSize(iconSize)
                }

                if let text {
                    Text(text)
                }
            }
            .padding(.horizontal, text != nil ? 16 : 8)
        }
    }

    public func iconSize(_ iconSize: SHDIconSize) -> Self {
        mutating(keyPath: \.iconSize, value: iconSize)
    }
}

#Preview {
    SHDButtonPreview()
}
