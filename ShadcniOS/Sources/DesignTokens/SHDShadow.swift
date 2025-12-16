//
//  SHDShadow.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/16/25.
//

import SwiftUI

/// Defines shadow variants for the **Shadcn iOS Design System**.
///
/// ## Description
/// `SHDShadow` provides a set of predefined shadow styles that can be applied to SwiftUI views
/// to add depth and visual hierarchy. Each case represents a different shadow intensity level,
/// with increasing offset and blur values for larger shadows.
///
/// ## Discussion
/// Shadows are essential for creating layered interfaces in iOS applications. This enum standardizes
/// shadow appearance across the design system, ensuring consistency in elevation and depth perception.
/// The shadows use subtle opacity values on black color to maintain readability and avoid harsh contrasts.
/// 
/// The enum cases are ordered from smallest to largest shadow:
/// - `.shadowSM`: Small shadow for subtle elevation.
/// - `.shadow`: Default shadow for standard elevation.
/// - `.shadowMD`: Medium shadow for prominent elevation.
///
/// ## Parameters → Init
/// This enum does not have an initializer; use the case values directly.
///
/// ## Usage
/// ```swift
/// Rectangle()
///     .fill(Color.white)
///     .shadowStyle(.shadow)
/// ```
///
/// ## Variables → Public variables
/// - `offset`: The shadow offset as a `CGSize`, determining the horizontal and vertical displacement.
/// - `blur`: The blur radius as a `CGFloat`, controlling the softness of the shadow.
/// - `color`: The shadow color as a `Color`, typically a semi-transparent black.
///
internal enum SHDShadow {
    case shadowSM
    case shadow
    case shadowMD

    var offset: CGSize {
        switch self {
        case .shadowSM: CGSize(width: 0, height: 2)
        case .shadow: CGSize(width: 0, height: 6)
        case .shadowMD: CGSize(width: 0, height: 10)
        }
    }

    var blur: CGFloat {
        switch self {
        case .shadowSM: 6
        case .shadow: 16
        case .shadowMD: 28
        }
    }

    var color: Color {
        switch self {
        case .shadowSM: SHDColor.black.color.opacity(0.08)
        case .shadow, .shadowMD: SHDColor.black.color.opacity(0.12)
        }
    }
}
