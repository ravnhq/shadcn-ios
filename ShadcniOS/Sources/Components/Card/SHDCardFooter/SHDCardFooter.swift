//
//  SHDCardFooter.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/27/25.
//

import SwiftUI

/// A footer component that displays two action buttons for card interactions.
///
/// ### Discussion
/// `SHDCardFooter` provides a standardized footer layout for card components with
/// two action buttons arranged horizontally. The component automatically applies
/// consistent styling and layout:
///
/// - **Button Layout**: Two buttons arranged in an `HStack`, each taking equal width
/// - **Button Styling**: 
///   - First button uses `.outline` variant with `.sm` size, left-aligned
///   - Second button uses `.default` variant with `.sm` size, right-aligned
/// - **Full-width Distribution**: Both buttons expand to fill available space
///
/// This component is used internally by `SHDCard` to ensure consistent footer
/// styling across all card implementations. The first button is typically used for
/// secondary actions (e.g., "Cancel", "Reset"), while the second button is used for
/// primary actions (e.g., "Create", "Save").
///
/// The component maintains design system consistency by using standardized button
/// variants and sizes, ensuring proper alignment with other ShadcniOS components.
///
/// ### Usage
///
/// Basic footer with cancel and confirm actions:
/// ```swift
/// SHDCardFooter(
///     button1Title: "Cancel",
///     button2Title: "Create"
/// ) {
///     // Handle cancel action
///     dismiss()
/// } actionButton2: {
///     // Handle create action
///     createItem()
/// }
/// ```
///
/// Footer with reset and save actions:
/// ```swift
/// SHDCardFooter(
///     button1Title: "Reset",
///     button2Title: "Save"
/// ) {
///     resetForm()
/// } actionButton2: {
///     saveChanges()
/// }
/// ```
///
/// Footer with custom action handlers:
/// ```swift
/// SHDCardFooter(
///     button1Title: "Discard",
///     button2Title: "Apply"
/// ) {
///     viewModel.discardChanges()
///     navigationController.pop()
/// } actionButton2: {
///     viewModel.applyChanges()
///     showSuccessMessage()
/// }
/// ```
///
/// ### Notes
/// - Both buttons are required and will always be displayed
/// - Button styling (variant and size) is fixed and cannot be customized
/// - The first button is always left-aligned, the second is right-aligned
/// - This component is typically used within `SHDCard` but can be used independently
/// - Both buttons use the `.sm` size from the design system
struct SHDCardFooter: View {

    // MARK: - Properties

    /// The title text displayed on the first (outline) button.
    ///
    /// This button is typically used for secondary actions such as "Cancel",
    /// "Reset", or "Discard". It uses the `.outline` variant and is left-aligned.
    private var button1Title: String

    /// The title text displayed on the second (default) button.
    ///
    /// This button is typically used for primary actions such as "Create",
    /// "Save", or "Apply". It uses the `.default` variant and is right-aligned.
    private var button2Title: String

    /// The closure executed when the first button is tapped.
    ///
    /// This action is typically used for secondary operations like canceling
    /// an operation, resetting a form, or dismissing a view.
    private var actionButton1: () -> Void

    /// The closure executed when the second button is tapped.
    ///
    /// This action is typically used for primary operations like saving changes,
    /// creating an item, or confirming an action.
    private var actionButton2: () -> Void

    // MARK: - Initializer

    /// Creates a new card footer with two action buttons.
    ///
    /// - Parameters:
    ///   - button1Title: The text label for the first (outline) button, typically used for secondary actions
    ///   - button2Title: The text label for the second (default) button, typically used for primary actions
    ///   - actionButton1: The closure executed when the first button is tapped
    ///   - actionButton2: The closure executed when the second button is tapped
    init(
        button1Title: String,
        button2Title: String,
        actionButton1: @escaping () -> Void,
        actionButton2: @escaping () -> Void
    ) {
        self.button1Title = button1Title
        self.button2Title = button2Title
        self.actionButton1 = actionButton1
        self.actionButton2 = actionButton2
    }

    // MARK: - View

    /// The footer's visual representation, displaying two action buttons in a horizontal layout.
    ///
    /// The footer renders:
    /// - First button with `.outline` variant, `.sm` size, left-aligned
    /// - Second button with `.default` variant, `.sm` size, right-aligned
    /// - Both buttons expand to fill available horizontal space
    var body: some View {
        HStack {
            SHDButton(label: button1Title) {
                actionButton1()
            }
            .buttonVariant(variant: .outline, size: .sm)

            SHDButton(label: button2Title) {
                actionButton2()
            }
            .buttonVariant(variant: .default, size: .sm)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
