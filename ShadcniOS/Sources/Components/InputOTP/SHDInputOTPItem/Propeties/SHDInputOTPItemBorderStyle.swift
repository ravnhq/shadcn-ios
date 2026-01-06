//
//  SHDInputOTPItemBorderStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/30/25.
//

/// Configuration for the border style and visual appearance of an OTP input item.
///
/// ## Overview
///
/// `SHDInputOTPItemBorderStyle` determines how an individual OTP input field should be rendered,
/// specifically which corners should be rounded and whether a separator should be displayed.
/// This allows adjacent input fields to appear visually connected as a group.
///
/// ## Properties
///
/// - `isStart`: Whether this item is at the start of a group, determining if the leading corners should be rounded.
/// - `isEnd`: Whether this item is at the end of a group, determining if the trailing corners should be rounded.
/// - `showSeparator`: Whether a visual separator should be displayed after this item.
///
/// ## Usage
///
/// This struct is typically created by `SHDInputOTPViewModel.bordersState(at:length:isSeparated:)`
/// based on the item's position within the OTP code and the grouping configuration.
///
/// ```swift
/// let borderStyle = SHDInputOTPItemBorderStyle(
///     isStart: true,
///     isEnd: false,
///     showSeparator: false
/// )
/// ```
struct SHDInputOTPItemBorderStyle {
    /// Whether this item is at the start of a group.
    ///
    /// When `true`, the leading corners (top-leading and bottom-leading) will be rounded.
    let isStart: Bool
    
    /// Whether this item is at the end of a group.
    ///
    /// When `true`, the trailing corners (top-trailing and bottom-trailing) will be rounded.
    let isEnd: Bool
    
    /// Whether a visual separator should be displayed after this item.
    ///
    /// When `true` and separators are enabled, a circular separator dot will be shown
    /// between this item and the next one.
    let showSeparator: Bool
}
