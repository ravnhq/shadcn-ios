//
//  ShadcnSizing.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import Foundation

/// A collection of standardized corner radius values used throughout the Shadcn design system.
///
/// Use these values to apply consistent corner rounding to UI components such as buttons, cards,
/// or containers. Each case corresponds to a predefined radius constant that aligns with
/// the Shadcn design scale.
///
/// Example:
/// ```swift
/// myView.layer.cornerRadius = ShadcnRadiusSizing.radiusMD.size
/// ```
///
/// These radius constants ensure a cohesive and visually balanced design across the app.
public enum ShadcnRadiusSizing: Double, CaseIterable {
    
    // MARK: - Radius Scale
    
    /// No corner radius (`0` points).
    case radiusNone = 0
    
    /// Extra small corner radius (`2` points).
    case radiusXS = 2
    
    /// Small corner radius (`4` points).
    case radiusSM = 4
    
    /// Medium corner radius (`8` points).
    case radiusMD = 8
    
    /// Large corner radius (`12` points).
    case radiusLG = 12
    
    /// Extra large corner radius (`16` points).
    case radiusXL = 16
    
    /// Extra extra large corner radius (`24` points).
    case radiusXXL = 24
    
    /// Fully rounded corners (`400` points), typically used for circular elements.
    case radiusFull = 400
    
    // MARK: - Computed Property
    
    /// Returns the corresponding radius value as a `CGFloat`.
    ///
    /// This property is useful when working with APIs that require a `CGFloat` value,
    /// such as setting corner radii for `CALayer` or SwiftUI views.
    ///
    /// Example:
    /// ```swift
    /// button.layer.cornerRadius = ShadcnRadiusSizing.radiusLG.size
    /// ```
    public var size: CGFloat {
        CGFloat(rawValue)
    }
}
