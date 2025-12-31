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
///``` swift
/// SHDSonnerConfiguration(
///     title: "Draft saved",
///     subtitle: "Last saved at 3:24 PM",
///     position: .top
/// )
///```
public enum SHDSonnerPosition {
    case top
    case bottom

    var alignment: Alignment {
        switch self {
        case .top: .top
        case .bottom: .bottom
        }
    }

    var edge: Edge {
        switch self {
        case .top: .top
        case .bottom: .bottom
        }
    }

    private var dragDirection: CGFloat {
        self == .top ? -1 : 1
    }

    func allowsDrag(_ translation: CGFloat) -> Bool {
        translation * dragDirection >= 0
    }

    func shouldDismiss(_ translation: CGFloat, threshold: CGFloat) -> Bool {
        translation * dragDirection >= threshold
    }
}
