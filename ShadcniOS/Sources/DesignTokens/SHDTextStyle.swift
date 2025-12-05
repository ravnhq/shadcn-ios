//
//  SHDTextStyle.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/7/25.
//

import SwiftUI

/// Defines a text style configuration used internally in ShadcniOS.
///
/// ## Discussion
/// `SHDTextStyle` encapsulates typography settings including font, size, line height,
/// letter spacing, and underline properties. These styles are used throughout the
/// design system to maintain consistent typography.
internal struct SHDTextStyle {
    /// The relative system text style (e.g. `.body`, `.headline`).
    let relativeFont: Font.TextStyle
    /// The font weight.
    let font: InterFont
    /// The base font size in points.
    let size: CGFloat
    /// The line height for the text.
    let lineHeight: CGFloat
    /// The letter spacing (kerning).
    let letterSpacing: CGFloat
    /// Whether the text is underlined.
    let underline: Bool
}

internal extension SHDTextStyle {
    // MARK: - Header Styles
    /// Heading 1 style — used for main titles and large headers.
    static var h1: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .largeTitle,
            font: .regularExtraBold,
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
            font: .regularSemiBold,
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
            font: .regularSemiBold,
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
            font: .regularSemiBold,
            size: 20,
            lineHeight: 28,
            letterSpacing: -0.5,
            underline: false
        )
    }

    // MARK: - Extra Small Texts
    /// Extra small text — regular weight, used for small labels or metadata.
    static var textXSRegular: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .caption,
            font: .regular,
            size: 12,
            lineHeight: 16,
            letterSpacing: 0,
            underline: false
        )
    }

    /// Extra small text — medium weight, used for slightly emphasized labels.
    static var textXSMedium: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .caption,
            font: .regularMedium,
            size: 12,
            lineHeight: 16,
            letterSpacing: 0,
            underline: false
        )
    }

    /// Extra small text — semibold weight, used for emphasis in compact text.
    static var textXSSemibold: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .caption,
            font: .regularSemiBold,
            size: 12,
            lineHeight: 16,
            letterSpacing: 0,
            underline: false
        )
    }

    /// Extra small text — medium weight with underline, used for links or highlights.
    static var textXSUnderline: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .caption,
            font: .regularMedium,
            size: 12,
            lineHeight: 16,
            letterSpacing: 0,
            underline: true
        )
    }

    // MARK: - Small Texts
    /// Small text — regular weight, for secondary information or notes.
    static var textSMRegular: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .footnote,
            font: .regular,
            size: 14,
            lineHeight: 20,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Small text — medium weight, for slightly emphasized small labels.
    static var textSMMedium: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .footnote,
            font: .regularMedium,
            size: 14,
            lineHeight: 20,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Small text — semibold weight, for compact emphasized text.
    static var textSMSemibold: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .footnote,
            font: .regularSemiBold,
            size: 14,
            lineHeight: 20,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Small text — medium weight with underline, for links or actions.
    static var textSMUnderline: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .footnote,
            font: .regularMedium,
            size: 14,
            lineHeight: 20,
            letterSpacing: 0,
            underline: true
        )
    }

    // MARK: - Base Texts
    /// Base text — regular weight, for standard paragraph content.
    static var textBaseRegular: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .subheadline,
            font: .regular,
            size: 16,
            lineHeight: 24,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Base text — medium weight, for slightly stronger body emphasis.
    static var textBaseMedium: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .subheadline,
            font: .regularMedium,
            size: 16,
            lineHeight: 24,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Base text — semibold weight, for highlighted body or labels.
    static var textBaseSemibold: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .subheadline,
            font: .regularSemiBold,
            size: 16,
            lineHeight: 24,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Base text — regular weight with underline, for links or key phrases.
    static var textBaseUnderline: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .subheadline,
            font: .regularMedium,
            size: 16,
            lineHeight: 24,
            letterSpacing: 0,
            underline: true
        )
    }

    // MARK: - Large Texts
    /// Large text — regular weight, ideal for readable paragraph content.
    static var textLGRegular: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .body,
            font: .regular,
            size: 18,
            lineHeight: 28,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Large text — medium weight, for slightly emphasized large text.
    static var textLGMedium: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .body,
            font: .regularMedium,
            size: 18,
            lineHeight: 28,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Large text — semibold weight, used for highlighted or leading text.
    static var textLGSemibold: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .body,
            font: .regularSemiBold,
            size: 18,
            lineHeight: 28,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Large text — medium weight with underline, for links or emphasis.
    static var textLGUnderline: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .body,
            font: .regularMedium,
            size: 18,
            lineHeight: 28,
            letterSpacing: 0,
            underline: true
        )
    }

    // MARK: - Extra Large Texts
    /// Extra large text — regular weight, for larger readable elements.
    static var textXLRegular: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title3,
            font: .regular,
            size: 20,
            lineHeight: 28,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Extra large text — medium weight, for stronger display emphasis.
    static var textXLMedium: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title3,
            font: .regularMedium,
            size: 20,
            lineHeight: 28,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Extra large text — semibold weight, for standout headings or labels.
    static var textXLSemibold: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title3,
            font: .regularSemiBold,
            size: 20,
            lineHeight: 28,
            letterSpacing: 0,
            underline: false
        )
    }
    /// Extra large text — medium weight with underline, for links or highlights.
    static var textXLUnderline: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title3,
            font: .regularMedium,
            size: 20,
            lineHeight: 28,
            letterSpacing: 0,
            underline: true
        )
    }

    // MARK: - 2 Extra Large Texts
    /// 2XL text — regular weight, standard display heading.
    static var text2XLRegular: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title2,
            font: .regular,
            size: 24,
            lineHeight: 32,
            letterSpacing: 0,
            underline: false
        )
    }
    /// 2XL text — medium weight for slightly stronger emphasis.
    static var text2XLMedium: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title2,
            font: .regularMedium,
            size: 24,
            lineHeight: 32,
            letterSpacing: 0,
            underline: false
        )
    }
    /// 2XL text — semibold weight, for highlighted or leading headings.
    static var text2XLSemibold: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title2,
            font: .regularSemiBold,
            size: 24,
            lineHeight: 32,
            letterSpacing: 0,
            underline: false
        )
    }
    /// 2XL text — medium weight with underline, for links or emphasis.
    static var text2XLUnderline: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title2,
            font: .regularMedium,
            size: 24,
            lineHeight: 32,
            letterSpacing: 0,
            underline: true
        )
    }

    // MARK: - 3 Extra Large Texts
    /// 3XL text — regular weight, for big headings.
    static var text3XLRegular: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title,
            font: .regular,
            size: 30,
            lineHeight: 36,
            letterSpacing: 0,
            underline: false
        )
    }
    /// 3XL text — medium weight, slightly more emphasis.
    static var text3XLMedium: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title,
            font: .regularMedium,
            size: 30,
            lineHeight: 36,
            letterSpacing: 0,
            underline: false
        )
    }
    /// 3XL text — semibold weight, for standout headings.
    static var text3XLSemibold: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title,
            font: .regularSemiBold,
            size: 30,
            lineHeight: 36,
            letterSpacing: 0,
            underline: false
        )
    }
    /// 3XL text — medium weight with underline, for links or highlighted headings.
    static var text3XLUnderline: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .title,
            font: .regularMedium,
            size: 30,
            lineHeight: 36,
            letterSpacing: 0,
            underline: true
        )
    }

    // MARK: 4 Extra Large Texts
    /// 4XL text — regular weight, for very large headings.
    static var text4XLRegular: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .largeTitle,
            font: .regular,
            size: 36,
            lineHeight: 40,
            letterSpacing: 0,
            underline: false
        )
    }
    /// 4XL text — medium weight, slightly stronger emphasis.
    static var text4XLMedium: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .largeTitle,
            font: .regularMedium,
            size: 36,
            lineHeight: 40,
            letterSpacing: 0,
            underline: false
        )
    }
    /// 4XL text — semibold weight, for standout hero headings.
    static var text4XLSemibold: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .largeTitle,
            font: .regularSemiBold,
            size: 36,
            lineHeight: 40,
            letterSpacing: 0,
            underline: false
        )
    }
    /// 4XL text — medium weight with underline, for links or prominent emphasis.
    static var text4XLUnderline: SHDTextStyle {
        SHDTextStyle(
            relativeFont: .largeTitle,
            font: .regularMedium,
            size: 36,
            lineHeight: 40,
            letterSpacing: 0,
            underline: true
        )
    }
}
