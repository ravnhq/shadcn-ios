//
//  SHDInputVariant.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/8/25.
//

import Foundation

/// Defines the visual and behavioral variants for `SHDInput`.
///
/// Input variants control how the input field appears and behaves,
/// particularly regarding required field validation and visual indicators.
public enum SHDInputVariant {
    /// The default input variant.
    ///
    /// - No special visual indicators
    /// - No automatic required field validation
    /// - Standard border and label styling
    case `default`

    /// An obligatory (required) input variant.
    ///
    /// When applied to an input field:
    /// - Displays a red asterisk (*) next to the label
    /// - Makes the field required - empty values are considered invalid
    /// - Shows error state when the field is empty and loses focus
    /// - Displays "This field is required" message if no custom error text is provided
    ///
    /// ## Usage
    /// ```swift
    /// SHDInput(
    ///     text: $name,
    ///     label: "Full Name",
    ///     placeholder: "Enter your name"
    /// )
    /// .inputVariant(variant: .obligatory, size: .md)
    /// ```
    case required
}
