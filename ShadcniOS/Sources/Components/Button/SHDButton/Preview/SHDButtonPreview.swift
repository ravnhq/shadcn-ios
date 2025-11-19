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
                .iconSize(.sm)
                .buttonVariant(.default)

                SHDButton(
                    icon: .notificationCheckCheck,
                    action: { print("Hello, World!") }
                )
                .iconSize(.md)
                .buttonVariant(.default)

                SHDButton(
                    icon: .notificationCheckCheck,
                    action: { print("Hello, World!") }
                )
                .iconSize(.lg)
                .buttonVariant(.default)
            }

            VStack(spacing: 12) {
                SHDButton(label: "Button LG", icon: .notificationBellOff, action: {})
                    .iconSize(.lg)
                    .buttonVariant(.default)
                    .shdButtonSize(.lg)

                SHDButton(label: "Button MD", icon: .notificationBellOff, action: {})
                    .iconSize(.md)
                    .buttonVariant(.default)
                    .shdButtonSize(.md)

                SHDButton(label: "Button SM", icon: .notificationBellOff, action: {})
                    .iconSize(.sm)
                    .buttonVariant(.default)
                    .shdButtonSize(.sm)
            }

            Text("Variants:")
            VStack(spacing: 12) {
                SHDButton(label: "Default", action: {})
                    .buttonVariant(.default)

                SHDButton(label: "Secondary", icon: .notificationBellOff, action: {})
                    .buttonVariant(.secondary)

                SHDButton(label: "Destructive", icon: .notificationBellOff, action: {})
                    .buttonVariant(.destructive)

                SHDButton(label: "Outline", icon: .notificationBellOff, action: {})
                    .buttonVariant(.outline)

                SHDButton(label: "Ghost", icon: .notificationBellOff, action: {})
                    .buttonVariant(.ghost)

                SHDButton(label: "Link", icon: .notificationBellOff, action: {})
                    .buttonVariant(.link)
            }

            Text("Styles:")
            VStack(spacing: 12) {
                SHDButton(label: "Default", action: {})
                    .buttonVariant(.default)
                    .shdButtonStyle(.buttonDefault)

                HStack {
                    SHDButton(icon: .notificationBellOff, action: {})
                        .buttonLoading()
                        .buttonVariant(.secondary)
                        .shdButtonStyle(.buttonLoading)
                    
                    SHDButton(label: "Loading", icon: .notificationBellOff, action: {})
                        .buttonVariant(.secondary)
                        .shdButtonStyle(.buttonLoading)
                }

                SHDButton(label: "Disable", icon: .notificationBellOff, action: {})
                    .buttonVariant(.destructive)
                    .shdButtonStyle(.buttonDisable)

            }
        }
        .padding()
    }
}

#Preview {
    SHDButtonPreview()
}
