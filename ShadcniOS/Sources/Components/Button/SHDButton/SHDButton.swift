//
//  SHDButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

public struct SHDButton: View {

    let label: String
    let icon: SHDIconAsset?
    let action: () -> Void
    var iconDuplicated: Bool = false

    init(
        label: String,
        icon: SHDIconAsset?,
        action: @escaping () -> Void,
        iconDuplicated: Bool
    ) {
        self.label = label
        self.icon = icon
        self.action = action
        self.iconDuplicated = iconDuplicated
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: .sm) {
                if let icon {
                    SHDIcon(icon)
                }

                Text(label)

                if iconDuplicated {
                    if let icon {
                        SHDIcon(icon)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .contentShape(Rectangle())
            .backgroundColor(.backgroundPrimaryDefault)
            .foregroundColor(.foregroundPrimaryDefault)
            .cornerRadius(.lg)
        }
    }
}

#Preview {
    SHDButton(
        label: "Proto button",
        icon: .notificationCheckCheck,
        action: { print("Hello, World!") },
        iconDuplicated: true
    )
}
