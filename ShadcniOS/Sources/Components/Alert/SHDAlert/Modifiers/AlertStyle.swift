//
//  AlertStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

// MARK: - SHAlertConfiguration

/// A view modifiers that applies a visual alert style to the modified content
///
/// ### Discussion
/// `SHDAlertConfiguration` is responsible for rendering the standardized alert alert layout
/// used across the Shadcn iOS desing system
///
/// The modifier displays:
/// - a leading icon associated with the alert style
/// - the alert message content
/// - a tyled rounded border and padding
/// - foreground and border colors defined by the `SHDAlertStyle`
///
/// This ensures visual consistency across all alert instances while allowing consumers to
/// specify different alert style variants such as `.default`, `.destructive`, `.warning` and `.success`
///
/// ### Usage
///
/// Basic usage through the `.shdAlertStyle(...)` convenience modifier:
/// ```swift
/// SHDAlert(title: "warning", message: "this is a message alert")
///     .shdAlertStyle(.warning)
/// ```
internal struct SHDAlertConfiguration: ViewModifier {

    // MARK: - Properties

    /// The specific alert style that defines colors and icon for the alert presentation
    let style: SHDAlertStyle

    // MARK: - Body

    /// Applies the alert visual styling to the provided content
    ///
    /// - Parameter content: The view content to which the alert style will be applied
    /// - Returns: A view containing the styled alert representation
    func body(content: Content) -> some View {
        HStack(alignment: .top) {
            SHDIcon(style.iconAsset)
                .iconSize(.lg)

            content
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(style.borderColor.color, lineWidth: 1)
        )
        .padding()
        .foregroundColor(style.foregroundColor.color)
    }
}

// MARK: - View Extension

public extension View {

    /// Applies a predefined Shadcn-style alert appearance to the view
    ///
    /// ### Discussion
    /// This convenience modifier lets consumers apply an alert style without manually
    /// instantiating `SHAlertConfiguration`
    /// different alert styles define their own icon, foreground color and border color
    ///
    /// ### Usage
    ///
    /// Default style
    /// ```swift
    /// SHDAlert(title: "default", message: "this is a default message")
    ///     .shdAlertStyle()
    /// ```
    ///
    /// Specifying a particular alert variant:
    /// ```swift
    /// SHDAlert(title: "Delete", message: "This action cannot be undone")
    ///     .shdAlertStyle(.destructive)
    /// ```
    ///
    /// - Parameter style: The alert style variant to apply. Defaults to `.default`
    /// - Returns : A view styled according to the selected alert configuration
    func shdAlertStyle(_ style: SHDAlertStyle = .default) -> some View {
        modifier(SHDAlertConfiguration(style: style))
    }
}
