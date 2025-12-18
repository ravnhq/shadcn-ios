//
//  SHDSonnerConfiguration.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/17/25.
//

import SwiftUI

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
struct SHDSonnerConfiguration: ViewModifier {

    @Binding var isPresented: Bool

    @State private var dragOffset: CGFloat = 0
    @State private var dismissTask: Task<Void, Never>?
    @State private var toastSize: CGSize = .zero

    private let dismissThreshold: CGFloat = 50

    let title: String
    let subtitle: String
    let size: SHDSonnerSize
    let variant: SHDSonnerVariant

    private var autoDismissDelay: Duration {
        variant == .default || variant == .success ? .seconds(3) : .seconds(5)
    }

    init(isPresented: Binding<Bool>,
         title: String,
         subtitle: String,
         size: SHDSonnerSize,
         variant: SHDSonnerVariant
    ) {
        _isPresented = isPresented
        self.title = title
        self.subtitle = subtitle
        self.size = size
        self.variant = variant
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            VStack {
                Spacer()

                if isPresented {
                    sonnerOverlay
                        .background(
                            Color.clear
                                .frame(height: toastSize.height)
                                .contentShape(Rectangle())
                        )
                }
            }
        }
        .animation(.smooth, value: isPresented)
        .onChange(of: isPresented) { _, isPresented in
            if isPresented {
                startAutoDismissTimer()
            } else {
                cancelAutoDismissTimer()
            }
        }
    }

    @ViewBuilder
    private var sonnerOverlay: some View {
        SHDSonner(title: title, subtitle: subtitle)
            .sonnerVariant(variant: variant, size: size)
            .frame(minWidth: 320, maxWidth: 520)
            .background(
                GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            toastSize = geometry.size
                        }
                        .onChange(of: geometry.size) { _, newSize in
                            toastSize = newSize
                        }
                }
            )
            .offset(y: dragOffset)
            .padding(.all, .sm)
            .transition(
                .asymmetric(
                    insertion: .move(edge: .bottom).combined(with: .opacity),
                    removal: .move(edge: .bottom).combined(with: .opacity)
                )
            )
            .gesture(dragGesture)
            .onTapGesture {
                dismissToast()
            }
    }

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                if value.translation.height >= 0 {
                    dragOffset = value.translation.height
                }
            }
            .onEnded { value in
                if value.translation.height >= dismissThreshold {
                    dismissToast()
                } else {
                    dragOffset = 0
                }
            }
    }

    private func startAutoDismissTimer() {
        cancelAutoDismissTimer()

        guard isPresented else { return }

        dismissTask = Task { @MainActor in
            do {
                try await Task.sleep(for: autoDismissDelay)

                if !Task.isCancelled && isPresented {
                    dismissToast()
                }
            } catch {}
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

extension View {

    /// Presents a toast-style notification overlay with automatic dismissal and interactive gestures.
    ///
    /// ## Discussion
    /// This is the recommended way to present ShadcniOS notifications. The modifier
    /// handles all presentation logic, animations, and user interactions automatically.
    ///
    /// ## Behavior
    ///
    /// The notification:
    /// - Appears at the bottom of the screen with slide-up animation
    /// - Auto-dismisses based on variant (3s for default/success, 5s for warning/destructive)
    /// - Can be dismissed by tapping anywhere on the notification
    /// - Can be dismissed by dragging down 50 points or more
    /// - Springs back if drag is released before the threshold
    ///
    /// - Parameters:
    ///   - title: The primary message displayed prominently in the notification.
    ///   - subtitle: The secondary descriptive text displayed below the title.
    ///   - variant: The semantic style determining icon and colors. Defaults to `.default`.
    ///   - size: The typography scale for the notification. Defaults to `.md`.
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
    /// Warning notification with custom size:
    /// ```swift
    /// VStack {
    ///     // Your content
    /// }
    /// .showSonner(
    ///     title: "Low storage",
    ///     subtitle: "You're running out of space",
    ///     variant: .warning,
    ///     size: .lg,
    ///     isPresented: $showWarning
    /// )
    /// ```
    public func showSonner(title: String,
                           caption: String,
                           variant: SHDSonnerVariant = .default,
                           size: SHDSonnerSize = .md,
                           isPresented: Binding<Bool>) -> some View {
        modifier(SHDSonnerConfiguration(isPresented: isPresented,
                                        title: title,
                                        subtitle: caption,
                                        size: size,
                                        variant: variant
                                        ))
    }
}
