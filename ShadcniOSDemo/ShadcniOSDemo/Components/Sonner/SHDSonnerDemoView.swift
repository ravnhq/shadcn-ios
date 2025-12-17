//
//  SHDSonnerDemoView.swift
//  ShadcniOSDemo
//
//  Created by Diego Takaki on 12/16/25.
//

import SwiftUI
import ShadcniOS

struct SHDSonnerDemoView: View {
    @State private var isPresented: Bool = false
    @State private var selectedVariant: SHDSonnerVariant = .default
    @State private var selectedSize: SHDSonnerSize = .sm
    
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
        .showSonner(
            title: "Event has been created",
            caption: "Sunday, December 03, 2023 at 9:00 AM",
            variant: selectedVariant,
            size: selectedSize,
            isPresented: $isPresented
        )
    }
}

#Preview {
    SHDSonnerDemoView()
}
