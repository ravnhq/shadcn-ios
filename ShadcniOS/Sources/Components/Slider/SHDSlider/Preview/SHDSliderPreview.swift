//
//  SHDSliderPreview.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/12/25.
//

import SwiftUI

internal struct SHDSliderPreview: View {
    @State private var sliderValue: Double = 50

    var body: some View {
        VStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Volume: \(Int(sliderValue))%")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                SHDSlider(minValue: 0, maxValue: 100, value: $sliderValue)
                    .sliderVariant(variant: .lg)
                    .padding(.horizontal)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Temperature: \(tempValue)°")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                SHDSlider(minValue: -10, maxValue: 40, value: $tempValue)
                    .sliderVariant(variant: .md)
                    .padding(.horizontal)
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Progress: \(Int(progressValue))%")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                SHDSlider(minValue: 0, maxValue: 100, value: $progressValue)
                    .sliderVariant(variant: .sm)
                    .padding(.horizontal)
            }
        }
        .padding()
    }

    @State private var tempValue: Double = 20
    @State private var progressValue: Double = 75
}

#Preview {
    SHDSliderPreview()
}
