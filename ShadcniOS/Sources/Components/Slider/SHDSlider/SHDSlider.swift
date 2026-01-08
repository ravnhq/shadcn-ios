//
//  SHDSlider.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/12/25.
//

import SwiftUI

/// A customizable slider component for selecting numeric values within a range.
///
/// ## Discussion
/// `SHDSlider` provides a fluid, interactive slider control that supports:
/// - Continuous value selection within a defined range
/// - Customizable size variants (small, medium, large)
/// - Visual feedback with a filled track, draggable thumb and min/max values on the edges
/// - Gesture-based interaction for precise value adjustment
///
/// The slider automatically calculates the thumb position based on the current value
/// and the specified min/max range. Users can interact with the slider by:
///
/// - Dragging the thumb
/// - Tapping anywhere on the track to jump to that position
///
/// Size variants control:
/// - Track height
/// - Thumb diameter
/// - Text size
///
/// These are configured through the `SHDSliderSize` enum and applied via the
/// `.sliderVariant(variant:)` modifier.
///
/// ## Usage
///
/// Basic slider:
/// ```swift
/// @State private var volume: Double = 50
///
/// SHDSlider(minValue: 0, maxValue: 100, value: $volume)
/// ```
///
/// Slider with variation:
/// ```swift
/// SHDSlider(minValue: 0, maxValue: 100, value: $volume)
///     .sliderVariant(variant: .sm)
/// ```
public struct SHDSlider: View {
    @Binding var value: Double

    private var minValue: Int
    private var maxValue: Int
    private var size: SHDSliderSize = .md
    private var showMinMaxLabels: Bool

    public init(minValue: Int, maxValue: Int, showMinMaxLabels: Bool = true, value: Binding<Double>) {
        self.minValue = minValue
        self.maxValue = maxValue
        self.showMinMaxLabels = showMinMaxLabels
        _value = value
    }

    public var body: some View {
        HStack(alignment: .top, spacing: .lg) {
            if showMinMaxLabels {
                Text("\(minValue)")
                    .textStyle(size.textSize)
                    .foregroundStyle(.foregroundMuted)
            }

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

            if showMinMaxLabels {
                Text("\(maxValue)")
                    .textStyle(size.textSize)
                    .foregroundStyle(.foregroundMuted)
            }
        }
    }

    private func calculateWidth(_ totalWidth: CGFloat) -> CGFloat {
        let percentage = (value - Double(minValue)) / (Double(maxValue) - Double(minValue))
        return max(0, min(totalWidth, totalWidth * CGFloat(percentage)))
    }

    private func updateValue(_ position: CGFloat, width: CGFloat) {
        let percentage = max(0, min(1, position / width))
        value = Double(minValue) + percentage * Double(maxValue - minValue)
    }

    /// Applies a size variant to the slider.
    ///
    /// - Parameter size: The size configuration for the slider.
    /// - Returns: A view with the specified slider size applied.
    public func sliderSize(size: SHDSliderSize) -> some View {
        mutating(keyPath: \.size, value: size)
    }
}

#Preview {
    SHDSliderPreview()
}
