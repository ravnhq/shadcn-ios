//
//  SHDAlertStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

/// Defubes the style variants available for Shadcn Alerts
///
/// ### Discussion
/// `SHDAlertStyle` determines the visual appearance of an alert, including:
/// - The icon to display,
/// - The foreground (text/icon) color,
/// - The border color
///
/// These values are sourced from the desing system's color and icon assets (`SHDColor`, `SHDIconAsset`)
///
/// Each style corresponds to a semantic meaning:
/// - `.default`:  neutral information
/// - `.destructive`: critical or dangerous events
/// - `.warning`: non-critical but cautionary messages
/// - `.success`: positive confirmations
///
/// `SHDAlertStyle` is used by `SHDAlertConfiguration` and applied through
/// the `.shdAlertStyle(...)` modifier on the SHDAlert() view
///
/// ### Usage
///
/// ```swift
/// SHDAlert(title: "Delete", message: "This action cannot be undone")
///     .shdAlertStyle(.destructive)
/// ```
///
/// ```swift
/// SHDAlert(title: "Done", message: "This action has been completed successfuly")
///     .shdAlertStyle(.success)
/// ```
public enum SHDAlertStyle {

    // MARK: - Cases

    /// A neutral informational alert
    case `default`

    /// A destructive alert used for errors or critical messaged
    case destructive

    /// A warining alert for non-critical caution messages
    case warning

    /// A success alert indicating that an action competed successfully
    case success

    // MARK: - Computed Properties

    /// The foreground color associated with the alert style
    ///
    /// This color is used primarily for text and icons
    var foregroundColor: SHDColor {
        switch self {
        case .default: .foregroundDefault
        case .destructive: .foregroundDestructiveDefault
        case .warning: .foregroundWarningDefault
        case .success: .foregroundSuccessDefault
        }
    }

    /// The border color used by the alert's container
    ///
    /// Each style maps to a corresponding semantic border color
    /// defined in the desing system
    var borderColor: SHDColor {
        switch self {
        case .default: .borderDefault
        case .destructive: .borderDestructiveDefault
        case .warning: .borderWarningDefault
        case .success: .borderSuccessDefault
        }
    }

    /// The icon asset representing the alert's semantic context
    ///
    /// This icon is displayed at the start o the alert content
    /// when using `SHDAlertConfiguration`
    var iconAsset: SHDIconAsset {
        switch self {
        case .default: .codingDevelopmentTerminal
        case .destructive: .notificationCircleAlert
        case .warning: .notificationCircleAlert
        case .success: .notificationCircleCheckBig
        }
    }
}
