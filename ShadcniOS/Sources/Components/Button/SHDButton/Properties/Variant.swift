//
//  Variant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import Foundation

public enum Variant {
    case defaultButton
    case secondaryButton

    var backgroundColor: SHDColor {
        switch self {
        case .defaultButton: return .backgroundPrimaryDefault
        case .secondaryButton: return .backgroundPrimaryLight
        }
    }

    var foregroundColor: SHDColor {
        switch self {
        case .defaultButton: return .foregroundPrimaryDefault
        case .secondaryButton: return .foregroundAccent
        }
    }
}
