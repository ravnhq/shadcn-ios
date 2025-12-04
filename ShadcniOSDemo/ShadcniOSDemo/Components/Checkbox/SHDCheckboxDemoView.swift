//
//  SHDCheckboxDemoView.swift
//  ShadcniOSDemo
//
//  Created by Concepción Orellana on 12/4/25.
//

import SwiftUI
import ShadcniOS

// MARK: - Demo Checkbox
struct SHDCheckboxDemoView: View {
    @State private var isChecked = false
    @State private var isDisabled: Bool = false

    var body: some View {
        ScrollView {
            SHDCheckbox(
                label: "Accept terms and conditions",
                description: "You agree to our Terms of Service and Privacy Policy."
            )
        }
        .navigationTitle("SHDCheckbox")
    }

    // MARK: - Checkbox Preview
    @ViewBuilder
    private var demoButton: some View {

        }
    }

#Preview {
    SHDCheckboxDemoView()
}
