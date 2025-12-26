//
//  SHDInputOTPLength.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/10/25.
//

/// Defines the number of input digits for the OTP component.
///
/// ## Discussion
///
/// `SHDInputOTPLength` specifies how many digit fields are displayed and expected in the OTP input component.
/// Different authentication systems use different OTP lengths based on security and usability requirements.
///
/// The three standard lengths accommodate common OTP formats (exposed as enum cases):
/// - `.short`: 4-digit codes, used for quick verification in some systems
/// - `.standard`: 6-digit codes, the industry standard for TOTP-based authentication
/// - `.extended`: 8-digit codes, used for higher security requirements
///
/// Changing the length dynamically resets all existing input and refocuses the first field.
///
/// ## Usage
///
/// ```swift
/// // Default 6-digit OTP
/// SHDInputOTP()
///
/// // Shorter 4-digit code
/// SHDInputOTP()
///     .inputOTPConfiguration(length: .short)
///
/// // Extended 8-digit code for high security
/// SHDInputOTP(caption: "Enter the 8-digit verification code")
///     .inputOTPConfiguration(variant: .separator, length: .extended)
/// ```
///
public enum SHDInputOTPLength {
    /// Four-digit OTP.
    case short

    /// Six-digit OTP.
    case standard

    /// Eight-digit OTP.
    case extended

    var digits: Int {
        switch self {
        case .short: 4
        case .standard: 6
        case .extended: 8
        }
    }
}
