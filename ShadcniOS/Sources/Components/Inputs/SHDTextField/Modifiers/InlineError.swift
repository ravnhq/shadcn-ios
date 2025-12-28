//
//  InlineError.swift
//  ShadcniOS
//
//  Created by Concepción Orellana on 12/26/25.
//

import SwiftUI

/// A view modifier that injects an inline error message into the environment for use by child views.
///
/// Use this modifier to display an inline error message associated with a view, such as a text field.
/// The error message will be available to any child views via the `\EnvironmentValues.inlineError` key.
public struct InlineError: ViewModifier {
    // MARK: Properties

    let inlineError: LocalizedStringKey?

    // MARK: View

    public func body(content: Content) -> some View {
        content
            .environment(\.inlineError, inlineError)
    }
}

public extension View {
    /// Applies an inline error message to the view.
    ///
    /// - Parameter inlineError: The optional error message to display. If `nil`, no error message is displayed.
    /// - Returns: A view with the inline error message applied.
    func shdInlineError(_ inlineError: LocalizedStringKey?) -> some View {
        modifier(InlineError(inlineError: inlineError))
    }
}
