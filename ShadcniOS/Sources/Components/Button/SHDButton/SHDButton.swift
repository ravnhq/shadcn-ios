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
    var iconStyle: Bool = false

    init(
        label: String,
        icon: SHDIconAsset?,
        action: @escaping () -> Void,
    ) {
        self.label = label
        self.icon = icon
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: .sm) {
                if let icon {
                    SHDIcon(icon)
                }

                if !iconStyle {
                    Text(label)

                    if iconDuplicated {
                        if let icon {
                            SHDIcon(icon)
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
    SHDButton(
        label: "Proto button",
        icon: .notificationCheckCheck,
        action: { print("Hello, World!") },
    )
    .iconStyle()
    .shdVariant(.defaultButton)

    SHDButton(
        label: "Proto button",
        icon: .notificationBellOff,
        action: {
            print("Hello world 2!")
        }
    )
    .iconDuplicated()
    .shdVariant(.defaultButton)
    .shdStyle(.buttonDefault)

    SHDButton(
        label: "Proto button secondary",
        icon: .notificationBellOff,
        action: {
            print("Hello world 3!")
        }
    )
    .shdVariant(.secondaryButton)
    .shdStyle(.buttonDefault)

}

public enum Variant {
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

public enum StyleButton {
    case buttonDefault
    case buttonLoading

    var opacity: CGFloat {
        switch self {
        case .buttonDefault: return 1
        case .buttonLoading: return 0.5
        }
    }
}

struct SHDButtonVariantStyle: ButtonStyle {
    let variant: Variant

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .contentShape(Rectangle())
            .backgroundColor(variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .cornerRadius(.lg)
    }
}

struct SHDButtonStyle: ViewModifier {
    let style: StyleButton

    init(style: StyleButton = .buttonDefault) {
        self.style = style
    }

    func body(content: Content) -> some View {
        content.opacity(style.opacity)
    }
}

extension View {
    func shdVariant(_ variant: Variant) -> some View {
        buttonStyle(SHDButtonVariantStyle(variant: variant))
    }

    func shdStyle(_ style: StyleButton) -> some View {
        modifier(SHDButtonStyle(style: style))
    }
}
