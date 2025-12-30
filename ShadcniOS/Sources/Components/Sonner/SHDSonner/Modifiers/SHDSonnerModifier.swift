//
//  SHDSonnerConfiguration.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/17/25.
//

import SwiftUI

/// `SHDSonnerModifier` is the internal implementation that powers the `.sonner()` view modifier.
/// It handles all aspects of notification presentation, including animations, gestures, timing,
/// and layout adaptation across different devices and orientations.
/// ## Internal Implementation
///
/// This modifier is an internal type that should not be used directly. Instead,
/// use the public `.sonner(configuration:isPresented:)` view modifier provided
/// by the ``SHDSonnerConfiguration`` extension.
///
/// ## Example Usage (Internal)
///
/// ```swift
/// // Don't use directly - use .sonner() instead
/// content
///     .modifier(
///         SHDSonnerModifier(
///             sonner: sonner,
///             position: .bottom,
///             isPresented: $isPresented
///         )
///     )
/// ```
internal struct SHDSonnerModifier: ViewModifier {
    // MARK: Properties

    @Environment(\.horizontalSizeClass) private var availableWidth

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
        UIDevice.current.userInterfaceIdiom == .pad && availableWidth == .compact
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

    public func body(content: Content) -> some View {
        ZStack {
            content

            if isPresented {
                VStack {
                    if position == .bottom {
                        Spacer()
                    }

                    sonner
                        .frame(
                            minWidth: isIpadInSmallFormFactor ? .infinity : 320,
                            maxWidth: isIpadInSmallFormFactor ? .infinity : 520
                        )
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
                .zIndex(999)
            }
        }
        .animation(.smooth(duration: 0.5), value: isPresented)
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
        withAnimation(.smooth(duration: 0.8)) {
            isPresented = false
            dragOffset = 0
        }
    }
}
