//
//  SHDInputSize.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/8/25.
//

import SwiftUI

/// Defines the size variants for `SHDInput`.
///
/// Input sizes control the overall scale of the input field, including
/// text size, icon dimensions, padding, and visual spacing.
public enum SHDInputSize {
    /// Small input size.
    ///
    /// - Text style: `.textSMMedium`
    /// - Icon size: `.sm`
    /// - Compact padding and spacing
    ///
    /// Use for dense layouts or secondary input fields where space is limited.
    ///
    /// ## Usage
    /// ```swift
    /// SHDInput(
    ///     text: $searchText,
    ///     label: "Search",
    ///     placeholder: "Type to search..."
    /// )
    /// .inputVariant(variant: .default, size: .sm)
    /// ```
    case sm

    /// Medium input size (default).
    ///
    /// - Text style: `.textBaseMedium`
    /// - Icon size: `.md`
    /// - Balanced padding and spacing
    ///
    /// The recommended default size for most input fields, providing
    /// a good balance between readability and space efficiency.
    ///
    /// ## Usage
    /// ```swift
    /// SHDInput(
    ///     text: $emailText,
    ///     label: "Email",
    ///     placeholder: "you@example.com"
    /// )
    /// .inputVariant(variant: .default, size: .md)
    /// ```
    case md

    /// Large input size.
    ///
    /// - Text style: `.textLGMedium`
    /// - Icon size: `.lg`
    /// - Generous padding and spacing
    ///
    /// Use for prominent input fields, accessibility considerations,
    /// or when you want to emphasize the importance of the field.
    ///
    /// ## Usage
    /// ```swift
    /// SHDInput(
    ///     text: $nameText,
    ///     label: "Full Name",
    ///     placeholder: "Enter your name"
    /// )
    /// .inputVariant(variant: .default, size: .lg)
    /// ```
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
