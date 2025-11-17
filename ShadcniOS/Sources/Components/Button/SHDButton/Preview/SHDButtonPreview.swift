//
//  SHDButtonPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

internal struct SHDButtonPreview: View {
    var body: some View {
        SHDButton(
            label: "Proto button",
            icon: .notificationCheckCheck,
            action: { print("Hello, World!") },
        )
        .iconStyle()
        .buttonVariant(.defaultButton)

        SHDButton(
            label: "Proto button",
            icon: .notificationBellOff,
            action: {
                print("Hello world 2!")
            }
        )
        .iconDuplicated()
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
    }
}

#Preview {
    SHDButtonPreview()
}
