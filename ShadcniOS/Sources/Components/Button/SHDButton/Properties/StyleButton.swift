//
//  StyleButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/17/25.
//

import Foundation

public enum StyleButton {
    case buttonDefault
    case buttonLoading
    case buttonDisable

    var opacity: CGFloat {
        switch self {
        case .buttonDefault: return 1
        case .buttonLoading: return 0.5
        case .buttonDisable: return 0.5
        }
    }
}
