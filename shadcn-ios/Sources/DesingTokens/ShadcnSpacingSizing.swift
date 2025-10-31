//
//  ShadcnSpacingSizing.swift
//  shadcn-ios
//
//  Created by Jose Alvarez on 10/31/25.
//

import Foundation

/// A collection of standardized spacing values used throughout the Shadcn design system.
///
/// Use these values to apply consistent spacing between UI elements such as padding, margins,
/// or layout gaps. Each case corresponds to a predefined spacing constant that aligns with
/// the Shadcn design scale.
///
/// Example:
/// ```swift
/// VStack(spacing: ShadcnSpacingSizing.spacingMD.size) {
///     Text("Title")
///     Text("Subtitle")
/// }
/// ```
///
/// These spacing constants ensure visual harmony and design consistency across the app.
public enum ShadcnSpacingSizing: Double, CaseIterable {
    
    // MARK: - Spacing Scale
    
    /// No spacing (`0` points).
    case spacingNone = 0
    
    /// Extra extra small spacing (`2` points).
    case spacingXXS = 2
    
    /// Extra small spacing (`4` points).
    case spacingXS = 4
    
    /// Small spacing (`8` points).
    case spacingSM = 8
    
    /// Medium spacing (`12` points).
    case spacingMD = 12
    
    /// Large spacing (`16` points).
    case spacingLG = 16
    
    /// Extra large spacing (`24` points).
    case spacingXL = 24
    
    /// Extra extra large spacing (`32` points).
    case spacingXXL = 32
    
    /// 3× extra large spacing (`40` points).
    case spacing3XL = 40
    
    /// 4× extra large spacing (`64` points).
    case spacing4XL = 64
    
    // MARK: - Computed Property
    
    /// Returns the corresponding spacing value as a `CGFloat`.
    ///
    /// This property is useful when working with APIs that require a `CGFloat` value,
    /// such as layout spacing or padding modifiers.
    ///
    /// Example:
    /// ```swift
    /// HStack(spacing: ShadcnSpacingSizing.spacingLG.size) {
    ///     IconView()
    ///     Text("Label")
    /// }
    /// ```
    public var size: CGFloat {
        CGFloat(rawValue)
    }
}
