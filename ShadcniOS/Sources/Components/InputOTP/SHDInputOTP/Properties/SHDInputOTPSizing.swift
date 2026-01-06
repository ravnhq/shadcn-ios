//
//  SHDInputOTPSizing.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import Foundation

/// Defines the visual size of individual OTP input fields.
///
/// ## Discussion
///
/// `SHDInputOTPSizing` controls both the physical dimensions and typography of OTP input slots.
/// Each size preset ensures visual harmony by pairing appropriately scaled field dimensions with
/// matching text styles from the design system.
///
/// Size variants balance touch target accessibility with compact layouts:
/// - `Small (.sm)`: 40×40 point fields with `.textSMRegular` typography
/// - `Medium (.md)`: 44×44 point fields with `.textBaseRegular` typography
/// - `Large (.lg)`: 48×48 point fields with `.textLGRegular` typography
///
/// Use smaller sizes in space-constrained layouts or when displaying longer OTP codes.
/// Use larger sizes to emphasize the input or improve touch accessibility.
///
/// ## Usage
///
/// ```swift
/// // Small compact OTP for limited space
/// SHDInputOTP()
///     .inputOTPConfiguration(size: .sm, length: .standard)
///
/// // Medium default size (recommended)
/// SHDInputOTP()
///     .inputOTPConfiguration(size: .md, length: .standard)
///
/// // Large accessible OTP
/// SHDInputOTP(caption: "Enter code")
///     .inputOTPConfiguration(size: .lg, length: .short)
/// ```
///
public enum SHDInputOTPSizing {
    /// Small input fields (40×40 points) with `.textSMRegular` typography.
    case sm

    /// Medium input fields (44×44 points) with `.textBaseRegular` typography.
    case md

    /// Large input fields (48×48 points) with `.textLGRegular` typography.
    case lg

    var textFieldSize: CGFloat {
        switch self {
        case .sm: 40
        case .md: 44
        case .lg: 48
        }
    }

    var textStyle: SHDTextStyle {
        switch self {
        case .sm: .textSMRegular
        case .md: .textBaseRegular
        case .lg: .textLGRegular
        }
    }
}
