//
//  IconShowcaseView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 11/4/25.
//

import SwiftUI
import ShadcniOS

struct IconShowcaseView: View {
    init() {
        FontLoader.loadFonts(["Accessibility"])
    }

    @State private var scale: CGFloat = 1.0
    @State private var isPink = true
    @State private var rotate = false

    var body: some View {
        ScrollView {
            VStack {
                // MARK: - Basic Display
                VStack(spacing: 12) {
                    Text("Basic Display")
                        .font(.headline)
                    Icon(.iconAlert)
                    Text("Default size (24pt)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // MARK: - Sizing
                VStack(spacing: 12) {
                    Text("Sizing Test")
                        .font(.headline)
                    HStack(spacing: 20) {
                        Icon(.iconAlert, size: 12)
                        Icon(.iconAlert, size: 24)
                        Icon(.iconAlert, size: 48)
                        Icon(.iconAlert, size: 96)
                    }
                }

                // MARK: - Color Variations
                VStack(spacing: 12) {
                    Text("Color Test")
                        .font(.headline)
                    HStack(spacing: 20) {
                        Icon(.iconAlert).foregroundColor(.pink)
                        Icon(.iconAlert).foregroundColor(.blue)
                        Icon(.iconAlert).foregroundColor(.green)
                        Icon(.iconAlert).foregroundColor(.gray.opacity(0.5))
                    }
                }

                // MARK: - Animation (scale & color)
                VStack(spacing: 12) {
                    Text("Animated Scale & Color")
                        .font(.headline)
                    Icon(.iconAlert, size: 60)
                        .foregroundColor(isPink ? .pink : .orange)
                        .scaleEffect(scale)
                        .animation(.spring(duration: 0.4), value: scale)
                        .animation(.easeInOut(duration: 0.4), value: isPink)

                    Button("Animate") {
                        scale = scale == 1 ? 1.5 : 1
                        isPink.toggle()
                    }
                    .buttonStyle(.borderedProminent)
                }

                // MARK: - In Button
                VStack(spacing: 12) {
                    Text("Icon in a Button")
                        .font(.headline)
                    Button(action: {}) {
                        HStack {
                            Icon(.iconAlert, size: 20)
                            Text("Alert")
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).fill(.pink.opacity(0.2)))
                    }
                }
                
                // MARK: - Rotation Animation
                VStack(spacing: 12) {
                    Text("Rotation Animation")
                        .font(.headline)
                    Icon(.iconAlert, size: 80)
                        .rotationEffect(.degrees(rotate ? 360 : 0))
                        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: rotate)
                        .onAppear { rotate = true }
                }
            }
            .padding()
        }
        .navigationTitle("ShadcniOS Icon Tests")
    }
}
