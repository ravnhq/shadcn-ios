//
//  SwiftUIView.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/24/25.
//

import SwiftUI

/// A view modifier that automatically dismisses a view after a specified delay using a closure-based API.
///
/// ## Discussion
/// This modifier provides automatic dismissal functionality without requiring a binding.
/// Instead, it accepts a closure that will be called when the view should be dismissed,
/// allowing for more flexible state management patterns.
///
/// The timer starts when the view appears and is automatically cancelled if the
/// view disappears before the delay completes. This ensures proper cleanup and
/// prevents memory leaks or unexpected behavior.
/// 
/// ## Usage
/// ```swift
/// struct ContentView: View {
///     @State private var notification: String? = nil
///
///     var body: some View {
///         VStack {
///             Button("Show Toast") {
///                 notification = "Success!"
///             }
///
///             if let message = notification {
///                 Text(message)
///                     .padding()
///                     .background(.blue)
///                     .cornerRadius(8)
///                     .autoDismiss(after: .seconds(3)) {
///                         notification = nil
///                     }
///             }
///         }
///     }
/// }
/// ```
internal struct AutoDismissModifier: ViewModifier {

    let delay: Duration
    let id: UUID
    let onDismiss: () -> Void

    internal func body(content: Content) -> some View {
        content
            .task(id: id) {
                do {
                    try await Task.sleep(for: delay)
                    onDismiss()
                } catch {
                    #if DEBUG
                    print("[AutoDismiss] Task cancelled (id: \(id.uuidString.prefix(8)))")
                    #endif
                }
            }
    }
}

internal extension View {
    /// Automatically dismisses a view after a specified delay by calling a closure.
    ///
    /// ## Discussion
    /// This modifier provides a closure-based auto-dismiss API that doesn't require
    /// managing a `@State` binding. When the delay expires, your closure is called,
    /// allowing you to update any state you need (setting an optional to nil, toggling
    /// a boolean, etc.).
    ///
    /// The timer starts when the view appears and is automatically cancelled if the
    /// view disappears before the delay completes.
    ///
    /// - Parameters:
    ///   - delay: The duration to wait before calling the dismiss closure.
    ///   - onDismiss: A closure called when the auto-dismiss timer completes.
    ///     Use this to update your state and remove the view.
    ///
    /// - Returns: A view that will call the dismiss closure after the specified delay.
    ///
    /// ## Usage
    ///
    /// ### With optional-based state:
    /// ```swift
    /// if let toast = currentToast {
    ///     ToastView(toast)
    ///         .autoDismiss(after: .seconds(3)) {
    ///             currentToast = nil
    ///         }
    /// }
    /// ```
    func autoDismiss(
        after delay: Duration,
        id: UUID = UUID(),
        onDismiss: @escaping () -> Void
    ) -> some View {
        modifier(
            AutoDismissModifier(
                delay: delay,
                id: id,
                onDismiss: onDismiss
            )
        )
    }
}
