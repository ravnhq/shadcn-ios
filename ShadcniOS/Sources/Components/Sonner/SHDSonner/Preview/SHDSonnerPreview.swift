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
            SHDSonner(title: "Event has been created",
                      subtitle: "Sunday, December 03,  2023 at 9:00 AM")
                .sonnerVariant(variant: .default, size: .sm)

            SHDSonner(title: "Event has been created",
                      subtitle: "Sunday, December 03,  2023 at 9:00 AM")
                .sonnerVariant(variant: .destructive, size: .md)

            SHDSonner(title: "Event has been created",
                      subtitle: "Sunday, December 03,  2023 at 9:00 AM")
                .sonnerVariant(variant: .warning, size: .md)

            SHDSonner(title: "Event has been created",
                      subtitle: "Sunday, December 03,  2023 at 9:00 AM")
                .sonnerVariant(variant: .success, size: .lg)

            Button {
                isSonnerPresented.toggle()
            } label: {
                Text("Show sonner")
            }
        }
        .showSonner(title: "Event has been created",
                    caption: "Sunday, December 03,  2023 at 9:00 AM",
                    isPresented: $isSonnerPresented)
    }
}

#Preview {
    SHDSonnerPreview()
}
