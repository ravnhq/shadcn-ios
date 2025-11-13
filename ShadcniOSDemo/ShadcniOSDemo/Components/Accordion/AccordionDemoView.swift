//
//  AccordionDemoView.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 11/13/25.
//

import ShadcniOS
import SwiftUI

// MARK: - Sample Model
struct GameInfo: SHDAccordionRepresentable {
    var title: String
    var content: String
}

// MARK: - Mapping of sizes
enum AccordionSize: String, CaseIterable, Identifiable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"

    var id: String { rawValue }

    var shdSize: SHDAccordionSize {
        switch self {
        case .small: return .sm
        case .medium: return .md
        case .large: return .lg
        }
    }
}

// MARK: - Accordion Demo View
struct AccordionDemoView: View {

    @State private var selectedSize: AccordionSize = .medium

    let gameSections: [GameInfo] = [
        GameInfo(
            title: "Gameplay",
            content: """
                Explore vast worlds, complete quests, and defeat enemies with a variety of skills and weapons. \
                Each decision affects the story and the environment, offering multiple endings.
                """
        ),
        GameInfo(
            title: "Characters",
            content: """
                Meet diverse characters, each with unique abilities and backstories. \
                Build relationships to unlock secret missions and bonus rewards.
                """
        ),
        GameInfo(
            title: "Tips & Tricks",
            content: """
                Use stealth to avoid difficult fights, upgrade your equipment regularly, \
                and explore every corner to find hidden treasures.
                """
        ),
        GameInfo(
            title: "Patch Notes",
            content: """
                Version 1.2: Added new maps, improved AI behavior, and fixed several bugs related to multiplayer.
                Version 1.1: Introduced seasonal events and new character skins.
                """
        ),
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Select the size via Picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("Select Accordion Size")
                        .font(.headline)
                    Picker("Accordion Size", selection: $selectedSize) {
                        ForEach(AccordionSize.allCases) { size in
                            Text(size.rawValue).tag(size)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(.horizontal, 16)

                // Dynamic accordion based in the selection
                VStack(alignment: .leading, spacing: 12) {
                    Text("Game Info - \(selectedSize.rawValue)")
                        .font(.headline)
                    SHDAccordion(items: gameSections)
                        .accordionStyle(size: selectedSize.shdSize)
                        .padding(.horizontal, 16)
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Game Info Accordion")
    }
}
