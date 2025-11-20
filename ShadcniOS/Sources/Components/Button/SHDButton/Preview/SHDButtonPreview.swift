//
//  SHDButtonPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

public struct SHDButtonPreview: View {
    public var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Sizing: ")
            HStack(spacing: 16) {
                SHDButton(
                    icon: .notificationCheckCheck,
                    action: { print("Hello, World!") }
                )
                .buttonVariant(variant: .default, size: .sm)

                SHDButton(
                    icon: .notificationCheckCheck,
                    action: { print("Hello, World!") }
                )
                .buttonVariant(variant: .default, size: .sm)

                SHDButton(
                    icon: .notificationCheckCheck,
                    action: { print("Hello, World!") }
                )
                .buttonVariant(variant: .default, size: .lg)
            }

            VStack(spacing: 12) {
                SHDButton(label: "Button LG", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .default, size: .lg)

                SHDButton(label: "Button MD", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .default)

                SHDButton(label: "Button SM", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .default, size: .sm)
            }

            Text("Variants:")
            VStack(spacing: 12) {
                SHDButton(label: "Default", action: {})
                    .buttonVariant(variant: .default)

                SHDButton(label: "Secondary", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .secondary)

                SHDButton(label: "Destructive", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .destructive)

                SHDButton(label: "Outline", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .outline)

                SHDButton(label: "Ghost", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .ghost)

                SHDButton(label: "Link", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .link)
            }

            Text("Styles:")
            VStack(spacing: 12) {
                SHDButton(label: "Default", action: {})
                    .buttonVariant(variant: .default)

                HStack {
                    SHDButton(icon: .notificationBellOff, action: {})
                        .buttonVariant(variant: .secondary)
                        .isLoading(true)

                    SHDButton(label: "Loading", icon: .notificationBellOff, action: {})
                        .buttonVariant(variant: .secondary)
                        .isLoading(true)
                }

                SHDButton(label: "Disable", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .destructive)
                    .disabled(true)

            }
        }
        .padding()
    }
}

#Preview {
    SHDButtonPreview()
}
