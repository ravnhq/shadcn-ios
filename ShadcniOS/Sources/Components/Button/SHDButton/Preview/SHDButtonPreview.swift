//
//  SHDButtonPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

public struct SHDButtonPreview: View {
    public var body: some View {
        SHDButton(
            label: nil,
            icon: .notificationCheckCheck,
            action: { print("Hello, World!") },
        )
        .iconSize(.sm)
        .buttonVariant(.`default`)

        SHDButton(
            label: nil,
            icon: .notificationCheckCheck,
            action: { print("Hello, World!") },
        )
        .iconSize(.md)
        .buttonVariant(.default)

        SHDButton(
            label: nil,
            icon: .notificationCheckCheck,
            action: { print("Hello, World!") },
        )
        .iconSize(.lg)
        .buttonVariant(.default)

        SHDButton(
            label: "Proto button",
            icon: nil,
            action: {
                print("Hello world 2!")
            }
        )
        .buttonVariant(.default)
        .shdButtonStyle(.buttonDefault)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .buttonVariant(.secondary)
        .shdButtonStyle(.buttonDefault)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.lg)
        .buttonVariant(.default)
        .shdButtonSize(.lg)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.md)
        .buttonVariant(.default)
        .shdButtonSize(.md)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.sm)
        .buttonVariant(.default)
        .shdButtonSize(.sm)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.lg)
        .buttonVariant(.destructive)
        .shdButtonSize(.lg)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.lg)
        .buttonVariant(.outline)
        .shdButtonSize(.lg)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.lg)
        .buttonVariant(.ghost)
        .shdButtonSize(.lg)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.sm)
        .buttonVariant(.link)
        .shdButtonSize(.sm)
    }
}

#Preview {
    SHDButtonPreview()
}
