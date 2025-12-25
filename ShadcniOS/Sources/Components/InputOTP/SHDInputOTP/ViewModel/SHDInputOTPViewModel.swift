//
//  SHDInputOTPViewModel.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/25/25.
//

import Foundation
import Observation

@Observable
final class SHDInputOTPViewModel {
    var otpDigits: [String] = []

    var firstEmptyIndex: Int {
        otpDigits.firstIndex(where: { $0.isEmpty }) ?? (otpDigits.count - 1)
    }

    var currentCode: String {
        otpDigits.joined()
    }

    func setup(length: Int) {
        if otpDigits.count != length {
            otpDigits = Array(repeating: "", count: length)
        }
    }

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

    /// Computes the set of slot indices where separators should be displayed.
    ///
    /// Separators are placed after each complete group, so the returned indices represent
    /// the positions where a separator should appear before the slot at that index.
    ///
    /// - Parameter length: The OTP length configuration.
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
    /// - Parameter length: The OTP length configuration.
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

    /// Validates the combination of variant and length.
    /// - Returns: A tuple with the validated (or fallback) variant and an optional message.
    static func validateConfiguration(
        variant: SHDInputOTPVariant,
        length: SHDInputOTPLength,
        size: SHDInputOTPSizing
    ) -> (SHDInputOTPVariant, String?) {

        if length == .extended && variant != .controlled {
            return (
                .controlled,
                "Fallback: Pattern/Separator Variants do not support extended length. Switched to 'controlled' to prevent overflow"
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
}
