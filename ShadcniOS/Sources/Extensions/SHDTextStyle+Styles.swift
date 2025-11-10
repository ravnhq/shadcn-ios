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

    static var h2: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title,
            font: .variable,
            weight: .semiBold,
            size: 30,
            lineHeight: 36,
            letterSpacing: -0.75
        )
    }

    static var h3: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title2,
            font: .variable,
            weight: .semiBold,
            size: 24,
            lineHeight: 32,
            letterSpacing: -0.6
        )
    }

    static var h4: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title3,
            font: .variable,
            weight: .semiBold,
            size: 20,
            lineHeight: 28,
            letterSpacing: -0.5
        )
    }
}
