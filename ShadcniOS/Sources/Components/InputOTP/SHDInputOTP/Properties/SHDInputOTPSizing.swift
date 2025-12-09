//
//  SHDInputOTPSizing.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

import Foundation

enum SHDInputOTPSizing {
    case sm
    case md
    case lg

    var size: CGFloat {
        switch self {
        case .sm: return 40
        case .md: return 44
        case .lg: return 48
        }
    }
}
