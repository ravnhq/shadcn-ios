//
//  SHDInputOTPVariant+Math.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

internal extension SHDInputOTPVariant {
    /// Returns whether a separator should be shown immediately before the field at `index`.
    ///
    /// - Parameter index: The zero-based slot index within the OTP sequence.
    /// - Returns: `true` if a separator should appear before the slot at `index`, otherwise `false`.
    ///
    /// This helper uses the `dividedBy` value (group size) from the variant to determine
    /// whether a separator dot should be rendered. It returns `false` for non-separator variants.
    func shouldShowSeparator(at index: Int) -> Bool {
        guard dividedBy > 0 else { return false }
        return index > 0 && index % dividedBy == 0
    }

    /// Returns whether the field at `index` is the first field in its visual group.
    ///
    /// - Parameter index: The zero-based slot index within the OTP sequence.
    /// - Returns: `true` if the slot is the start of a group; otherwise `false`.
    ///
    /// For non-separator variants, the first slot (index == 0) is treated as the start.
    func isStartOfGroup(index: Int) -> Bool {
        guard dividedBy > 0 else { return index == 0 }
        return index % dividedBy == 0
    }

    /// Returns whether the field at `index` is the last field in its visual group.
    ///
    /// - Parameters:
    ///   - index: The zero-based slot index within the OTP sequence.
    ///   - totalCount: The total number of slots in the OTP.
    /// - Returns: `true` if the slot is the end of a group; otherwise `false`.
    ///
    /// For non-separator variants, the final slot (index == totalCount - 1) is treated as the end.
    func isEndOfGroup(index: Int, totalCount: Int) -> Bool {
        guard dividedBy > 0 else { return index == totalCount - 1 }
        return (index + 1) % dividedBy == 0 || index == totalCount - 1
    }
}
