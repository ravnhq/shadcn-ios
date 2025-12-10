//
//  SHDInputOTPVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/9/25.
//

public enum SHDInputOTPVariant: Equatable, Hashable {
    case controlled
    case pattern
    case separator(groupOf: Int = 2)

    var dividedBy: Int {
        switch self {
        case .controlled: 0
        case .pattern: 0
        case .separator(let groupOf): groupOf
        }
    }
}
