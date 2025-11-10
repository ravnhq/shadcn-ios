//
//  SHDTextStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import SwiftUI

/// Defines a text style configuration used internally in ShadcniOS.
internal struct SHDTextStyle {

    /// The relative system text style (e.g. `.body`, `.headline`).
    let relativeFont: Font.TextStyle

    /// The custom font used for rendering text.
    let font: InterFont

    /// The font weight.
    let weight: InterFont.Weight

    /// The base font size in points.
    let size: CGFloat

    /// The line height for the text.
    let lineHeight: CGFloat

    /// The letter spacing (kerning).
    let letterSpacing: CGFloat

    /// Whether the text is underlined.
    let underline: Bool
}
