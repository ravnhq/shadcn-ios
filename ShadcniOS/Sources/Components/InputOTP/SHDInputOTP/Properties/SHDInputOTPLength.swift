//
//  SHDInputOTPLength.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/10/25.
//

enum SHDInputOTPLength {
    case otp4
    case otp6
    case otp8
    
    var digits: Int {
        switch self {
        case .otp4: 4
        case .otp6: 6
        case .otp8: 8
        }
    }
}
