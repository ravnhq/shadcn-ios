//
//  SHDColor.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/28/25.
//

import SwiftUI

/// A comprehensive enumeration of all color tokens defined in the **Shadcn iOS Design System**.
///
/// Each case represents a named color used throughout the system, including
/// foreground, background, border, chart, and icon colors.
///
/// These color tokens provide a consistent and theme-aware color palette
/// that can be easily used in SwiftUI views.
///
/// Example:
/// ```swift
/// Text("Primary Text")
///     .foregroundColor(.foregroundPrimaryDefault)
///
/// Rectangle()
///     .fill(SHDColor.backgroundAccent.color)
/// ```
///
/// The `color` property returns a SwiftUI `Color` instance that automatically
/// resolves to the correct asset within the package’s bundle.
internal enum SHDColor: String, CaseIterable {

    // MARK: - Clear color
    case clear

    // MARK: - Base Colors
    case black, white

    // MARK: - Foreground Colors
    case foregroundAccent,
        foregroundDefault,
        foregroundDestructiveDefault,
        foregroundDisableDefault,
        foregroundMuted,
        foregroundPrimaryDefault,
        foregroundSecondaryDefault,
        foregroundSuccessDefault,
        foregroundWarningDefault

    // MARK: - Background Colors
    case backgroundAccent,
        backgroundCard,
        backgroundDefault,
        backgroundDestructiveDefault,
        backgroundDestructiveLight,
        backgroundDisableDefault,
        backgroundInput,
        backgroundMuted,
        backgroundPopover,
        backgroundPrimaryDefault,
        backgroundPrimaryLight,
        backgroundSecondaryDefault,
        backgroundSuccessDefault,
        backgroundSuccessLight,
        backgroundWarningDefault,
        backgroundWarningLight

    // MARK: - Border Colors
    case borderDefault,
        borderDestructiveDefault,
        borderSuccessDefault,
        borderPrimaryDefault,
        borderWarningDefault

    // MARK: - Chart Colors
    case chartsChart1Opacity10,
        chartsChart1Opacity50,
        chartsChart1Opacity80,
        chartsChart1Opacity100,
        chartsChart2Opacity10,
        chartsChart2Opacity50,
        chartsChart2Opacity80,
        chartsChart2Opacity100,
        chartsChart3Opacity10,
        chartsChart3Opacity50,
        chartsChart3Opacity80,
        chartsChart3Opacity100,
        chartsChart4Opacity10,
        chartsChart4Opacity50,
        chartsChart4Opacity80,
        chartsChart4Opacity100,
        chartsChart5Opacity10,
        chartsChart5Opacity50,
        chartsChart5Opacity80,
        chartsChart5Opacity100

    // MARK: - Icon Colors
    case iconAccent,
        iconDefault,
        iconDestructiveDefault,
        iconDestructiveOnDestructive,
        iconDisableDefault,
        iconMuted,
        iconPrimaryDefault,
        iconSecondaryDefault,
        iconSuccessDefault,
        iconWarningDefault

    /// Returns the corresponding SwiftUI `Color` instance
    /// associated with this `SHDColor` case.
    ///
    /// This color is resolved from the module’s asset catalog.
    ///
    /// ```swift
    /// let background = SHDColor.backgroundDefault.color
    /// ```
    var color: Color {
        switch self {
        case .clear:
            return .clear
        default:
            return Color(rawValue, bundle: .module)
        }
    }
}
