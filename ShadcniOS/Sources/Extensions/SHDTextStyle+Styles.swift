//
//  SHDTextStyle+Styles.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

/// Predefined text styles for common heading levels used across the app.
// MARK: - Header Styles
internal extension SHDTextStyle {
    
    /// Heading 1 style — used for main titles and large headers.
    static var h1: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .largeTitle,
            font: .fontName,
            weight: .extraBold,
            size: 48,
            lineHeight: 48,
            letterSpacing: -1.2,
            underline: false
        )
    }

    /// Heading 2 style — used for section titles or secondary headers.
    static var h2: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title,
            font: .fontName,
            weight: .semibold,
            size: 30,
            lineHeight: 36,
            letterSpacing: -0.75,
            underline: false
        )
    }

    /// Heading 3 style — typically used for smaller headers or subsections.
    static var h3: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title2,
            font: .fontName,
            weight: .semibold,
            size: 24,
            lineHeight: 32,
            letterSpacing: -0.6,
            underline: false
        )
    }

    /// Heading 4 style — used for captions, labels, or compact titles.
    static var h4: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title3,
            font: .fontName,
            weight: .semibold,
            size: 20,
            lineHeight: 28,
            letterSpacing: -0.5,
            underline: false
        )
    }
}

// MARK: - Text Styles
/// Extra small text styles used for captions, notes, or small UI elements.
internal extension SHDTextStyle {

    // MARK: - Extra Small Texts
    enum textXS {
        /// Extra small text — regular weight, used for small labels or metadata.
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .caption,
                font: .fontName,
                weight: .regular,
                size: 12,
                lineHeight: 16,
                letterSpacing: 0,
                underline: false
            )
        }

        /// Extra small text — medium weight, used for slightly emphasized labels.
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .caption,
                font: .fontName,
                weight: .medium,
                size: 12,
                lineHeight: 16,
                letterSpacing: 0,
                underline: false
            )
        }

        /// Extra small text — semibold weight, used for emphasis in compact text.
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .caption,
                font: .fontName,
                weight: .semibold,
                size: 12,
                lineHeight: 16,
                letterSpacing: 0,
                underline: false
            )
        }

        /// Extra small text — medium weight with underline, used for links or highlights.
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .caption,
                font: .fontName,
                weight: .medium,
                size: 12,
                lineHeight: 16,
                letterSpacing: 0,
                underline: true
            )
        }
    }

    // MARK: - Small Texts
    /// Small text styles — used for captions or compact UI text.
    enum textSM {
        /// Small text — regular weight, for secondary information or notes.
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .footnote,
                font: .fontName,
                weight: .regular,
                size: 14,
                lineHeight: 20,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Small text — medium weight, for slightly emphasized small labels.
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .footnote,
                font: .fontName,
                weight: .medium,
                size: 14,
                lineHeight: 20,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Small text — semibold weight, for compact emphasized text.
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .footnote,
                font: .fontName,
                weight: .semibold,
                size: 14,
                lineHeight: 20,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Small text — medium weight with underline, for links or actions.
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .footnote,
                font: .fontName,
                weight: .medium,
                size: 14,
                lineHeight: 20,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    // MARK: - Base Texts
    /// Base text styles — used for body copy or general text content.
    enum textBase {
        /// Base text — regular weight, for standard paragraph content.
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .subheadline,
                font: .fontName,
                weight: .regular,
                size: 16,
                lineHeight: 24,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Base text — medium weight, for slightly stronger body emphasis.
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .subheadline,
                font: .fontName,
                weight: .medium,
                size: 16,
                lineHeight: 24,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Base text — semibold weight, for highlighted body or labels.
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .subheadline,
                font: .fontName,
                weight: .semibold,
                size: 16,
                lineHeight: 24,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Base text — regular weight with underline, for links or key phrases.
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .subheadline,
                font: .fontName,
                weight: .regular,
                size: 16,
                lineHeight: 24,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    // MARK: - Large Texts
    /// Large text styles — used for prominent body text or subheadings.
    enum textLG {
        /// Large text — regular weight, ideal for readable paragraph content.
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .body,
                font: .fontName,
                weight: .regular,
                size: 18,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Large text — medium weight, for slightly emphasized large text.
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .body,
                font: .fontName,
                weight: .medium,
                size: 18,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Large text — semibold weight, used for highlighted or leading text.
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .body,
                font: .fontName,
                weight: .semibold,
                size: 18,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Large text — medium weight with underline, for links or emphasis.
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .body,
                font: .fontName,
                weight: .medium,
                size: 18,
                lineHeight: 28,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    // MARK: - Extra Large Texts
    /// Extra large text styles — used for headers, highlights, or key UI text.
    enum textXL {
        /// Extra large text — regular weight, for larger readable elements.
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title3,
                font: .fontName,
                weight: .regular,
                size: 20,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Extra large text — medium weight, for stronger display emphasis.
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title3,
                font: .fontName,
                weight: .medium,
                size: 20,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// Extra large text — semibold weight, for standout headings or labels.
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title3,
                font: .fontName,
                weight: .semibold,
                size: 20,
                lineHeight: 28,
                letterSpacing: 0,
                underline: false
            )
        }
        /// Extra large text — medium weight with underline, for links or highlights.
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title3,
                font: .fontName,
                weight: .medium,
                size: 20,
                lineHeight: 28,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    // MARK: - 2 Extra Large Texts
    /// 2XL text styles — used for large headings or key UI elements.
    enum text2XL {
        /// 2XL text — regular weight, standard display heading.
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title2,
                font: .fontName,
                weight: .regular,
                size: 24,
                lineHeight: 32,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// 2XL text — medium weight for slightly stronger emphasis.
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title2,
                font: .fontName,
                weight: .medium,
                size: 24,
                lineHeight: 32,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// 2XL text — semibold weight, for highlighted or leading headings.
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title2,
                font: .fontName,
                weight: .semibold,
                size: 24,
                lineHeight: 32,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// 2XL text — medium weight with underline, for links or emphasis.
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title2,
                font: .fontName,
                weight: .medium,
                size: 24,
                lineHeight: 32,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    // MARK: - 3 Extra Large Texts
    /// 3XL text styles — very large headers or key display text.
    enum text3XL {
        /// 3XL text — regular weight, for big headings.
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title,
                font: .fontName,
                weight: .regular,
                size: 30,
                lineHeight: 36,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// 3XL text — medium weight, slightly more emphasis.
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title,
                font: .fontName,
                weight: .medium,
                size: 30,
                lineHeight: 36,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// 3XL text — semibold weight, for standout headings.
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title,
                font: .fontName,
                weight: .semibold,
                size: 30,
                lineHeight: 36,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// 3XL text — medium weight with underline, for links or highlighted headings.
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .title,
                font: .fontName,
                weight: .medium,
                size: 30,
                lineHeight: 36,
                letterSpacing: 0,
                underline: true
            )
        }
    }
    
    // MARK: 4 Extra Large Texts
    /// 4XL text styles — hero headers or extremely prominent display text.
    enum text4XL {
        /// 4XL text — regular weight, for very large headings.
        static var regular: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .largeTitle,
                font: .fontName,
                weight: .regular,
                size: 36,
                lineHeight: 40,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// 4XL text — medium weight, slightly stronger emphasis.
        static var medium: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .largeTitle,
                font: .fontName,
                weight: .medium,
                size: 36,
                lineHeight: 40,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// 4XL text — semibold weight, for standout hero headings.
        static var semibold: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .largeTitle,
                font: .fontName,
                weight: .semibold,
                size: 36,
                lineHeight: 40,
                letterSpacing: 0,
                underline: false
            )
        }
        
        /// 4XL text — medium weight with underline, for links or prominent emphasis.
        static var underline: SHDTextStyle {
            SHDTextStyle(
                relativeFont: .largeTitle,
                font: .fontName,
                weight: .medium,
                size: 36,
                lineHeight: 40,
                letterSpacing: 0,
                underline: true
            )
        }
    }
}
