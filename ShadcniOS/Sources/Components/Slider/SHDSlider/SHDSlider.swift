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
/// - Visual feedback with a filled track and draggable thumb
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
///
/// These are configured through the `SHDSliderSize` enum and applied via the
/// `.sliderVariant(variant:)` modifier.
///
/// Layout rules:
/// - The slider expands to fill available horizontal space
/// - Height is determined by the selected size variant
/// - The thumb is centered vertically on the track
/// - The filled track grows from left to right based on the current value
///
/// Creates a ShadcniOS slider.
///
/// - Parameters:
///   - minValue: The minimum value of the slider range.
///   - maxValue: The maximum value of the slider range.
///   - value: A binding to the current slider value.
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
/// SHDSlider(minValue: 0, maxValue: 100, value: $humidity)
///     .sliderVariant(variant: .sm)
/// ```
public struct SHDSlider: View {
    @Binding var value: Double

    private var size: SHDSliderSize = .md
    private var minValue: Int
    private var maxValue: Int

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

    /// Applies a size variant to the slider.
    ///
    /// - Parameter variant: The size configuration for the slider.
    /// - Returns: A view with the specified slider size applied.
    public func sliderVariant(variant: SHDSliderSize) -> some View {
        mutating(keyPath: \.size, value: variant)
    }
}

#Preview {
    SHDSliderPreview()
}
