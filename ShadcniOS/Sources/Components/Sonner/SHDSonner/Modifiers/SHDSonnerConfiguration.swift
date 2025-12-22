//
//  SHDSonnerConfiguration.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/17/25.
//

import SwiftUI

/// Determines the screen edge where the notification appears.
public enum SHDSonnerPosition {
    case top
    case bottom
}

/// A view modifier that presents toast-style notifications with automatic dismissal and gestures.
///
/// ## Discussion
/// `SHDSonnerConfiguration` provides a complete notification presentation system
/// for the ShadcniOS design system. It handles:
///
/// - **Automatic dismissal**: Context-aware timing based on notification variant
///   - Default/Success: 3 seconds
///   - Warning/Destructive: 5 seconds
/// - **Interactive gestures**: Tap to dismiss or drag down to dismiss
/// - **Smooth animations**: Spring-based entrance, exit, and drag animations
/// - **Adaptive layout**: Responsive sizing (320-520pt width) with proper spacing
/// - **State management**: Automatic timer cancellation and cleanup
///
/// The modifier positions the notification at the bottom of the screen with
/// proper padding and handles all presentation lifecycle events.
///
/// ### Gesture Interactions
///
/// Users can dismiss notifications through:
/// - **Tap**: Immediately dismisses the notification
/// - **Drag down**: Requires 50pt threshold to trigger dismissal
/// - **Auto-dismiss**: Automatically dismisses after delay (variant-dependent)
///
/// This modifier is typically applied through the `.showSonner()` convenience
/// extension rather than used directly.
///
/// ## Usage
/// ```swift
/// struct MyView: View {
///     @State private var showSuccess = false
///
///     var body: some View {
///         VStack {
///             Button("Save") {
///                 performSave()
///                 showSuccess = true
///             }
///         }
///         .showSonner(
///             title: "Saved",
///             caption: "Changes saved successfully",
///             variant: .success,
///             isPresented: $showSuccess
///         )
///     }
/// }
/// ```
public struct SHDSonnerConfiguration: ViewModifier {
    @Binding var isPresented: Bool

    @State private var dragOffset: CGFloat = 0
    @State private var dismissTask: Task<Void, Never>?
    @State private var toastSize: CGSize = .zero

    private let dismissThreshold: CGFloat = 50

    let sonner: SHDSonner
    let position: SHDSonnerPosition

    private var autoDismissDelay: Duration {
        sonner.variant == .default || sonner.variant == .success ? .seconds(3) : .seconds(5)
    }

    init(
        sonner: SHDSonner,
        isPresented: Binding<Bool>,
        position: SHDSonnerPosition = .bottom
    ) {
        self.sonner = sonner
        _isPresented = isPresented
        self.position = position
    }

    public func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                VStack {
                    if position == .bottom {
                        Spacer()
                    }

                    sonner
                        .frame(minWidth: 320, maxWidth: 520)
                        .offset(y: dragOffset)
                        .padding(.horizontal, .sm)
                        .padding(position == .top ? .top : .bottom, .xxl)
                        .gesture(dragGesture)
                        .onTapGesture {
                            dismissToast()
                        }

                    if position == .top {
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .transition(.move(edge: position == .top ? .top : .bottom).combined(with: .opacity))
                .zIndex(0)
            }
        }
        .animation(.smooth, value: isPresented)
        .onAppear {
            if isPresented {
                startAutoDismissTimer()
            }
        }
        .onDisappear {
            cancelAutoDismissTimer()
        }
        .onChange(of: isPresented) { _, isPresented in
            if isPresented {
                startAutoDismissTimer()
            } else {
                cancelAutoDismissTimer()
            }
        }
    }

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                // For top position: drag up (negative) to dismiss
                // For bottom position: drag down (positive) to dismiss
                let translation = value.translation.height

                if position == .top {
                    if translation <= 0 {
                        dragOffset = translation
                    }
                } else {
                    if translation >= 0 {
                        dragOffset = translation
                    }
                }
            }
            .onEnded { value in
                let translation = abs(value.translation.height)
                let shouldDismiss = position == .top
                    ? value.translation.height <= -dismissThreshold
                    : value.translation.height >= dismissThreshold

                if shouldDismiss {
                    dismissToast()
                } else {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        dragOffset = 0
                    }
                }
            }
    }

    private func startAutoDismissTimer() {
        cancelAutoDismissTimer()

        guard isPresented else { return }

        dismissTask = Task { @MainActor in
            do {
                try await Task.sleep(for: autoDismissDelay)

                // Only dismiss if still presented and not cancelled
                if !Task.isCancelled && isPresented {
                    dismissToast()
                }
            } catch is CancellationError {
                // Task was cancelled - this is expected, do nothing
            } catch {
                #if DEBUG
                print("[SHDSonner] Unexpected error in auto-dismiss: \(error)")
                #endif
            }
        }
    }

    private func cancelAutoDismissTimer() {
        dismissTask?.cancel()
        dismissTask = nil
    }

    private func dismissToast() {
        cancelAutoDismissTimer()

        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            isPresented = false
            dragOffset = 0
        }
    }
}

public extension View {
    /// Presents a toast-style notification overlay with automatic dismissal and interactive gestures.
    ///
    /// ## Discussion
    /// This is the recommended way to present ShadcniOS notifications. The modifier
    /// handles all presentation logic, animations, and user interactions automatically.
    ///
    /// ## Behavior
    ///
    /// The notification:
    /// - Appears at the specified screen edge (top or bottom) with slide animation
    /// - Auto-dismisses based on variant (3s for default/success, 5s for warning/destructive)
    /// - Can be dismissed by tapping anywhere on the notification
    /// - Can be dismissed by dragging in the appropriate direction (down for bottom, up for top)
    /// - Springs back if drag is released before the threshold
    ///
    /// - Parameters:
    ///   - title: The primary message displayed prominently in the notification.
    ///   - subtitle: The secondary descriptive text displayed below the title.
    ///   - variant: The semantic style determining icon and colors. Defaults to `.default`.
    ///   - size: The typography scale for the notification. Defaults to `.md`.
    ///   - position: The screen edge where the notification appears. Defaults to `.bottom`.
    ///   - isPresented: A binding that controls the notification's presentation state.
    ///     Set to `true` to show the notification, `false` to dismiss it.
    ///
    /// - Returns: A view with the notification overlay configured.
    ///
    /// ## Usage
    ///
    /// Basic notification:
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var showToast = false
    ///
    ///     var body: some View {
    ///         Button("Show Notification") {
    ///             showToast = true
    ///         }
    ///         .showSonner(
    ///             title: "Success",
    ///             subtitle: "Operation completed",
    ///             variant: .success,
    ///             isPresented: $showToast
    ///         )
    ///     }
    /// }
    /// ```
    ///
    /// Top-positioned notification:
    /// ```swift
    /// VStack {
    ///     // Your content
    /// }
    /// .showSonner(
    ///     title: "Low storage",
    ///     subtitle: "You're running out of space",
    ///     variant: .warning,
    ///     position: .top,
    ///     isPresented: $showWarning
    /// )
    /// ```
    func showSonner(
        isPresented: Binding<Bool>,
        from: SHDSonnerPosition = .bottom,
        @ViewBuilder content: @escaping () -> SHDSonner
    ) -> some View {
        modifier(
            SHDSonnerConfiguration(
                sonner: content(),
                isPresented: isPresented,
                position: from
            )
        )
    }
}
