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
/// The three standard lengths accommodate common OTP formats:
/// - `OTP4`: 4-digit codes, used for quick verification in some systems
/// - `OTP6`: 6-digit codes, the industry standard for TOTP-based authentication
/// - `OTP8`: 8-digit codes, used for higher security requirements
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
///     .inputOTPConfiguration(length: .otp4)
///
/// // Extended 8-digit code for high security
/// SHDInputOTP(caption: "Enter the 8-digit verification code")
///     .inputOTPConfiguration(variant: .separator(groupOf: 2), length: .otp8)
/// ```
///
public enum SHDInputOTPLength {
    /// Four-digit OTP.
    case otp4

    /// Six-digit OTP.
    case otp6

    /// Eight-digit OTP.
    case otp8

    var digits: Int {
        switch self {
        case .otp4: 4
        case .otp6: 6
        case .otp8: 8
        }
    }
}
