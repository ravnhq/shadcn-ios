//
//  Shape+Radius.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/20/25.
//

import SwiftUI

/// A convenience initializer that allows using the ShadcniOS
/// design system's radius tokens (`SHDSizing.Radius`) directly
/// with SwiftUI's `RoundedRectangle`.
///
/// ### Discussion
/// `RoundedRectangle` normally requires a `CGFloat` for its corner radius.
/// Since ShadcniOS provides predefined radius tokens through
/// `SHDSizing.Radius`, this extension improves ergonomics by enabling:
///
/// ```swift
/// RoundedRectangle(cornerRadius: .lg)
/// ```
///
/// instead of:
///
/// ```swift
/// RoundedRectangle(cornerRadius: SHDSizing.Radius.lg.value)
/// ```
///
/// This keeps button, card, and component styling consistent with the
/// design system while reducing verbosity.
///
/// ### Usage
///
/// ```swift
/// RoundedRectangle(cornerRadius: .md)
///     .fill(.blue)
///     .frame(width: 100, height: 50)
/// ```
///
/// Or as part of overlays and backgrounds:
///
/// ```swift
/// .overlay(
///     RoundedRectangle(cornerRadius: .xl)
///         .stroke(Color.gray.opacity(0.3), lineWidth: 1)
/// )
/// ```
///
extension RoundedRectangle {

    /// Creates a `RoundedRectangle` using a ShadcniOS radius token.
    ///
    /// - Parameter radius: A design-system radius from `SHDSizing.Radius`.
    /// - Note: Internally converts the token to a `CGFloat`.
    init(cornerRadius radius: SHDSizing.Radius) {
        self.init(cornerRadius: radius.value)
    }
}
