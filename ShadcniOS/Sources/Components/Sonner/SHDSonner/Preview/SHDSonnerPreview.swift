//
//  SHDSonnerPreview.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

struct SHDSonnerPreview: View {
    @State var isSonnerPresented: Bool = false

    var body: some View {
        VStack(spacing: .md) {
            SHDSonner(
                description: "Sunday, December 03,  2023 at 9:00 AM",
                title: "Event has been created"
            )
            .sonnerConfiguration(variant: .default, size: .sm)

            SHDSonner(
                description: "Sunday, December 03,  2023 at 9:00 AM",
                title: "Event has been created"
            )
            .sonnerConfiguration(variant: .destructive, size: .md)

            SHDSonner(
                description: "Sunday, December 03,  2023 at 9:00 AM",
                title: "Event has been created",
            )
            .sonnerConfiguration(variant: .warning, size: .md)

            SHDSonner(
                description: "Sunday, December 03,  2023 at 9:00 AM",
                title: "Event has been created"
            )
            .sonnerConfiguration(variant: .success, size: .lg)

            Button {
                isSonnerPresented.toggle()
            } label: {
                Text("Show sonner")
            }
        }
        .sonner(
            configuration: SHDSonnerConfiguration(
                title: "Event has been created",
                subtitle: "Sunday, December 03,  2023 at 9:00 AM"
            ),
            isPresented: $isSonnerPresented
        )
    }
}

#Preview {
    SHDSonnerPreview()
}
