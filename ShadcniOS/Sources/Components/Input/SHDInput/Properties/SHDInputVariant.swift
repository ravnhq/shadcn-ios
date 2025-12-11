//
//  SHDInputVariant.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/8/25.
//

import Foundation

/// Defines the visual and behavioral variants for `SHDInput`.
///
/// ## Discussion
/// `SHDInputVariant` controls the visual appearance and interaction behavior
/// of input fields in the ShadcniOS design system. Each variant provides
/// different states and validation rules to communicate field requirements
/// and availability to users.
///
/// The variants affect multiple aspects of input presentation:
/// - Visual indicators (such as asterisks for required fields)
/// - Interaction capabilities (enabled vs. disabled)
/// - Validation behavior (automatic required field checking)
/// - Styling and color schemes
///
/// These values are applied through the `inputVariant` modifier and work
/// in conjunction with `SHDInputSize` to provide complete control over
/// input field presentation.
///
/// ## Usage
///
/// Applying a default variant:
/// ```swift
/// SHDInput(
///     text: $searchText,
///     label: "Search",
///     placeholder: "Type to search..."
/// )
/// .inputVariant(variant: .default, size: .md)
/// ```
/// Using a disabled variant:
/// ```swift
/// SHDInput(
///     text: $email,
///     label: "Email",
///     placeholder: "example@email.com"
/// )
/// .inputVariant(variant: .disabled, size: .md)
/// ```
public enum SHDInputVariant {
    /// The default input variant.
    case `default`

    /// An obligatory (required) input variant.
    case required

    /// A disabled input variant.
    case disabled
}
