//
//  SHDCardHeader.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/27/25.
//

import SwiftUI

/// A header component that displays a card title and supporting description.
///
/// ### Discussion
/// `SHDCardHeader` provides a standardized header layout for card-style views in
/// the ShadcniOS design system. It vertically stacks a prominent title and a
/// secondary description with consistent typography, spacing, and alignment.
///
/// The component automatically applies:
/// - **Typography**: Uses design-system text styles for the title (`.text2XLSemibold`)
///   and description (`.textSMRegular`)
/// - **Color**: Applies the muted foreground color to the description
/// - **Layout**: Left-aligns both texts and stretches them to the full available width
/// - **Spacing**: Uses design tokens (such as `.lg`) for vertical padding between
///   the header and surrounding content
///
/// This component is used internally by `SHDCard` to render the card header, but
/// it can also be used independently wherever a simple title/description header
/// is needed.
///
/// ### Usage
///
/// Basic header with title and description:
/// ```swift
/// SHDCardHeader(
///     title: "Create project",
///     description: "Deploy your new project in one-click."
/// )
/// ```
///
/// ### Notes
/// - The header assumes short to medium-length text; very long titles or descriptions
///   will wrap onto multiple lines
/// - Design-system spacing tokens (such as `.lg`) are used instead of hardcoded values
/// - This component is typically composed within `SHDCard` and not exposed directly
struct SHDCardHeader: View {

    // MARK: - Properties

    /// The primary title text displayed at the top of the card header.
    ///
    /// This text uses the `.text2XLSemibold` design-system text style and is
    /// left-aligned across the full available width.
    private var title: String

    /// The secondary descriptive text displayed below the title.
    ///
    /// This text uses the `.textSMRegular` design-system text style and the
    /// muted foreground color to visually de-emphasize it relative to the title.
    private var description: String

    // MARK: - Initializer

    /// Creates a new card header with a title and description.
    ///
    /// - Parameters:
    ///   - title: The primary heading text to display at the top of the header.
    ///   - description: The supporting text displayed below the title, providing
    ///     additional context or explanation.
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

    // MARK: - View

    /// The header's visual representation, stacking title and description with
    /// design-system typography, colors, and spacing.
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .textStyle(.text2XLSemibold)
                .padding(.top, .lg)

            Text(description)
                .textStyle(.textSMRegular)
                .foregroundColor(.foregroundMuted)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, -8)
        }
        .padding(.bottom, .lg)
    }
}
