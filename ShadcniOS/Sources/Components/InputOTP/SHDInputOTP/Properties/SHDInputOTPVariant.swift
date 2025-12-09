//
//  SHDInputOTPVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

enum SHDInputOTPVariant {
    case controlled
    case pattern
    case separator
    
    var dividedBy: Int {
        switch self {
        case .controlled: 0
        case .pattern: 0
        case .separator: 2
        }
    }
}
