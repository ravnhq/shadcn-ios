//
//  SHDSonnerConfiguration.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/17/25.
//

import SwiftUI

/// zIndex declared to avoid confusion on the sonner's values.
///
private enum SHDZIndex {
    static let sonner: Double = 999
}

/// `SHDSonnerModifier` is the internal implementation that powers the `.sonner()` view modifier.
/// It handles all aspects of notification presentation, including animations, gestures, timing,
/// and layout adaptation across different devices and orientations.
///
/// This modifier is an internal type that should not be used directly. Instead,
/// use the public `.sonner(configuration:isPresented:)` view modifier provided
/// by the ``SHDSonnerConfiguration`` extension.
///
internal struct SHDSonnerModifier: ViewModifier {
    // MARK: Properties

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    @Binding var isPresented: Bool

    @State private var dragOffset: CGFloat = 0
    @State private var sonnerId = UUID()
    @State private var toastSize: CGSize = .zero

    private let dismissThreshold: CGFloat = 50
    private let position: SHDSonnerPosition
    private let sonner: SHDSonner
    private let variant: SHDSonnerVariant

    // MARK: Computed properties

    private var autoDismissDelay: Duration {
        variant == .default || variant == .success ? .seconds(3) : .seconds(5)
    }

    private var isIpadInSmallFormFactor: Bool {
        UIDevice.current.userInterfaceIdiom == .pad && horizontalSizeClass == .compact
    }

    init(
        position: SHDSonnerPosition = .bottom,
        sonner: SHDSonner,
        variant: SHDSonnerVariant,
        isPresented: Binding<Bool>
    ) {
        self.position = position
        self.sonner = sonner
        self.variant = variant
        _isPresented = isPresented
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                VStack {
                    if position == .bottom {
                        Spacer()
                    }

                    sonner
                        .frame(maxWidth: isIpadInSmallFormFactor ? .infinity : 520)
                        .offset(y: dragOffset)
                        .padding(.horizontal, .sm)
                        .gesture(dragGesture())
                        .autoDismiss(after: autoDismissDelay, id: sonnerId) {
                            dismissToast()
                        }
                        .onTapGesture {
                            dismissToast()
                        }

                    if position == .top {
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .transition(.move(edge: position.edge).combined(with: .opacity))
                .zIndex(SHDZIndex.sonner)
            }
        }
        .animation(.smooth(duration: 0.75), value: isPresented)
        .onChange(of: isPresented) { _, newValue in
            if newValue {
                sonnerId = UUID()
            }
        }
    }

    private func dragGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                // For top position: drag up (negative) to dismiss
                // For bottom position: drag down (positive) to dismiss
                let translation = value.translation.height

                if position.allowsDrag(translation) {
                    dragOffset = translation
                }
            }
            .onEnded { value in
                let translation = abs(value.translation.height)

                if position.shouldDismiss(translation, threshold: dismissThreshold) {
                    dismissToast()
                } else {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        dragOffset = 0
                    }
                }
            }
    }

    private func dismissToast() {
        isPresented = false
        dragOffset = 0
    }
}

public extension View {
    /// Presents a toast notification with automatic dismissal and interactive gestures.
    ///
    /// This modifier displays a sonner notification based on the provided configuration
    /// and binding. The notification automatically dismisses after a contextual delay
    /// and supports interactive dismissal through tap and drag gestures.
    ///
    /// - Parameters:
    ///   - configuration: The configuration specifying the notification's content and appearance.
    ///   - isPresented: A binding to a Boolean value that determines whether the notification is visible.
    ///
    /// - Returns: A view that presents the notification when the binding becomes `true`.
    ///
    /// ## Usage
    ///
    /// ```swift
    /// struct ContentView: View {
    ///     @State private var showNotification = false
    ///
    ///     var body: some View {
    ///         VStack {
    ///             Button("Save") {
    ///                 saveData()
    ///                 showNotification = true
    ///             }
    ///         }
    ///         .sonner(
    ///             configuration: SHDSonnerConfiguration(
    ///                 title: "Saved successfully",
    ///                 subtitle: "Your changes have been saved"
    ///             ),
    ///             isPresented: $showNotification
    ///         )
    ///     }
    /// }
    /// ```
    func sonner(
        configuration: SHDSonnerConfiguration,
        isPresented: Binding<Bool>
    ) -> some View {
        modifier(
            SHDSonnerModifier(
                position: configuration.position,
                sonner: makeSonner(with: configuration),
                variant: configuration.variant,
                isPresented: isPresented
            )
        )
    }

    private func makeSonner(with configuration: SHDSonnerConfiguration) -> SHDSonner {
        SHDSonner(
            description: configuration.description,
            title: configuration.title
        )
        .sonnerConfiguration(variant: configuration.variant, size: configuration.size)
    }
}
