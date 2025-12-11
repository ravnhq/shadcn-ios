//
//  SHDCarouselDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 12/8/25.
//

import ShadcniOS
import SwiftUI

struct SHDCarouselDemoView: View {
    
    // MARK: - Data sets
    let textItems: [String] = ["Swift", "Kotlin", "Go", "Rust"]
    let numberItems: [Int] = [1, 2, 3, 4, 5]
    let imageItems: [String] = ["star", "heart", "paperplane"]

    @State var layoutVariant: SHDCarouselLayoutVariant = .groupHorizonal
    @State var proportionVariant: SHDCarouselProportionVariant = .oneToOne

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
                
                HStack {
                    Text("Layout Variant")
                    
                    Spacer()
                    
                    Picker("Layout Variant", selection: $layoutVariant) {
                        Text("Group Horizontal").tag(SHDCarouselLayoutVariant.groupHorizonal)
                        Text("Single Horizontal").tag(SHDCarouselLayoutVariant.singleHorizonal)
                        Text("Group Vertical").tag(SHDCarouselLayoutVariant.groupVertical)
                    }
                }
                .padding()
                
                HStack {
                    Text("Proportion Variant")
                    
                    Spacer()
                    
                    Picker("Layout Variant", selection: $proportionVariant) {
                        Text("1:1").tag(SHDCarouselProportionVariant.oneToOne)
                        Text("3:4").tag(SHDCarouselProportionVariant.threeToFour)
                        Text("16:9").tag(SHDCarouselProportionVariant.sixteenToNine)
                    }
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
                        .carouselProportionVariant(proportionVariant)
                        
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
                        .carouselProportionVariant(proportionVariant)
                        
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
                        .carouselProportionVariant(proportionVariant)
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
