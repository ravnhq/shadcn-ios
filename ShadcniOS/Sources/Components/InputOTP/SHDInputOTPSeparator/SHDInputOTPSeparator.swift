//
//  SHDInputOTPSeparator.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import SwiftUI

/// A small visual separator used between grouped OTP slots.
///
/// ## Description
///
/// `SHDInputOTPSeparator` renders a small circular dot used to separate groups of OTP digits
/// when the `.separator(groupOf:)` variant is selected. The separator is lightweight and
/// intended to be used inline between `SHDInputOTPItem` views.
///
/// ## Discussion
///
/// The separator uses the design system's `SHDColor.iconDefault` for its fill color to
/// ensure consistent iconography color across the component. It is sized to `4×4` points
/// and includes horizontal padding to maintain readable spacing between groups.
///
/// The view has no configurable parameters and is typically inserted by `SHDInputOTP` based
/// on the selected `SHDInputOTPVariant`.
///
/// ## Usage
///
/// ```swift
/// // Internally used by SHDInputOTP when variant == .separator(...)
/// HStack(spacing: 0) {
///     SHDInputOTPItem(...)
///     if variant.shouldShowSeparator(at: index) {
///         SHDInputOTPSeparator()
///     }
///     SHDInputOTPItem(...)
/// }
/// ```
internal struct SHDInputOTPSeparator: View {
    var body: some View {
        Circle()
            .fill(SHDColor.iconDefault.color)
            .frame(width: 4, height: 4)
            .padding(.horizontal, 8)
    }
}
