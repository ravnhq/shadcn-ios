//
//  SHDCloseButton.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/19/25.
//

import SwiftUI

/// A standardized close (“X”) button used throughout the ShadcniOS design system.
///
/// ### Overview
/// `SHDCloseButton` provides a consistent way to dismiss views across the app.
/// It renders a single **X icon** and triggers the SwiftUI `dismiss`
/// environment action when tapped.
///
/// This component is intentionally minimal:
/// - no extra padding
/// - no background
/// - no shape or border
///
/// The appearance can be customized externally through modifiers such as:
/// - `.errorStyle(_:)` → applies error foreground coloring
///
/// This ensures the component remains flexible while maintaining consistent
/// structure and purpose.
///
/// ### Behavior
/// - Always displays `SHDIcon(.mathsX)` sized at `.lg`.
/// - Automatically calls `dismiss()` when tapped.
/// - Visual state (error / default) is handled **outside** via `.errorStyle`.
///
///
/// ### Usage Examples
///
/// Basic usage:
/// ```swift
/// SHDCloseButton()
/// ```
///
/// Error-colored close button:
/// ```swift
/// SHDCloseButton()
///     .errorStyle(true)
/// ```
///
/// Placing inside a toolbar or header:
/// ```swift
/// HStack {
///     SHDCloseButton()
///         .errorStyle(false)
///     Spacer()
/// }
/// ```
///
/// ### Notes
/// - This component is purpose-built for dismissal interactions.
/// - If you need a customizable action instead of dismissing, use `SHDButton`.
///
public struct SHDCloseButton: View {

    /// SwiftUI environment value for dismissing the current presentation.
    @Environment(\.dismiss) private var dismiss

    /// Creates a standardized close button using the default “X” icon.
    ///
    /// The button has no internal styling and will call
    /// `dismiss.callAsFunction()` when tapped.
    public init() {}

    public var body: some View {
        Button(action: dismiss.callAsFunction) {
            SHDIcon(.mathsX)
                .iconSize(.lg)
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        SHDCloseButton()
            .errorStyle(false)

        SHDCloseButton()
            .errorStyle(true)
    }
    .padding()
}
