//
//  SHDSonner.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

/// A notification toast component used to display brief messages and alerts.
///
/// ## Discussion
/// `SHDSonner` provides a toast-style notification view that supports:
/// - Title and subtitle text
/// - Contextual variants (default, success, warning, destructive)
/// - Multiple size configurations
/// - Icon indicators based on variant
///
/// Visual styling (colors, borders, typography, icons) is handled through
/// the design system's variant and size types:
///
/// - `.sonnerVariant(variant:size:)`
/// - `SHDSonnerVariant` for semantic colors and icons
/// - `SHDSonnerSize` for typography scales
///
/// This component follows the ShadcniOS design system pattern of separating
/// content composition from styling, ensuring predictable and centralized
/// visual presentation.
/// The component is typically presented using the `.showSonner()` view modifier
/// which handles animation, positioning, and dismissal behavior.
///
/// Creates a ShadcniOS toast notification.
///
/// - Parameters:
///   - title: The primary message text displayed prominently.
///   - subtitle: The secondary descriptive text displayed below the title.
///
///
/// ## Usage
///
/// ```swift
/// ContentView()
///     .showSonner(
///         title: "Event has been created",
///         caption: "Sunday, December 03, 2023 at 9:00 AM",
///         variant: .success,
///         size: .md,
///         isPresented: $showNotification
///     )
/// ```
public struct SHDSonner: View {
    let title: String
    let subtitle: String
    var size: SHDSonnerSize = .md
    var variant: SHDSonnerVariant = .default

    public init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        HStack(alignment: .top, spacing: .sm) {
            SHDIcon(variant.icon)
                .iconSize(size.iconSize)
                .foregroundColor(variant.foregroundColor)
                .padding(.top, .xxxxs)

            VStack(alignment: .leading, spacing: .sm) {
                Text(title)
                    .foregroundStyle(.foregroundDefault)
                    .textStyle(size.textStyle)

                Text(subtitle)
                    .foregroundStyle(.foregroundMuted)
                    .textStyle(size.captionStyle)
            }

            Spacer()
        }
        .padding(.all, .sm)
        .backgroundColor(.backgroundDefault)
        .cornerRadius(.md)
        .overlay(
            RoundedRectangle(cornerRadius: .md)
                .stroke(SHDColor.borderDefault.color, lineWidth: 1)
        )
        .shadowStyle(.xs)
    }

    public func sonnerVariant(variant: SHDSonnerVariant, size: SHDSonnerSize) -> Self {
        mutating { sonner in
            sonner.variant = variant
            sonner.size = size
        }
    }
}

#Preview {
    SHDSonnerPreview()
}
