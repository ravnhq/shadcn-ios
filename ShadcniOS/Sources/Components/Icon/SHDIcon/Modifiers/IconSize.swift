//
//  IconSize.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/6/25.
//

import SwiftUI

/// A `ViewModifier` that applies a fixed width and height to a view based on a predefined `SHDIconSize`.
///
/// `IconSize` ensures that icons or other scalable views maintain consistent sizing according
/// to the Shadcn iOS design system. It reads the raw value (in points) from the `SHDIconSize` enum
/// and applies it to both the width and height of the content.
///
internal struct IconSize: ViewModifier {
    let size: SHDIconSize

    public func body(content: Content) -> some View {
        content
            .frame(width: size.rawValue, height: size.rawValue)
    }
}

/// Extension to `View` that provides a more declarative syntax for applying icon sizing.
///
/// This extension allows developers to easily apply standardized icon sizes using the
/// `.iconSize(_:)` modifier, improving readability and consistency across the codebase.
///
/// Example usage:
/// ```swift
/// SHDIcon(icon: .notificationBellRing)
///     .iconSize(.lg)
/// ```
///
/// - Parameter size: A value from ``SHDIconSize`` defining the icon's dimensions.
/// - Returns: A view with the specified icon size applied.
internal extension View {
    func iconSize(_ size: SHDIconSize) -> some View {
        self.modifier(IconSize(size: size))
    }
}
