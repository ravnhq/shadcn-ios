//
//  SHDSonnerConfiguration.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/17/25.
//

import SwiftUI

struct SHDSonnerConfiguration: ViewModifier {

    @Binding var isPresented: Bool
    let title: String
    let caption: String
    let variant: SHDSonnerVariant
    let size: SHDSonnerSize

    @State private var dragOffset: CGFloat = 0
    @State private var dismissTask: Task<Void, Never>?
    @State private var toastSize: CGSize = .zero
    private let dismissThreshold: CGFloat = 50

    private let autoDismissDelay: Duration = .seconds(3)
    func body(content: Content) -> some View {
        ZStack {
            content

            VStack {
                Spacer()

                if isPresented {
                    sonnerOverlay
                        .background(
                            Color.clear
                                .frame(height: max(toastSize.height, 53))
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
        SHDSonner(title: title, subtitle: caption)
            .sonnerVariant(variant: variant, size: size)
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

    public func showSonner(title: String,
                           caption: String,
                           variant: SHDSonnerVariant = .default,
                           size: SHDSonnerSize = .md,
                           isPresented: Binding<Bool>) -> some View {
        modifier(SHDSonnerConfiguration(isPresented: isPresented,
                                        title: title,
                                        caption: caption,
                                        variant: variant,
                                        size: size))
    }
}

#Preview {
    @Previewable @State var isPresented: Bool = false

    VStack {
        Button {
            isPresented = true
        }label: {
            Text("Show sonner")
        }
    }
    .showSonner(title: "Test", caption: "Caption", isPresented: $isPresented)
}
