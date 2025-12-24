//
//  SHDInputOTPVariant+Math.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

/// Mathematical and grouping utilities for `SHDInputOTPVariant`.
///
/// ## Description
///
/// This extension provides helper methods for computing separator positions and group boundaries
/// in OTP input layouts. It enables the component to determine where visual separators should
/// appear and which slots belong to the same visual group based on the variant configuration
/// and OTP length.
///
/// ## Discussion
///
/// The extension implements length-aware grouping logic that adapts separator placement based
/// on the configured `SHDInputOTPLength`. For separator variants, the effective group size
/// varies by OTP length:
/// - `.short`: Always groups by 2 (e.g., "12-34")
/// - `.standard`: Always groups by 3 (e.g., "123-456")
/// - `.extended`: Supports grouping by 2 or 4 based on the variant's `groupOf` parameter
///
/// The grouping logic ensures that separators are placed consistently and that adjacent slots
/// within the same group share visual styling (rounded corners only at group boundaries).
///
/// ## Functions → Public functions
///
/// - `shouldShowSeparator(at:length:)`: Determines if a separator should be displayed
///   before the slot at the given index.
/// - `isStartOfGroup(index:length:)`: Checks if the slot at the given index is the first
///   slot in its visual group.
/// - `isEndOfGroup(index:totalCount:length:)`: Checks if the slot at the given index is
///   the last slot in its visual group.
internal extension SHDInputOTPVariant {
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
        length: SHDInputOTPLength
    ) -> Bool {
        separatorIndices(for: length).contains(index)
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
        length: SHDInputOTPLength
    ) -> Bool {
        index == 0 || separatorIndices(for: length).contains(index)
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
    ///

    func isEndOfGroup(
        index: Int,
        totalCount: Int,
        length: SHDInputOTPLength
    ) -> Bool {
        index == totalCount - 1
            || separatorIndices(for: length).contains(index + 1)
    }

    /// Computes the effective group size for separator placement based on variant and length.
    ///
    /// For `.separator` variants, this method returns the number of digits per group.
    /// For other variants, it returns `nil` since grouping is not applicable.
    ///
    /// - Parameter length: The OTP length configuration.
    /// - Returns: The effective group size, or `nil` if grouping is not applicable.
    private func effectiveGroupSize(
        for length: SHDInputOTPLength
    ) -> Int? {
        guard case .separator = self else {
            return nil
        }
        return switch length {
        case .short: 2
        case .standard: 3
        case .extended: 0
        }
    }

    /// Computes the set of slot indices where separators should be displayed.
    ///
    /// Separators are placed after each complete group, so the returned indices represent
    /// the positions where a separator should appear before the slot at that index.
    ///
    /// - Parameter length: The OTP length configuration.
    /// - Returns: A set of zero-based indices where separators should be shown.
    private func separatorIndices(
        for length: SHDInputOTPLength
    ) -> Set<Int> {
        guard let groupSize = effectiveGroupSize(for: length),
            groupSize > 0
        else {
            return []
        }

        return Set(
            stride(from: groupSize, to: length.digits, by: groupSize)
        )
    }

    /// Validates the combination of variant and length.
    /// - Returns: A tuple with the validated (or fallback) variant and an optional message.
    func validations(
        for length: SHDInputOTPLength,
        size: SHDInputOTPSizing
    ) -> (SHDInputOTPVariant, String?) {

        if length == .extended && self != .controlled {
            return (
                .controlled,
                "Fallback: Pattern/Separator Variants do not support extended length. Switched to 'controlled' to prevent overflow"
            )
        }

        if length == .extended && size == .lg {
            return (
                self,
                "Note: The combination of extended length with 'Large' size may overflow on small screens"
            )
        }

        return (self, nil)
    }
}
