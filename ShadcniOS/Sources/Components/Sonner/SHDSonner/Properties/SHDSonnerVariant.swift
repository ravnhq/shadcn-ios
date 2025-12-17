//
//  SHDSonnerVariant.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/16/25.
//

import SwiftUI

public enum SHDSonnerVariant {
    case `default`
    case success
    case warning
    case destructive
    
    var icon: SHDIconAsset {
        switch self {
        case .default:
            return .codingDevelopmentTerminal
        case .success:
            return .notificationCircleCheckBig
        case .warning:
            return .triangleAlert
        case .destructive:
            return .notificationCircleAlert
        }
    }
    
    var foregroundColor: SHDColor {
        switch self {
        case .default:
            return .foregroundDefault
        case .success:
            return .iconSuccessDefault
        case .warning:
            return .iconWarningDefault
        case .destructive:
            return .iconDestructiveDefault
        }
    }
}
