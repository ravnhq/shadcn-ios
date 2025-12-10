//
//  SHDInputOTPSizing.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import Foundation

public enum SHDInputOTPSizing {
    case sm
    case md
    case lg

    var size: CGFloat {
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
