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
            weight: .semibold,
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
            weight: .semibold,
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
            weight: .semibold,
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
                weight: .semibold,
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

    enum textSM {
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .footnote,
                font: .variable,
                weight: .regular,
                size: 14,
                lineHeight: 20,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .footnote,
                font: .variable,
                weight: .medium,
                size: 14,
                lineHeight: 20,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .footnote,
                font: .variable,
                weight: .semibold,
                size: 14,
                lineHeight: 20,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .footnote,
                font: .variable,
                weight: .medium,
                size: 14,
                lineHeight: 20,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    enum textBase {
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .subheadline,
                font: .variable,
                weight: .regular,
                size: 16,
                lineHeight: 24,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .subheadline,
                font: .variable,
                weight: .medium,
                size: 16,
                lineHeight: 24,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .subheadline,
                font: .variable,
                weight: .semibold,
                size: 16,
                lineHeight: 24,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .subheadline,
                font: .variable,
                weight: .regular,
                size: 16,
                lineHeight: 24,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    enum textLG {
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .body,
                font: .variable,
                weight: .regular,
                size: 18,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .body,
                font: .variable,
                weight: .medium,
                size: 18,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .body,
                font: .variable,
                weight: .semibold,
                size: 18,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .body,
                font: .variable,
                weight: .medium,
                size: 18,
                lineHeight: 28,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    enum textXL {
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title3,
                font: .variable,
                weight: .regular,
                size: 20,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title3,
                font: .variable,
                weight: .medium,
                size: 20,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title3,
                font: .variable,
                weight: .semibold,
                size: 20,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title3,
                font: .variable,
                weight: .medium,
                size: 20,
                lineHeight: 28,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    enum text2XL {
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title2,
                font: .variable,
                weight: .regular,
                size: 24,
                lineHeight: 32,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title2,
                font: .variable,
                weight: .medium,
                size: 24,
                lineHeight: 32,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title2,
                font: .variable,
                weight: .semibold,
                size: 24,
                lineHeight: 32,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title2,
                font: .variable,
                weight: .medium,
                size: 24,
                lineHeight: 32,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    enum text3XL {
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title,
                font: .variable,
                weight: .regular,
                size: 30,
                lineHeight: 36,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title,
                font: .variable,
                weight: .medium,
                size: 30,
                lineHeight: 36,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title,
                font: .variable,
                weight: .semibold,
                size: 30,
                lineHeight: 36,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title,
                font: .variable,
                weight: .medium,
                size: 30,
                lineHeight: 36,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    enum text4XL {
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .largeTitle,
                font: .variable,
                weight: .regular,
                size: 36,
                lineHeight: 40,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .largeTitle,
                font: .variable,
                weight: .medium,
                size: 36,
                lineHeight: 40,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .largeTitle,
                font: .variable,
                weight: .semibold,
                size: 36,
                lineHeight: 40,
                letterSpacing: 0,
                underline: false
            )
        }
        
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .largeTitle,
                font: .variable,
                weight: .medium,
                size: 36,
                lineHeight: 40,
                letterSpacing: 0,
                underline: true
            )
        }
    }
}
