//
//  ShadcnPaddingSizing.swift
//  shadcn-ios
//
//  Created by JoseAlvarez on 10/31/25.
//

import Foundation

public enum ShadcnPaddingSizing: Double, CaseIterable {
    /// Padding Sizing
    case paddingNone = 0
    case paddingXXS = 8
    case paddingXS = 12
    case paddingSM = 16
    case paddingMD = 20
    case paddingLG = 24
    case paddingXL = 32
    case paddingXXL = 40
    case padding3XL = 48
    case padding4XL = 64

    public var size: CGFloat {
        CGFloat(self.rawValue)
    }
}
