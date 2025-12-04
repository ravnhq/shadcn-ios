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

    /// Small button size for compact text and icon dimensions.
    case sm
    /// Medium button size for default size for standard buttons.
    case md
    /// Large button size for larger typography for emphasized actions.
    case lg

    var textSize: SHDTextStyle {
        switch self {
        case .sm: .textSMMedium
        case .md: .textBaseMedium
        case .lg: .textLGMedium
        }
    }

    var iconSize: SHDIconSize {
        switch self {
        case .sm: .sm
        case .md: .md
        case .lg: .lg
        }
    }
}
