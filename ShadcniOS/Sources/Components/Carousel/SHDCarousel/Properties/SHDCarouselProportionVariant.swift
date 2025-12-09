//
//  SHDCarouselProportionVariant.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/8/25.
//

import Foundation

/// Defines the aspect ratio and dimensions of carousel items.
///
/// ## Discussion
///
/// `SHDCarouselProportionVariant` controls the visual dimensions and aspect ratios of items displayed
/// in a carousel. Each variant provides preset width and height values optimized for different content types
/// and use cases.
///
/// The four proportion variants balance content visibility with design flexibility:
/// - `One to One` (1:1) creates square items ideal for avatars, icons, or uniform grid layouts.
/// - `Three to Four` (3:4) provides a portrait-oriented rectangle suitable for profile cards or product thumbnails.
/// - `Sixteen to Nine` (16:9) offers a landscape rectangle commonly used for video content, movie posters, or landscape imagery.
/// - `Three to Four with Single Item` (3:4) is a tall variant optimized specifically for single-item carousel layouts
///   and paged browsing experiences, providing maximum vertical space for prominent content display.
///
/// Proportion dimensions:
/// - `.oneToOne`: 212 × 212 points (square)
/// - `.threeToFour`: 159 × 212 points (portrait)
/// - `.sixteenToNine`: 377 × 212 points (landscape)
/// - `.threeToFourWithSingleItem`: 380 × 507 points (tall portrait)
///
/// ## Usage
///
/// ```swift
/// SHDCarousel(items: products) { product in
///     ProductThumbnail(product: product)
/// }
/// .carouselProportionVariant(.threeToFour)
/// 
/// SHDCarousel(items: videos) { video in
///     VideoPreview(video: video)
/// }
/// .carouselProportionVariant(.sixteenToNine)
/// ```
///
public enum SHDCarouselProportionVariant {
    /// Square aspect ratio (1:1) — 212 × 212 points.
    ///
    /// Ideal for displaying avatars, icons, or uniform square content in grid-like arrangements.
    /// Provides equal visual weight for all items regardless of orientation.
    case oneToOne
    
    /// Portrait aspect ratio (3:4) — 159 × 212 points.
    ///
    /// Suitable for profile cards, product thumbnails, or portrait-oriented images.
    /// Provides a balanced portrait presentation in compact spaces.
    case threeToFour
    
    /// Landscape aspect ratio (16:9) — 377 × 212 points.
    ///
    /// Optimized for video content, movie posters, or landscape imagery.
    /// When used with `.groupHorizonal` layout, automatically switches to paged tab-based viewing
    /// for optimal full-width presentation.
    case sixteenToNine
    
    /// Tall portrait aspect ratio (3:4) optimized for single-item layouts — 380 × 507 points.
    ///
    /// Designed specifically for carousels using single-item paging navigation, providing maximum
    /// vertical space for prominent content display. Commonly used in photo galleries and featured content showcases.
    case threeToFourWithSingleItem

    var width: CGFloat {
        switch self {
        case .oneToOne: 212
        case .threeToFour: 159
        case .sixteenToNine: 377
        case .threeToFourWithSingleItem: 380
        }
    }

    var height: CGFloat {
        switch self {
        case .oneToOne: 212
        case .threeToFour: 212
        case .sixteenToNine: 212
        case .threeToFourWithSingleItem: 507
        }
    }
}
