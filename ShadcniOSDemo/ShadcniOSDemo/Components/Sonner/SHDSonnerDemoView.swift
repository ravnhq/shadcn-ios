//
//  SHDSonnerDemoView.swift
//  ShadcniOSDemo
//
//  Created by Diego Takaki on 12/16/25.
//

import ShadcniOS
import SwiftUI

struct SHDSonnerDemoView: View {
    @State private var isPresented: Bool = false
    @State private var selectedVariant: SHDSonnerVariant = .default
    @State private var selectedSize: SHDSonnerSize = .sm
    @State private var position: SHDSonnerPosition = .bottom

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Variant")
                        .font(.headline)
                    Picker("Variant", selection: $selectedVariant) {
                        Text("default")
                            .tag(SHDSonnerVariant.default)
                        Text("success")
                            .tag(SHDSonnerVariant.success)
                        Text("warning")
                            .tag(SHDSonnerVariant.warning)
                        Text("destructive")
                            .tag(SHDSonnerVariant.destructive)
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Size")
                        .font(.headline)
                    Picker("Size", selection: $selectedSize) {
                        Text("sm")
                            .tag(SHDSonnerSize.sm)
                        Text("md")
                            .tag(SHDSonnerSize.md)
                        Text("lg")
                            .tag(SHDSonnerSize.lg)
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Position")
                        .font(.headline)
                    Picker("Position", selection: $position) {
                        Text("top")
                            .tag(SHDSonnerPosition.top)
                        Text("bottom")
                            .tag(SHDSonnerPosition.bottom)
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal)

                // Show Button
                Button {
                    isPresented = true
                } label: {
                    Text("Show Sonner")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.separator)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }

            Spacer()

            Text("Text to be behind the sonner")
                .padding(.bottom, 16)
        }
        .showSonner(isPresented: $isPresented, from: position) {
            SHDSonner(title: "Event has been created",
                      subtitle: "Sunday, December 03, 2023 at 9:00 AM",)
            .sonnerVariant(variant: selectedVariant, size: selectedSize)
        }
    }
}

#Preview {
    SHDSonnerDemoView()
}
