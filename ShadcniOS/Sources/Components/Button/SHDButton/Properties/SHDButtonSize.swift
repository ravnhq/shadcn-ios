//
//  SHDSizeButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import SwiftUI

/// Defines the available size variants for ShadcniOS buttons.
///
/// ## Discussion
/// `SHDButtonSize` standardizes the typography and icon sizing for buttons
/// in the ShadcniOS design system. Each case corresponds to a specific
/// `SHDTextStyle` and `SHDIconSize`, ensuring consistent visual hierarchy
/// across different button sizes.
///
/// These values are consumed by the `buttonSize` environment key and used
/// internally by `SyledSHDButton` through:
/// - `textStyle(buttonSize.textSize)`
/// - icon sizing via `iconSize` when needed
///
/// ## Usage
///
/// Getting the text style for a given size:
/// ```swift
/// let size: SHDButtonSize = .md
/// let style = size.textSize
/// ```
///
/// Applying a size to a ShadcniOS button:
/// ```swift
/// SHDButton(label: "Continue") { }
///     .buttonVariant(size: .sm)
/// ```
///
/// Using the environment directly:
/// ```swift
/// VStack {
///     SHDButton(label: "Save") { }
/// }
/// .environment(\.buttonSize, .lg)
/// ```
public enum SHDButtonSize: Sendable {

    // MARK: - Size Variants

    /// Small button size.
    /// Compact text and icon dimensions.
    case sm

    /// Medium button size.
    /// Default size for standard buttons.
    case md

    /// Large button size.
    /// Larger typography for emphasized actions.
    case lg

    // MARK: - Typography Mapping

    /// The text style associated with the button size.
    ///
    /// - Returns: An `SHDTextStyle` representing the correct typography.
    var textSize: SHDTextStyle {
        switch self {
        case .sm: .textSMMedium
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }

    // MARK: - Icon Mapping

    /// The icon size associated with the button size.
    ///
    /// - Returns: An `SHDIconSize` corresponding to the selected size.
    var iconSize: SHDIconSize {
        switch self {
        case .sm: .sm
        case .md: .md
        case .lg: .lg
        }
    }
}
