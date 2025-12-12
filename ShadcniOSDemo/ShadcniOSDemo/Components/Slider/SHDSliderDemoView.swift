//
//  SHDSliderDemoView.swift
//  ShadcniOSDemo
//
//  Created by Diego Takaki on 12/12/25.
//

import SwiftUI
import ShadcniOS

// MARK: - Slider Demo View
struct SHDSliderDemoView: View {
    
    // Configuration state
    @State private var displayFormat: SHDSliderSize = .md
    @State private var showMinMax: Bool = true
    
    // Slider values
    @State private var sliderValue: Double = 50
    @State private var minRange: Int = 0
    @State private var maxRange: Int = 100
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                
                configSection(title: "Size") {
                    Picker("Format", selection: $displayFormat) {
                        Text("SM").tag(SHDSliderSize.sm)
                        Text("MD").tag(SHDSliderSize.md)
                        Text("LG").tag(SHDSliderSize.lg)
                    }
                    .pickerStyle(.segmented)
                }
                
                HStack(spacing: 20) {
                    configSection(title: "Range Settings") {
                        HStack(spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Min")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                TextField("Min", value: $minRange, format: .number)
                                    .textFieldStyle(.roundedBorder)
                                    .keyboardType(.numberPad)
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Max")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                TextField("Max", value: $maxRange, format: .number)
                                    .textFieldStyle(.roundedBorder)
                                    .keyboardType(.numberPad)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    configSection(title: "Options") {
                        Toggle("Show Min/Max", isOn: $showMinMax)
                    }
                }
                
                Divider()
                
                // MARK: Preview Section
                VStack(spacing: 24) {
                    Text("Preview")
                        .font(.headline)
                    
                    demoSlider
                        .padding(.horizontal, 24)
                        .padding(.vertical, 16)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(12)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
        }
        .navigationTitle("SHDSlider")
        .onChange(of: minRange) { _, newValue in
            if sliderValue < Double(newValue) {
                sliderValue = Double(newValue)
            }
        }
        .onChange(of: maxRange) { _, newValue in
            if sliderValue > Double(newValue) {
                sliderValue = Double(newValue)
            }
        }
    }
    
    // MARK: - Main Demo Slider
    @ViewBuilder
    private var demoSlider: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Current value - \(sliderValue, specifier: "%.2f")")
            
            // Slider
            SHDSlider(
                minValue: minRange,
                maxValue: maxRange,
                value: $sliderValue
            )
            .sliderVariant(variant: displayFormat)
            .padding(.vertical, 8)
            
            // Min/Max labels
            if showMinMax {
                HStack {
                    Text("\(minRange)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("\(maxRange)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
    
    // MARK: - Helper Section Builder
    @ViewBuilder
    private func configSection<Content: View>(
        title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
            content()
        }
    }
}

#Preview {
    NavigationStack {
        SHDSliderDemoView()
    }
}
