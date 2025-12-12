//
//  SHDSliderSize.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/12/25.
//

import Foundation

/// Size variants for `SHDSlider` controlling track height and thumb diameter.
///
/// ## Discussion
/// `SHDSliderSize` defines three standard size variants for sliders in the ShadcniOS
/// design system. Each variant specifies both the track height and thumb size to
/// maintain proper visual proportions and touch targets.
///
/// The size variants follow these specifications:
///
/// - **Small (`.sm`)**: 8pt track, 20pt thumb
/// - **Medium (`.md`)**: 10pt track, 24pt thumb
/// - **Large (`.lg`)**: 12pt track, 28pt thumb
/// 
/// ## Usage
///
/// Apply size variants using the `.sliderVariant(variant:)` modifier:
///
/// ```swift
/// SHDSlider(minValue: 0, maxValue: 100, value: $value)
///     .sliderVariant(variant: .sm)
/// ```
public enum SHDSliderSize {

    case sm

    case md

    case lg

    var sliderSize: CGFloat {
        switch self {
        case .sm: 8
        case .md: 10
        case .lg: 12
        }
    }

    var thumbSize: CGFloat {
        switch self {
        case .sm: 20
        case .md: 24
        case .lg: 28
        }
    }
}
