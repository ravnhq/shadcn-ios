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

    /// Determines whether a separator should be displayed before the slot at the given index.
    ///
    /// This method checks if the slot at the specified index is the start of a new group
    /// in separator variants. For non-separator variants, this always returns `false`.
    ///
    /// - Parameters:
    ///   - index: The zero-based index of the slot to check.
    ///   - length: The OTP length configuration.
    /// - Returns: `true` if a separator should be shown before this slot, `false` otherwise.
    ///
    func shouldShowSeparator(
        at index: Int,
        variant: SHDInputOTPVariant,
        length: SHDInputOTPLength
    ) -> Bool {
        separatorIndices(for: length, variant: variant).contains(index)
    }

    /// Checks if the slot at the given index is the first slot in its visual group.
    ///
    /// A slot is considered the start of a group if it's the first slot (index 0) or if
    /// a separator appears before it. This is used to determine corner radius styling
    /// for grouped slots.
    ///
    /// - Parameters:
    ///   - index: The zero-based index of the slot to check.
    ///   - length: The OTP length configuration.
    /// - Returns: `true` if the slot is at the start of a group, `false` otherwise.
    ///
    func isStartOfGroup(
        index: Int,
        variant: SHDInputOTPVariant,
        length: SHDInputOTPLength
    ) -> Bool {
        index == 0
            || separatorIndices(for: length, variant: variant).contains(index)
    }

    /// Checks if the slot at the given index is the last slot in its visual group.
    ///
    /// A slot is considered the end of a group if it's the last slot overall or if a
    /// separator appears after it (before the next slot). This is used to determine
    /// corner radius styling for grouped slots.
    ///
    /// - Parameters:
    ///   - index: The zero-based index of the slot to check.
    ///   - totalCount: The total number of slots in the OTP input.
    ///   - length: The OTP length configuration.
    /// - Returns: `true` if the slot is at the end of a group, `false` otherwise.
    func isEndOfGroup(
        index: Int,
        totalCount: Int,
        variant: SHDInputOTPVariant,
        length: SHDInputOTPLength
    ) -> Bool {
        index == totalCount - 1
            || separatorIndices(for: length, variant: variant).contains(
                index + 1
            )
    }

    /// Computes the styling information for the slot at the given index.
    ///
    /// This includes determining the position (start, middle, end, single) and whether
    /// a separator should be shown before this slot.
    ///
    /// - Parameters:
    ///   - index: The zero-based index of the slot.
    ///   - totalCount: The total number of slots.
    ///   - variant: The OTP variant configuration.
    ///   - length: The OTP length configuration.
    /// - Returns: An `OTPSlotStyle` containing the position and separator flag.
    func slotStyle(
        at index: Int,
        totalCount: Int,
        variant: SHDInputOTPVariant,
        length: SHDInputOTPLength
    ) -> SHDInputOTPSlotStyle {
        let isStart = isStartOfGroup(
            index: index,
            variant: variant,
            length: length
        )

        let isEnd = isEndOfGroup(
            index: index,
            totalCount: totalCount,
            variant: variant,
            length: length
        )

        let position: SHDInputOTPSlotPosition
        switch (isStart, isEnd) {
        case (true, true): position = .single
        case (true, false): position = .start
        case (false, true): position = .end
        case (false, false): position = .middle
        }

        return SHDInputOTPSlotStyle(
            showSeparator: shouldShowSeparator(
                at: index,
                variant: variant,
                length: length
            ),
            position: position
        )
    }

    /// Computes the set of slot indices where separators should be displayed.
    ///
    /// Separators are placed after each complete group, so the returned indices represent
    /// the positions where a separator should appear before the slot at that index.
    ///
    /// - Parameters:
    ///   - length: The OTP length configuration.
    ///   - variant: The OTP variant configuration.
    /// - Returns: A set of zero-based indices where separators should be shown.
    private func separatorIndices(
        for length: SHDInputOTPLength,
        variant: SHDInputOTPVariant
    ) -> Set<Int> {
        guard let groupSize = effectiveGroupSize(for: length, variant: variant),
            groupSize > 0
        else {
            return []
        }
        return Set(stride(from: groupSize, to: length.digits, by: groupSize))
    }

    /// Computes the effective group size for separator placement based on variant and length.
    ///
    /// For `.separator` variants, this method returns the number of digits per group.
    /// For other variants, it returns `nil` since grouping is not applicable.
    ///
    /// - Parameters:
    ///   - length: The OTP length configuration.
    ///   - variant: The OTP variant configuration.
    /// - Returns: The effective group size, or `nil` if grouping is not applicable.
    private func effectiveGroupSize(
        for length: SHDInputOTPLength,
        variant: SHDInputOTPVariant
    ) -> Int? {
        guard case .separator = variant else {
            return nil
        }

        switch length {
        case .short: return 2
        case .standard: return 3
        case .extended: return 0
        }
    }

    /// Validates the combination of variant, length, and size configurations.
    ///
    /// This method checks for incompatible combinations and provides fallbacks or warnings.
    /// For example, extended length only supports the controlled variant.
    ///
    /// - Parameters:
    ///   - variant: The OTP variant configuration.
    ///   - length: The OTP length configuration.
    ///   - size: The OTP sizing configuration.
    /// - Returns: A tuple with the validated (or fallback) variant and an optional warning message.
    static func validateConfiguration(
        variant: SHDInputOTPVariant,
        length: SHDInputOTPLength,
        size: SHDInputOTPSizing
    ) -> (SHDInputOTPVariant, String?) {

        if length == .extended && variant != .controlled {
            return (
                .controlled,
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
        case .onlyNumbers:
            let result = value.allSatisfy { $0.isNumber }
            return result

        case .onlyLetters:
            let result = value.allSatisfy { $0.isLetter }
            return result

        case .onlyNumbersAndLetters:
            let result = value.allSatisfy { $0.isLetter || $0.isNumber }
            return result

        case .custom(let regex):
            let fullRegex = "^\(regex)+$"
            let matches =
                value.range(
                    of: fullRegex,
                    options: .regularExpression
                ) != nil
            return matches
        }
    }
}
