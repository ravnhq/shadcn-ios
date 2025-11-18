//
//  Variant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import Foundation

public enum VariantButton {
    case `default`
    case secondary
    case destructive
    case outline
    case ghost
    case link

    var backgroundColor: SHDColor {
        switch self {
        case .default: return .backgroundPrimaryDefault
        case .secondary: return .backgroundPrimaryLight
        case .destructive: return .backgroundDestructiveDefault
        default : return .clear
        }
    }

    var foregroundColor: SHDColor {
        switch self {
        case .default: return .foregroundPrimaryDefault
        case .secondary: return .foregroundAccent
        case .destructive: return .foregroundPrimaryDefault
        case .outline: return .foregroundDefault
        case .ghost: return .foregroundDefault
        case .link: return .foregroundDefault
        default : return .clear
        }
    }
    
    var borderColor: SHDColor {
        switch self {
        case .outline: return .borderPrimaryDefault
        default : return .clear
        }
    }
}
