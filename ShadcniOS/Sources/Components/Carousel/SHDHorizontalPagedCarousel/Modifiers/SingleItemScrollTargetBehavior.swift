//
//  SingleItemScrollTargetBehavior.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 12/31/25.
//

import SwiftUI

/// A custom scroll target behavior for single-item paged carousel navigation.
///
/// ## Discussion
///
/// `SingleItemScrollTargetBehavior` implements `ScrollTargetBehavior` to provide precise
/// page-based scrolling for horizontal paged carousels. This behavior ensures that when users
/// scroll through a carousel, items snap to specific positions, creating a one-item-per-page
/// browsing experience.
///
/// The behavior calculates scroll targets based on:
/// - `interval`: The spacing between items (item width + spacing)
/// - `currentPage`: The currently active page index
/// - `offsetAdjustment`: Side inset adjustment for centering items
///
/// The implementation limits scroll delta to a maximum of ±1 page per gesture, ensuring smooth
/// and predictable navigation that prevents users from skipping multiple pages unintentionally.
///
/// This behavior is used internally by `SHDHorizontalPagedCarousel` to provide the paging
/// functionality and should not be directly instantiated by consumers.
///
internal struct SingleItemScrollTargetBehavior: ScrollTargetBehavior {
    /// The spacing interval between carousel items (item width + spacing).
    var interval: CGFloat

    /// The index of the currently active page.
    var currentPage: Int

    /// The horizontal offset adjustment for centering items within the container.
    var offsetAdjustment: CGFloat

    /// Updates the scroll target to snap to the nearest page position.
    ///
    /// This method calculates the target scroll position based on the proposed scroll position,
    /// current page, and interval spacing. It limits the scroll delta to ±1 page to ensure
    /// smooth, predictable navigation.
    ///
    /// - Parameters:
    ///   - target: The scroll target to update, modified in place
    ///   - context: The target context providing scroll information
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        let proposedIndex =
            ((target.rect.origin.x + offsetAdjustment) / interval).rounded()

        let currentIndex = CGFloat(currentPage)
        let diff = proposedIndex - currentIndex

        let delta = max(-1, min(1, diff))
        let nextIndex = currentIndex + delta

        target.rect.origin.x = (nextIndex * interval) - offsetAdjustment
    }
}

extension View {
    /// Applies single-item scroll target behavior to enable page-based carousel navigation.
    ///
    /// This modifier configures a scroll view to use `SingleItemScrollTargetBehavior` for
    /// precise page snapping in horizontal paged carousels. It ensures items snap to specific
    /// positions during scrolling, creating a one-item-per-page browsing experience.
    ///
    /// The modifier is used internally by `SHDHorizontalPagedCarousel` and should not be
    /// called directly by consumers.
    ///
    /// - Parameters:
    ///   - interval: The spacing interval between items (item width + spacing)
    ///   - currentPage: The index of the currently active page
    ///   - offsetAdjustment: Horizontal offset adjustment for centering items (defaults to 0)
    /// - Returns: A view with single-item scroll target behavior applied
    internal func singleItemScrollTargetBehavior(
        interval: CGFloat, currentPage: Int, offsetAdjustment: CGFloat = 0
    ) -> some View {
        self.scrollTargetBehavior(
            SingleItemScrollTargetBehavior(
                interval: interval,
                currentPage: currentPage,
                offsetAdjustment: offsetAdjustment
            )
        )
    }
}
