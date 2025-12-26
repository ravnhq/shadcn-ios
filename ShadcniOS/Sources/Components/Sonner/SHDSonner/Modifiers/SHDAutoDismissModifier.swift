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
    @State private var dismissTask: Task<Void, Never>?

    let delay: Duration
    let onDismiss: () -> Void

    internal func body(content: Content) -> some View {
        content
            .onAppear {
                startAutoDismissTimer()
            }
            .onDisappear {
                cancelAutoDismissTimer()
            }
    }

    private func startAutoDismissTimer() {
        cancelAutoDismissTimer()

        dismissTask = Task { @MainActor in
            do {
                try await Task.sleep(for: delay)

                if !Task.isCancelled {
                    onDismiss()
                }
            } catch is CancellationError {
                // Task was cancelled - this is expected, do nothing
            } catch {
                #if DEBUG
                print("[AutoDismiss] Unexpected error in auto-dismiss: \(error)")
                #endif
            }
        }
    }

    private func cancelAutoDismissTimer() {
        dismissTask?.cancel()
        dismissTask = nil
    }
}
