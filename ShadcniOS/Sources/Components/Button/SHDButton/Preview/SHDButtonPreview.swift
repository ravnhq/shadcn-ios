//
//  SHDButtonPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

internal struct SHDButtonPreview: View {
    internal var body: some View {
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
                .buttonVariant(variant: .default, size: .md)

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
                    .buttonVariant(variant: .default, size: .md)

                SHDButton(label: "Button SM", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .default, size: .sm)
            }

            Text("Variants:")
            VStack(spacing: 12) {
                SHDButton(label: "Default", action: {})
                    .buttonVariant(variant: .default, size: .md)

                SHDButton(label: "Secondary", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .secondary, size: .md)

                SHDButton(label: "Destructive", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .destructive, size: .md)

                SHDButton(label: "Outline", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .outline, size: .md)

                SHDButton(label: "Ghost", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .ghost, size: .md)

                SHDButton(label: "Link", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .link, size: .md)
            }

            Text("Styles:")
            VStack(spacing: 12) {
                SHDButton(label: "Default", action: {})
                    .buttonVariant(variant: .default, size: .md)

                HStack {
                    SHDButton(icon: .notificationBellOff, action: {})
                        .buttonVariant(variant: .secondary, size: .md)
                        .isLoading(true)

                    SHDButton(label: "Loading", icon: .notificationBellOff, action: {})
                        .buttonVariant(variant: .secondary, size: .md)
                        .isLoading(true)
                }

                SHDButton(label: "Disable", icon: .notificationBellOff, action: {})
                    .buttonVariant(variant: .destructive, size: .md)
                    .disabled(true)

            }
        }
        .padding()
    }
}

#Preview {
    SHDButtonPreview()
}
