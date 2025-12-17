//
//  SHDCarouselDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/8/25.
//

import ShadcniOS
import SwiftUI

struct SHDCarouselDemoView: View {
    
    let textItems: [String] = ["Swift", "Kotlin", "Go", "Rust"]
    let numberItems: [Int] = [1, 2, 3, 4, 5]
    let imageItems: [String] = ["star", "heart", "paperplane"]

    @State private var layoutVariant: SHDCarouselLayout = .groupHorizonal(.oneToOne)

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
                        .tag(SHDCarouselLayout.groupHorizonal(.oneToOne))

                    Text("Group Horizontal 3:4")
                        .tag(SHDCarouselLayout.groupHorizonal(.threeToFour))

                    Text("Group Horizontal 16:9")
                        .tag(SHDCarouselLayout.groupHorizonal(.sixteenToNine))

                    Text("Single Horizontal")
                        .tag(SHDCarouselLayout.singleHorizonal)

                    Text("Group Vertical")
                        .tag(SHDCarouselLayout.groupVertical)
                }
                .padding()
                
                Group {
                    switch selectedType {
                        
                    case .text:
                        SHDCarousel(items: textItems) { item in
                            HStack {
                                Text(item)
                                    .font(.title2)
                                    .padding()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.secondary)
                        }
                        .carouselLayoutVariant(layoutVariant)
                        
                    case .numbers:
                        SHDCarousel(items: numberItems) { item in
                            HStack {
                                Text("\(item)")
                                    .font(.system(size: 40, weight: .bold))
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.secondary)
                            
                        }
                        .carouselLayoutVariant(layoutVariant)
                        
                    case .images:
                        SHDCarousel(items: imageItems) { item in
                            HStack {
                                Image(systemName: item)
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.secondary)
                        }
                        .carouselLayoutVariant(layoutVariant)
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
