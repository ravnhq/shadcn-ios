//
//  SHDCloseButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

/// A standardized close button used throughout the Shadcn iOS design system.
///
/// `SHDCloseButton` displays a dismiss “X” icon and triggers the environment's
/// `dismiss` action when tapped.
///
/// ### Discussion
/// This component is intentionally minimal and applies no additional layout,
/// padding, or background. Its primary goal is consistency and ergonomics for
/// dismissal interactions across the UI.
///
/// The appearance of the button can be adjusted using the
/// ``closeButtonError(_:)`` modifier to reflect an error or destructive state.
///
/// ### Usage
/// Basic usage:
/// ```swift
/// SHDCloseButton()
/// ```
///
/// With error styling:
/// ```swift
/// SHDCloseButton()
///     .closeButtonError(.true)
/// ```
///
/// ### Notes
/// - The icon uses `SHDIcon(.mathsX)` with a default `.lg` size.
/// - The button automatically dismisses the current SwiftUI view using
///   `@Environment(\.dismiss)`.
///
public struct SHDCloseButton: View {

    @Environment(\.dismiss) var dismiss

    // swiftlint:disable:next orphaned_doc_comment
    /// Creates a new standardized close button.
    ///
    /// The button uses the default “X” icon and automatically calls the SwiftUI
    /// `dismiss` environment action when tapped.
    // swiftlint:disable:next opening_brace
    public init(){}

    public var body: some View {
        // swiftlint:disable:next multiple_closures_with_trailing_closure
        Button(action: { dismiss() }) {
            SHDIcon(.mathsX)
                .iconSize(.lg)
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        SHDCloseButton()
            .closeButtonError(.false)

        SHDCloseButton()
            .closeButtonError(.true)
    }
    .padding()
}
