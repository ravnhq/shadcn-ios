//
//  SHDInputOTPSlotStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/26/25.
//

/// Defines the styling configuration for an individual OTP input slot.
///
/// ## Discussion
///
/// `SHDInputOTPSlotStyle` encapsulates the visual properties that determine how an OTP input field
/// is rendered, including whether separators are displayed and the field's position in the sequence.
/// This configuration is used internally by the OTP component to apply consistent styling
/// across all input slots based on the component's variant and layout requirements.
///
internal struct SHDInputOTPSlotStyle {
    /// A Boolean value indicating whether a separator should be displayed after this slot.
    let showSeparator: Bool

    /// The position of this slot within the OTP input sequence.
    let position: SHDInputOTPSlotPosition
}
