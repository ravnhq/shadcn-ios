//
//  Color+Hex.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/30/25.
//

import SwiftUI

extension Color {
    /// Creates a `Color` instance from a hexadecimal color string.
    ///
    /// This initializer supports several common hex formats, with or without a leading `#`:
    ///
    /// | Format | Example | Description |
    /// |:-------|:--------|:-------------|
    /// | `#RGB` or `RGB` | `#F00` | 12-bit RGB, each digit expanded (e.g., `F` → `FF`) |
    /// | `#RRGGBB` or `RRGGBB` | `#FF0000` | 24-bit RGB |
    /// | `#AARRGGBB` or `AARRGGBB` | `#80FF0000` | 32-bit ARGB (includes alpha channel) |
    ///
    /// - Important:
    ///   The alpha component is **only** read in 8-digit (`AARRGGBB`) format.
    ///   For 3- and 6-digit hex codes, full opacity (`1.0`) is assumed.
    ///
    /// - Parameter hex: A hexadecimal color string (e.g. `"FF0000"`, `"#FF000080"`).
    ///
    /// - Note:
    ///   If the string cannot be parsed as a valid hex color, the initializer defaults to `.clear`.
    ///
    /// - Example:
    ///   ```swift
    ///   Color(hex: "#FF0000")      // red
    ///   Color(hex: "FF000080")     // red with 50% opacity
    ///   Color(hex: "#0F0")         // green
    ///   Color(hex: "invalid")      // clear
    ///   ```
    ///
    /// - Returns: A `Color` corresponding to the given hex string, or `.clear` if invalid.
    public init(hex: String) {
        // Remove non-alphanumeric characters (e.g. "#", spaces)
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        
        // Default values: transparent color
        var a, r, g, b: UInt64
        a = 0; r = 0; g = 0; b = 0
        
        // Attempt to scan the hex string
        if Scanner(string: hex).scanHexInt64(&int) {
            switch hex.count {
            case 3: // RGB (12-bit): e.g. F00
                (a, r, g, b) = (
                    255,
                    (int >> 8) * 17,
                    (int >> 4 & 0xF) * 17,
                    (int & 0xF) * 17
                )
            case 6: // RGB (24-bit): e.g. FF0000
                (a, r, g, b) = (
                    255,
                    int >> 16,
                    int >> 8 & 0xFF,
                    int & 0xFF
                )
            case 8: // ARGB (32-bit): e.g. FF000080
                (a, r, g, b) = (
                    int >> 24,
                    int >> 16 & 0xFF,
                    int >> 8 & 0xFF,
                    int & 0xFF
                )
            default:
                break
            }
        }
        
        // Initialize color; invalid input defaults to clear
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
