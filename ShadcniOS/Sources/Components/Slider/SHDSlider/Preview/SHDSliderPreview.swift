//
//  SHDSliderPreview.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/12/25.
//

import SwiftUI

struct SHDSliderPreview: View {
    @State private var progressValue: Double = 75
    @State private var sliderValue: Double = 50
    @State private var tempValue: Double = 20

    var body: some View {
        VStack(spacing: .xl) {
            VStack(alignment: .leading, spacing: .sm) {
                Text("Volume: \(Int(sliderValue))%")
                    .textStyle(.textBaseMedium)
                    .foregroundStyle(.secondary)

                SHDSlider(minValue: 0, maxValue: 100, value: $sliderValue)
                    .sliderVariant(variant: .lg)
                    .padding(.horizontal)
            }

            VStack(alignment: .leading, spacing: .sm) {
                Text("Temperature: \(tempValue)°")
                    .textStyle(.textBaseMedium)
                    .foregroundStyle(.secondary)

                SHDSlider(minValue: -10, maxValue: 40, value: $tempValue)
                    .sliderVariant(variant: .md)
                    .padding(.horizontal)
            }

            VStack(alignment: .leading, spacing: .sm) {
                Text("Progress: \(Int(progressValue))%")
                    .textStyle(.textBaseMedium)
                    .foregroundStyle(.secondary)

                SHDSlider(minValue: 0, maxValue: 100, value: $progressValue)
                    .sliderVariant(variant: .sm)
                    .padding(.horizontal)
            }
        }
        .padding()
    }
}

#Preview {
    SHDSliderPreview()
}
