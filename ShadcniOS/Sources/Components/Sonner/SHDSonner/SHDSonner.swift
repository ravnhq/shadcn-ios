//
//  SHDSonner.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

/// A toast-style notification component for displaying temporary messages to users.
/// 
/// ## Discussion
///
/// The sonner component is designed to provide brief, actionable feedback without
/// interrupting the user's workflow. It automatically dismisses after a contextual
/// delay and supports interactive dismissal through tap and drag gestures.
///
/// This type is internal to the module and is not intended to be used directly
/// outside of `SHDSonnerConfiguration`.
///
internal struct SHDSonner: View {

    private let description: String
    private let title: String
    private var size: SHDSonnerSize = .md
    private var variant: SHDSonnerVariant = .default

    internal init(description: String, title: String) {
        self.title = title
        self.description = description
    }

    internal var body: some View {
        HStack(alignment: .top, spacing: .sm) {
            SHDIcon(variant.icon)
                .iconSize(size.iconSize)
                .foregroundColor(variant.foregroundIconColor)

            VStack(alignment: .leading, spacing: .sm) {
                Text(title)
                    .foregroundStyle(.foregroundDefault)
                    .textStyle(size.titleStyle)

                Text(description)
                    .foregroundStyle(.foregroundMuted)
                    .textStyle(size.descriptionStyle)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
    /// .sonnerConfiguration(variant: .success, size: .lg)
    /// ```
    func sonnerConfiguration(variant: SHDSonnerVariant, size: SHDSonnerSize) -> Self {
        mutating { sonner in
            sonner.variant = variant
            sonner.size = size
        }
    }
}

#Preview {
    SHDSonnerPreview()
}
