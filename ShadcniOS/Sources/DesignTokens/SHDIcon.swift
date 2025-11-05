//
//  SHDIcon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/4/25.
//

import SwiftUI

// MARK: - SHDIcon

/// Enumeration of all supported icons available in the ShadcniOS Accessibility icon font file.
///
/// Each case maps to a specific Unicode glyph in the `.ttf` file.
/// The glyphs are typically generated from an icon font such as IcoMoon or Fontello.
public enum SHDIcon: String {
    case iconBabe = "\u{e900}"
    case iconBadgeHelp = "\u{e901}"
    case iconAlert = "\u{e90d}"
    case iconMoonStar = "\u{e90f}"
}
