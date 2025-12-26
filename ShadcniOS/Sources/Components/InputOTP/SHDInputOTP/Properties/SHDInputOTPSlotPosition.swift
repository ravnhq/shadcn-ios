//
//  SHDInputOTPSlotPosition.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/25/25.
//

/// Defines the position of an OTP input slot within the sequence.
///
/// ## Discussion
///
/// `OTPSlotPosition` indicates where a particular input field appears in the OTP component's layout.
/// This information is used to apply appropriate styling, such as rounded corners and separators,
/// based on the field's position relative to other fields.
///
/// The positions help create a cohesive visual appearance:
/// - `single`: A standalone field with fully rounded corners
/// - `start`: The first field in a sequence, with rounded left corners
/// - `middle`: An intermediate field with no rounded corners
/// - `end`: The last field in a sequence, with rounded right corners
///
internal enum SHDInputOTPSlotPosition {
    /// A single, standalone input field.
    case single

    /// The first input field in a sequence.
    case start

    /// An intermediate input field in a sequence.
    case middle

    /// The last input field in a sequence.
    case end
}
