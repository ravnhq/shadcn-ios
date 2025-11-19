//
//  StateCloseButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

enum StateCloseButton {

    case `false`
    case `true`

    var foregroundColor: SHDColor {
        switch self {
        case .false: return .iconMuted
        case .true: return .iconDestructiveOnDestructive
        }
    }
}
