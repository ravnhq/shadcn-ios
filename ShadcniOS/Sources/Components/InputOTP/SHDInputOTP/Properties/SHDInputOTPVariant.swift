//
//  SHDInputOTPVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

/// Defines the visual layout variant for the OTP input component.
///
/// ## Discussion
///
/// `SHDInputOTPVariant` determines how OTP input fields are displayed and organized, controlling
/// whether separators appear between fields, whether captions are shown, and how fields are grouped.
///
/// The three layout variants provide distinct visual presentations optimized for different use cases:
///
/// - `Controlled`: Standard layout that displays optional caption text below the input fields.
///   Use this when you need to provide instructions or context about the OTP requirement.
/// - `Pattern`: Clean, minimal layout without separators or captions. Ideal for streamlined designs
///   where context is provided elsewhere or when space is limited.
/// - `Separator`: Grouped layout that automatically inserts visual separators (dots) between fields
///   at specified intervals. Makes longer codes easier to read and parse visually.
///
/// The separator placement is calculated automatically based on the `groupOf` parameter. When using
/// the separator variant, the component's layout extensions calculate group boundaries and apply
/// rounded corners appropriately to grouped fields.
///
/// ## Usage
///
/// ```swift
///  // Default variant (controlled), allows you set a caption label
/// SHDInputOTP(caption: "Enter the 6-digit code sent to your email")
///
/// // Pattern variant for minimal, clean design
/// SHDInputOTP()
///     .inputOTPConfiguration(variant: .pattern, size: .sm, length: .standard)
/// ```
///
public enum SHDInputOTPVariant: Equatable, Hashable {
    /// Standard layout with caption text displayed below the input fields.
    case controlled

    /// Grouped layout with visual separators (dots) dividing input fields into segments.
    ///
    /// - Parameter groupOf: The number of digits in each group before a separator appears.
    ///   This variant only works with lengths of 4 (using 2 chunks of 2 digits) and 6 (using 2 chunks of 3 digits).
    case separator

    case pattern(SHDInputOTPRegex)
}
//
//enum SeparationState {
//    case separated
//    case together
//}
