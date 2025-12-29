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
    /// - Parameter length: The number of digits in the OTP.
    func setup(length: Int) {
        if otpDigits.count != length {
            otpDigits = Array(repeating: "", count: length)
        }
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

    // MARK: - Styling Logic Refactored

    /// Computes the styling information for the slot at the given index.
    /// Optimized for static grouping:
    /// - Length 4: Split at 2 (Groups of 2)
    /// - Length 6: Split at 3 (Groups of 3)
    /// - Length 8: No Split (Single group of 8)
    func slotStyle(
        at index: Int,
        totalCount: Int,
        variant: SHDInputOTPVariant,
        length: SHDInputOTPLength
    ) -> SHDInputOTPSlotStyle {

        guard case .separator = variant else {
            return calculateSimpleStyle(at: index, totalCount: totalCount)
        }

        let splitIndex: Int
        switch length {
        case .short: splitIndex = 2
        case .standard: splitIndex = 3
        case .extended: splitIndex = totalCount
        }

        let isStart = index == 0 || index == splitIndex
        let isEnd = index == splitIndex - 1 || index == totalCount - 1

        let showSeparator = index == splitIndex

        return SHDInputOTPSlotStyle(
            showSeparator: showSeparator,
            position: determinePosition(isStart: isStart, isEnd: isEnd)
        )
    }

    /// Helper for non-separator variants or basic single-group logic
    private func calculateSimpleStyle(at index: Int, totalCount: Int)
        -> SHDInputOTPSlotStyle
    {
        let isStart = index == 0
        let isEnd = index == totalCount - 1
        return SHDInputOTPSlotStyle(
            showSeparator: false,
            position: determinePosition(isStart: isStart, isEnd: isEnd)
        )
    }

    /// Maps start/end booleans to the position enum
    private func determinePosition(isStart: Bool, isEnd: Bool)
        -> SHDInputOTPSlotPosition
    {
        switch (isStart, isEnd) {
        case (true, true): return .single
        case (true, false): return .start
        case (false, true): return .end
        case (false, false): return .middle
        }
    }

    // MARK: - Validation & Config

    static func validateConfiguration(
        variant: SHDInputOTPVariant,
        length: SHDInputOTPLength,
        size: SHDInputOTPSizing
    ) -> (SHDInputOTPVariant, String?) {
        if length == .extended && variant != .joined {
            return (
                .joined,
                """
                    Fallback: Pattern/Separator Variants do not support extended length.
                    Switched to 'controlled' to prevent overflow
                """
            )
        }
        if length == .extended && size == .lg {
            return (
                variant,
                "Note: The combination of extended length with 'Large' size may overflow on small screens"
            )
        }
        return (variant, nil)
    }

    func validate(_ value: String, with pattern: SHDInputOTPRegex) -> Bool {
        guard !value.isEmpty else { return true }
        switch pattern {
        case .onlyNumbers: return value.allSatisfy { $0.isNumber }
        case .onlyLetters: return value.allSatisfy { $0.isLetter }
        case .onlyNumbersAndLetters:
            return value.allSatisfy { $0.isLetter || $0.isNumber }
        case .custom(let regex):
            let fullRegex = "^\(regex)+$"
            return value.range(of: fullRegex, options: .regularExpression)
                != nil
        }
    }
}
