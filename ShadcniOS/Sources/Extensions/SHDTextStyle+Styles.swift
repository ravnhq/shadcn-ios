//
//  SHDTextStyle+Styles.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

internal extension SHDTextStyle {
    static var h1: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .largeTitle,
            font: .variable,
            weight: .extraBold,
            size: 48,
            lineHeight: 48,
            letterSpacing: -1.2
        )
    }
}
