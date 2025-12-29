//
//  SHDSonnerConfiguration.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/24/25.
//

import SwiftUI

/// Configuration for presenting sonner notifications with complete control over appearance and behavior.
///
/// `SHDSonnerConfiguration` encapsulates all the parameters needed to create and present
/// a sonner notification, providing a clean and type-safe API for customizing the notification's
/// appearance, position, and content.
///
/// ## Overview
///
/// This configuration struct serves as the bridge between your content and the notification
/// presentation system. It combines all customization options into a single, immutable value
/// that can be easily passed to the `.sonner()` view modifier.
///
/// ### Configuration Options
///
/// - **Content**: Title and subtitle text
/// - **Position**: Top or bottom screen edge (``SHDSonnerPosition``)
/// - **Size**: Typography and icon scale (``SHDSonnerSize``)
/// - **Variant**: Semantic style and coloring (``SHDSonnerVariant``)
///
/// ## Usage
///
/// ### Basic Configuration
///
/// ```swift
/// let config = SHDSonnerConfiguration(
///     title: "Welcome back",
///     subtitle: "You have 5 new notifications"
/// )
///
/// ContentView()
///     .sonner(configuration: config, isPresented: $showNotification)
/// ```
/// ### Top-Positioned Warning
///
/// ```swift
/// let warningConfig = SHDSonnerConfiguration(
///     title: "Connection lost",
///     subtitle: "Attempting to reconnect...",
///     position: .top,
///     size: .lg,
///     variant: .warning
/// )
/// ```
/// ## Topics
///
/// ### Creating a Configuration
///
/// - ``init(title:subtitle:position:size:variant:)``
///
/// ### Configuration Properties
///
/// - ``title``
/// - ``subtitle``
/// - ``position``
/// - ``size``
/// - ``variant``
///
/// ### Presenting Notifications
///
/// - ``SwiftUI/View/sonner(configuration:isPresented:)``
///
/// ## See Also
///
/// - ``SHDSonner``
/// - ``SHDSonnerPosition``
/// - ``SHDSonnerSize``
/// - ``SHDSonnerVariant``
public struct SHDSonnerConfiguration {

    let title: String
    let subtitle: String
    let size: SHDSonnerSize
    let position: SHDSonnerPosition
    let variant: SHDSonnerVariant

    public init(
        title: String,
        subtitle: String,
        position: SHDSonnerPosition = .bottom,
        size: SHDSonnerSize = .md,
        variant: SHDSonnerVariant = .default,
    ) {
        self.title = title
        self.subtitle = subtitle
        self.position = position
        self.size = size
        self.variant = variant
    }

    internal func makeSonner() -> SHDSonner {
        SHDSonner(
            description: subtitle,
            title: title
        )
        .sonnerConfiguration(variant: variant, size: size)
    }
}

public extension View {
    /// Presents a toast notification with automatic dismissal and interactive gestures.
    ///
    /// This modifier displays a sonner notification based on the provided configuration
    /// and binding. The notification automatically dismisses after a contextual delay
    /// and supports interactive dismissal through tap and drag gestures.
    ///
    /// - Parameters:
    ///   - configuration: The configuration specifying the notification's content and appearance.
    ///   - isPresented: A binding to a Boolean value that determines whether the notification is visible.
    ///
    /// - Returns: A view that presents the notification when the binding becomes `true`.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var showNotification = false
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Button("Save") {
    ///                 saveData()
    ///                 showNotification = true
    ///             }
    ///         }
    ///         .sonner(
    ///             configuration: SHDSonnerConfiguration(
    ///                 title: "Saved successfully",
    ///                 subtitle: "Your changes have been saved"
    ///             ),
    ///             isPresented: $showNotification
    ///         )
    ///     }
    /// }
    /// ```
    func sonner(
        configuration: SHDSonnerConfiguration,
        isPresented: Binding<Bool>
    ) -> some View {
        modifier(
            SHDSonnerModifier(
                position: configuration.position,
                sonner: configuration.makeSonner(),
                variant: configuration.variant,
                isPresented: isPresented
            )
        )
    }
}
