//
//  SwiftUIView.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/24/25.
//

import SwiftUI

/// Screen edge positions for toast notification presentation.
///
/// `SHDSonnerPosition` determines where notifications appear on the screen,
/// affecting both the animation direction and the visual hierarchy of your interface.
///
/// ## Discussion
///
/// Notifications can be presented from either the top or bottom of the screen,
/// with entrance and exit animations matching the chosen position. The position
/// also affects the dismissal gesture direction.
///
/// ## Usage
///
/// ### Top
///
/// Notifications slide in from the top edge and require an upward drag to dismiss.
///
/// ```swift
/// SHDSonnerConfiguration(
///     title: "New message",
///     subtitle: "You have 3 unread messages",
///     position: .top
/// )
/// ```
///
/// ### Bottom (Default)
///
/// Notifications slide in from the bottom edge and require a downward drag to dismiss.
///
/// ```swift
/// SHDSonnerConfiguration(
///     title: "Changes saved",
///     subtitle: "All settings have been updated",
///     position: .bottom  // Default
/// )
/// ```
public enum SHDSonnerPosition {
    case top
    case bottom
}
