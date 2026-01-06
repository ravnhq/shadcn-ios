//
//  SHDInputOTPViewModel.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/25/25.
//

import Foundation
import Observation

/// ViewModel for managing the state and logic of the SHDInputOTP component.
///
/// This class handles the OTP digits array, input validation, focus management, and styling calculations.
/// It uses the `@Observable` macro for reactive updates in SwiftUI.
@Observable
final internal class SHDInputOTPViewModel {
    /// The array of OTP digits, each as a string (empty or single character).
    var otpDigits: [String] = []

    /// The index of the first empty slot in the OTP digits array.
    /// If all slots are filled, returns the last index.
    var firstEmptyIndex: Int {
        otpDigits.firstIndex(where: { $0.isEmpty }) ?? (otpDigits.count - 1)
    }

    /// The concatenated string of all OTP digits.
    var currentCode: String {
        otpDigits.joined()
    }

    /// Initializes or resets the OTP digits array to the specified length.
    ///
    /// - Parameter length: The type of length to extract the digits.
    func setup(for length: SHDInputOTPLength) {
        otpDigits = Array(repeating: "", count: length.digits)
    }

    /// Handles input changes for a specific slot, enforcing single-character
    /// input and determining focus movement.
    ///
    /// - Parameters:
    ///   - value: The new input value for the slot.
    ///   - index: The index of the slot being updated.
    /// - Returns: The index to focus next, or `nil` if no focus change is needed.
    func handleInputChange(_ value: String, at index: Int) -> Int? {
        var newValue = value

        if value.count > 1 {
            newValue = String(value.suffix(1))
        }

        otpDigits[index] = newValue

        if newValue.count == 1, index < otpDigits.count - 1 {
            return index + 1
        } else if value.isEmpty, index > 0 {
            return index - 1
        }

        return nil
    }

    /// Validates and corrects the target focus index to prevent jumping ahead of empty slots.
    ///
    /// - Parameter targetIndex: The proposed focus index.
    /// - Returns: The corrected focus index, or `nil` if no correction is needed.
    func validateFocus(targetIndex: Int?) -> Int? {
        guard let target = targetIndex else { return nil }

        if target > firstEmptyIndex {
            return firstEmptyIndex
        }
        return nil
    }

    func bordersState(
        at index: Int,
        length: SHDInputOTPLength,
        isSeparated: Bool
    ) -> SHDInputOTPItemBorderStyle {

        let groupSize = length.groupSize(isSeparated: isSeparated)

        let isGroupStart = index % groupSize == 0
        let isGroupEnd = (index + 1) % groupSize == 0
        let isLastIndex = index == length.digits - 1
        let isStart = isGroupStart
        let isEnd = isGroupEnd || isLastIndex
        let showSeparator = isGroupEnd && !isLastIndex

        return SHDInputOTPItemBorderStyle(
            isStart: isStart,
            isEnd: isEnd,
            showSeparator: showSeparator
        )
    }
}
