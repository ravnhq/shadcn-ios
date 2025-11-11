//
//  SHDSizing.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import Foundation

/// A unified collection of standardized sizing values used throughout the Shadcn design system.
///
/// This type defines consistent design tokens for:
/// - **Padding**: Internal spacing within components.
/// - **Spacing**: External spacing between elements.
/// - **Radius**: Corner rounding for shapes and containers.
///
/// Each sub-enum corresponds to a specific design dimension scale,
/// ensuring predictable and consistent UI spacing and rounding.
///
/// Example:
/// ```swift
/// VStack(spacing: SHDSizing.Spacing.spacingMD.value) {
///     Text("Hello, world!")
///         .padding(.all, SHDSizing.Padding.paddingLG.value)
///         .cornerRadius(SHDSizing.Radius.radiusMD.value)
/// }
/// ```
internal enum SHDSizing {

    // MARK: - Padding
    /// Defines standardized padding values for internal component spacing.
    internal enum Padding: Double, CaseIterable {

        /// No padding (`0` points).
        case none = 0

        /// Extra extra small padding (`8` points).
        case xxs = 8

        /// Extra small padding (`12` points).
        case xs = 12

        /// Small padding (`16` points).
        case sm = 16

        /// Medium padding (`20` points).
        case md = 20

        /// Large padding (`24` points).
        case lg = 24

        /// Extra large padding (`32` points).
        case xl = 32

        /// Extra extra large padding (`40` points).
        case xxl = 40

        /// 3× extra large padding (`48` points).
        case xxxl = 48

        /// 4× extra large padding (`64` points).
        case xxxxl = 64

        /// Returns the padding value as a `CGFloat`.
        var value: CGFloat { CGFloat(rawValue) }
    }

    // MARK: - Spacing
    /// Defines standardized spacing values for layout gaps between UI elements.
    internal enum Spacing: Double, CaseIterable {

        /// No spacing (`0` points).
        case none = 0

        /// Extra extra small spacing (`2` points).
        case xxs = 2

        /// Extra small spacing (`4` points).
        case xs = 4

        /// Small spacing (`8` points).
        case sm = 8

        /// Medium spacing (`12` points).
        case md = 12

        /// Large spacing (`16` points).
        case lg = 16

        /// Extra large spacing (`24` points).
        case xl = 24

        /// Extra extra large spacing (`32` points).
        case xxl = 32

        /// 3× extra large spacing (`40` points).
        case xxxl = 40

        /// 4× extra large spacing (`64` points).
        case xxxxl = 64

        /// Returns the spacing value as a `CGFloat`.
        var value: CGFloat { CGFloat(rawValue) }
    }

    // MARK: - Radius
    /// Defines standardized corner radius values used for rounded shapes and containers.
    internal enum Radius: Double, CaseIterable {

        /// No corner radius (`0` points).
        case none = 0

        /// Extra small corner radius (`2` points).
        case xs = 2

        /// Small corner radius (`4` points).
        case sm = 4

        /// Medium corner radius (`8` points).
        case md = 8

        /// Large corner radius (`12` points).
        case lg = 12

        /// Extra large corner radius (`16` points).
        case xl = 16

        /// Extra extra large corner radius (`24` points).
        case xxl = 24

        /// Fully rounded corners (`400` points), typically used for circular elements.
        case full = 400

        /// Returns the corner radius value as a `CGFloat`.
        var value: CGFloat { CGFloat(rawValue) }
    }
}
