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
/// ## Discussion
///
/// This configuration struct serves as the bridge between your content and the notification
/// presentation system. It combines all customization options into a single, immutable value
/// that can be easily passed to the `.sonner()` view modifier.
///
/// ## Usage
///
///
/// ```swift
/// @State private var isPresented: Bool = false
/// let config = SHDSonnerConfiguration(
///     title: "Welcome back",
///     subtitle: "You have 5 new notifications"
/// )
///
/// ContentView()
///     .sonner(configuration: config, isPresented: $isPresented)
/// ```
/// 
public struct SHDSonnerConfiguration {

    let title: String
    let description: String
    let size: SHDSonnerSize
    let position: SHDSonnerPosition
    let variant: SHDSonnerVariant

    public init(
        description: String,
        title: String,
        position: SHDSonnerPosition = .bottom,
        size: SHDSonnerSize = .md,
        variant: SHDSonnerVariant = .default,
    ) {
        self.description = description
        self.title = title
        self.position = position
        self.size = size
        self.variant = variant
    }
}
