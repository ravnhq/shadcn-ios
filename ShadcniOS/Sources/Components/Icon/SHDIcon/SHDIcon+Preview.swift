//
//  SHDIcon+Preview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/5/25.
//

import SwiftUI

#Preview("SHDIcon - Sizes") {
    HStack(spacing: 16) {
        SHDIcon(icon: .notificationBellRing, size: .sm)
        SHDIcon(icon: .notificationBellRing, size: .md)
        SHDIcon(icon: .notificationBellRing, size: .lg)
    }
    .padding()
    .previewLayout(.sizeThatFits)
}

#Preview("SHDIcon - Rendering Modes") {
    VStack(spacing: 12) {
        SHDIcon(icon: .notificationCircleAlert, renderingMode: .template)
        SHDIcon(icon: .notificationCircleAlert, renderingMode: .original)
    }
    .padding()
    .previewLayout(.sizeThatFits)
}
