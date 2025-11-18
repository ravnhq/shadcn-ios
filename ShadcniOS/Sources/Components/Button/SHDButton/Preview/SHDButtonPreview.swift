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
        .buttonVariant(.defaultButton)

        SHDButton(
            label: nil,
            icon: .notificationCheckCheck,
            action: { print("Hello, World!") },
        )
        .iconSize(.md)
        .buttonVariant(.defaultButton)

        SHDButton(
            label: nil,
            icon: .notificationCheckCheck,
            action: { print("Hello, World!") },
        )
        .iconSize(.lg)
        .buttonVariant(.defaultButton)

        SHDButton(
            label: "Proto button",
            icon: nil,
            action: {
                print("Hello world 2!")
            }
        )
        .buttonVariant(.defaultButton)
        .shdButtonStyle(.buttonDefault)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .buttonVariant(.secondaryButton)
        .shdButtonStyle(.buttonDefault)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.lg)
        .buttonVariant(.defaultButton)
        .shdButtonSize(.lg)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.md)
        .buttonVariant(.defaultButton)
        .shdButtonSize(.md)

        SHDButton(
            label: "Proto button secondary",
            icon: .notificationBellOff,
            action: {
                print("Hello world 3!")
            }
        )
        .iconSize(.sm)
        .buttonVariant(.defaultButton)
        .shdButtonSize(.sm)
    }
}

#Preview {
    SHDButtonPreview()
}
