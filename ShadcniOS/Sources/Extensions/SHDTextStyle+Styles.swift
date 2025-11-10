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
            letterSpacing: -1.2,
            underline: false
        )
    }

    static var h2: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title,
            font: .variable,
            weight: .semiBold,
            size: 30,
            lineHeight: 36,
            letterSpacing: -0.75,
            underline: false
        )
    }

    static var h3: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title2,
            font: .variable,
            weight: .semiBold,
            size: 24,
            lineHeight: 32,
            letterSpacing: -0.6,
            underline: false
        )
    }

    static var h4: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title3,
            font: .variable,
            weight: .semiBold,
            size: 20,
            lineHeight: 28,
            letterSpacing: -0.5,
            underline: false
        )
    }
}

internal extension SHDTextStyle {

    enum textXS {
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .caption,
                font: .variable,
                weight: .regular,
                size: 12,
                lineHeight: 16,
                letterSpacing: 0,
                underline: false
            )
        }

        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .caption,
                font: .variable,
                weight: .medium,
                size: 12,
                lineHeight: 16,
                letterSpacing: 0,
                underline: false
            )
        }

        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .caption,
                font: .variable,
                weight: .semiBold,
                size: 12,
                lineHeight: 16,
                letterSpacing: 0,
                underline: false
            )
        }

        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .caption,
                font: .variable,
                weight: .medium,
                size: 12,
                lineHeight: 16,
                letterSpacing: 0,
                underline: true
            )
        }
    }
}
