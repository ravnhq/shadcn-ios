//
//  SHDSonner.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

/// A toast-style notification component for displaying temporary messages to users.
///
/// `SHDSonner` is a core component of the ShadcniOS design system that provides
/// elegant, non-intrusive notifications. It combines a title, subtitle, and contextual
/// icon to communicate information, confirmations, warnings, or errors to users.
///
/// ## Discussion
///
/// The sonner component is designed to provide brief, actionable feedback without
/// interrupting the user's workflow. It automatically dismisses after a contextual
/// delay and supports interactive dismissal through tap and drag gestures.
///
/// ## Usage
///
/// ```swift
/// struct ContentView: View {
///     @State private var showNotification = false
///
///     var body: some View {
///         VStack {
///             Button("Save Changes") {
///                 saveData()
///                 showNotification = true
///             }
///         }
///         .sonner(
///             configuration: SHDSonnerConfiguration(
///                 title: "Changes saved",
///                 subtitle: "Your settings have been updated successfully"
///             ),
///             isPresented: $showNotification
///         )
///     }
/// }
/// ```
///
/// ### Success Notification
///
/// ```swift
/// .sonner(
///     configuration: SHDSonnerConfiguration(
///         title: "Event created",
///         subtitle: "Sunday, December 03, 2023 at 9:00 AM",
///         variant: .success,
///         size: .md
///     ),
///     isPresented: $showSuccess
/// )
/// ```
internal struct SHDSonner: View {
    let title: String
    let subtitle: String
    var size: SHDSonnerSize = .md
    var variant: SHDSonnerVariant = .default

    init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }

    var body: some View {
        HStack(alignment: .top, spacing: .sm) {
            SHDIcon(variant.icon)
                .iconSize(size.iconSize)
                .foregroundColor(variant.foregroundColor)

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

    /// Applies a visual variant and size to the notification.
    ///
    /// This method configures the notification's appearance by setting both its
    /// semantic variant (which determines color and icon) and size (which controls
    /// typography and icon dimensions).
    ///
    /// - Parameters:
    ///   - variant: The semantic style that determines the icon and color scheme.
    ///   - size: The size configuration that controls typography scale and icon size.
    ///
    /// - Returns: A modified sonner with the specified variant and size applied.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// let sonner = SHDSonner(
    ///     title: "Upload complete",
    ///     subtitle: "3 files uploaded successfully"
    /// )
    /// .sonnerVariant(variant: .success, size: .lg)
    /// ```
    func sonnerVariant(variant: SHDSonnerVariant, size: SHDSonnerSize) -> Self {
        mutating { sonner in
            sonner.variant = variant
            sonner.size = size
        }
    }
}

#Preview {
    SHDSonnerPreview()
}
