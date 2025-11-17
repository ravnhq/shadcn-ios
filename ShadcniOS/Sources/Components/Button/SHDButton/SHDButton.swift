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
    var variant: Variants = .defaultButton

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
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .cornerRadius(.lg)
        }
    }

    public func styleButton(_ variant: Variants) -> Self {
        mutating(keyPath: \.variant, value: variant)
    }
}

#Preview {
    SHDButton(
        label: "Proto button",
        icon: .notificationCheckCheck,
        action: { print("Hello, World!") },
        iconDuplicated: true
    )
    
    SHDButton(label: "Proto button secondary", icon: .notificationBellOff, action: {
        print("Hello world 2!")
    }, iconDuplicated: true)
    .styleButton(.secondaryButton)
}

public enum Variants {
    case defaultButton
    case secondaryButton

    var backgroundColor: SHDColor {
        switch self {
        case .defaultButton: return .backgroundPrimaryDefault
        case .secondaryButton: return .backgroundPrimaryLight
        }
    }
    
    var foregroundColor: SHDColor {
        switch self {
        case .defaultButton: return .foregroundPrimaryDefault
        case .secondaryButton: return .foregroundAccent
        }
    }
}
