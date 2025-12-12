//
//  SHDSlider.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/12/25.
//

import SwiftUI

public struct SHDSlider: View {

    private var size: SHDSliderSize = .md
    private var minValue: Int
    private var maxValue: Int
    @Binding var value: Double

    public init(minValue: Int, maxValue: Int, value: Binding<Double>) {
        self.minValue = minValue
        self.maxValue = maxValue
        _value = value
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: .full)
                    .fill(.backgroundSecondaryDefault)
                    .frame(height: size.sliderSize)

                RoundedRectangle(cornerRadius: .full)
                    .fill(.iconDefault)
                    .frame(width: calculateWidth(geometry.size.width), height: size.sliderSize)

                Circle()
                    .fill(.iconPrimaryDefault)
                    .frame(width: size.thumbSize, height: size.thumbSize)
                    .overlay(
                        Circle()
                            .strokeBorder(.borderPrimaryDefault, lineWidth: SHDSizing.Radius.xs.rawValue)
                    )
                    .offset(x: calculateWidth(geometry.size.width) - size.sliderSize)
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { gesture in
                        updateValue(gesture.location.x, width: geometry.size.width)
                    }
            )
        }
        .frame(height: size.sliderSize)
    }

    private func calculateWidth(_ totalWidth: CGFloat) -> CGFloat {
        let percentage = (value - Double(minValue)) / (Double(maxValue) - Double(minValue))
        return max(0, min(totalWidth, totalWidth * CGFloat(percentage)))
    }

    private func updateValue(_ position: CGFloat, width: CGFloat) {
        let percentage = max(0, min(1, position / width))
        value = Double(minValue) + percentage * Double(maxValue - minValue)
    }

    public func sliderVariant(variant: SHDSliderSize) -> some View {
        mutating { slider in
            slider.size = variant
        }
    }
}

#Preview {
    SHDSliderPreview()
}
