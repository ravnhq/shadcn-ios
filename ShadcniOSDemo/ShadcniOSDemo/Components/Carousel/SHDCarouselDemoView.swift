//
//  SHDCarouselDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/8/25.
//

import ShadcniOS
import SwiftUI

struct CarouselText: SHDCarouselRepresentable {
    var id = UUID()
    var text: String

    var content: some View {
        HStack {
            Text(text)
                .font(.title2)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.secondary)
    }
}

struct CarouselNumber: SHDCarouselRepresentable {
    var id = UUID()
    var number: Int

    var content: some View {
        HStack {
            Text("\(number)")
                .font(.system(size: 40, weight: .bold))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.secondary)

    }
}

struct CarouselImage: SHDCarouselRepresentable {
    var id = UUID()
    var imageName: String

    var content: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.secondary)
    }
}

struct SHDCarouselDemoView: View {

    let textItems = [
        CarouselText(text: "Swift"), CarouselText(text: "Kotlin"),
        CarouselText(text: "Go"), CarouselText(text: "Rust"),
    ]
    let numberItems = [
        CarouselNumber(number: 1), CarouselNumber(number: 2),
        CarouselNumber(number: 3), CarouselNumber(number: 4),
        CarouselNumber(number: 5),
    ]
    let imageItems = [
        CarouselImage(imageName: "star"), CarouselImage(imageName: "heart"),
        CarouselImage(imageName: "paperplane"),
    ]

    @State private var layoutVariant: SHDCarouselLayout = .groupHorizontal(
        .oneToOne
    )

    enum DataType: String, CaseIterable, Identifiable {
        case text = "Text"
        case numbers = "Numbers"
        case images = "Images"

        var id: Self { self }
    }

    @State private var selectedType: DataType = .text

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                Picker("Data types", selection: $selectedType) {
                    ForEach(DataType.allCases) { type in
                        Text(type.rawValue).tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                Picker("Layout Variant", selection: $layoutVariant) {
                    Text("Group Horizontal 1:1")
                        .tag(SHDCarouselLayout.groupHorizontal(.oneToOne))

                    Text("Group Horizontal 3:4")
                        .tag(SHDCarouselLayout.groupHorizontal(.threeToFour))

                    Text("Group Horizontal 16:9")
                        .tag(SHDCarouselLayout.groupHorizontal(.sixteenToNine))

                    Text("Single Horizontal")
                        .tag(SHDCarouselLayout.singleHorizontal)

                    Text("Group Vertical")
                        .tag(SHDCarouselLayout.groupVertical)
                }
                .padding()

                Group {
                    switch selectedType {

                    case .text:
                        SHDCarousel(items: textItems)
                            .layoutVariant(layoutVariant)

                    case .numbers:
                        SHDCarousel(items: numberItems)
                            .layoutVariant(layoutVariant)

                    case .images:
                        SHDCarousel(items: imageItems)
                            .layoutVariant(layoutVariant)
                    }
                }
            }
            .navigationTitle("SHDCarousel")
            .padding(.top)
        }
    }
}

#Preview {
    SHDCarouselDemoView()
}
