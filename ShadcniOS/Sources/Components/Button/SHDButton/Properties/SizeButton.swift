//
//  SizeButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// Defines the available size variants for buttons in the ShadcniOS design system.
///
/// ### Discussion
/// `SizeButton` provides a set of predefined size options for buttons,
/// allowing consumers to easily apply consistent typography and spacing
/// according to the design system guidelines.
///
/// Each size maps to a specific text style (`SHDTextStyle`) which determines
/// the font size and weight used for the button label. This ensures
/// consistency in text hierarchy across the application.
///
/// ### Usage
///
/// Basic usage:
/// ```swift
/// let size: SizeButton = .md
/// let textStyle = size.textSize
/// ```
///
/// Applying size in a button:
/// ```swift
/// SHDButton(label: "Continue") {
///     print("Button tapped")
/// }
/// .font(size.textSize.swiftUIFont)
/// ```
public enum SizeButton {

    // MARK: - Size Variants

    /// Small button size. Uses a smaller text style for compact layouts.
    case sm

    /// Medium button size. Default size used for standard buttons.
    case md

    /// Large button size. Uses a larger text style for emphasis.
    case lg

    // MARK: - Computed Properties

    /// The text style associated with the button size.
    ///
    /// - Returns: An `SHDTextStyle` corresponding to the selected size.
    var textSize: SHDTextStyle {
        switch self {
        case .sm: return .textSMMedium
        case .md: return .textBaseMedium
        case .lg: return .textLGMedium
        }
    }
}
