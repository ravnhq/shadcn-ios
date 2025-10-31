//
//  ShadcnPaddingSizing.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import Foundation

/// A collection of standardized padding values used throughout the Shadcn design system.
///
/// Use these values to apply consistent internal spacing (padding) within UI components
/// such as buttons, cards, or containers. Each case corresponds to a predefined padding constant
/// that aligns with the Shadcn design scale.
///
/// Example:
/// ```swift
/// VStack {
///     Text("Title")
///         .padding(.all, ShadcnPaddingSizing.paddingMD.size)
/// }
/// ```
///
/// These padding constants help maintain visual consistency and predictable spacing
/// throughout the app’s user interface.
public enum ShadcnPaddingSizing: Double, CaseIterable {
    
    // MARK: - Padding Scale
    
    /// No padding (`0` points).
    case paddingNone = 0
    
    /// Extra extra small padding (`8` points).
    case paddingXXS = 8
    
    /// Extra small padding (`12` points).
    case paddingXS = 12
    
    /// Small padding (`16` points).
    case paddingSM = 16
    
    /// Medium padding (`20` points).
    case paddingMD = 20
    
    /// Large padding (`24` points).
    case paddingLG = 24
    
    /// Extra large padding (`32` points).
    case paddingXL = 32
    
    /// Extra extra large padding (`40` points).
    case paddingXXL = 40
    
    /// 3× extra large padding (`48` points).
    case padding3XL = 48
    
    /// 4× extra large padding (`64` points).
    case padding4XL = 64
    
    // MARK: - Computed Property
    
    /// Returns the corresponding padding value as a `CGFloat`.
    ///
    /// This property is useful when working with layout or modifier APIs that expect
    /// a `CGFloat` value for padding or insets.
    ///
    /// Example:
    /// ```swift
    /// HStack {
    ///     IconView()
    ///     Text("Label")
    /// }
    /// .padding(.horizontal, ShadcnPaddingSizing.paddingLG.size)
    /// ```
    public var size: CGFloat {
        CGFloat(rawValue)
    }
}
