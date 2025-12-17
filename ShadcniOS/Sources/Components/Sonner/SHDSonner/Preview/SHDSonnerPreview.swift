//
//  SHDSonnerPreview.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

internal struct SHDSonnerPreview: View {
    var body: some View {
        VStack(spacing: .md) {
            SHDSonner(title: "Event has been created",
                      subtitle: "Sunday, December 03,  2023 at 9:00 AM",
                      icon: .codingDevelopmentTerminal)
            .sonnerVariant(variant: .default, size: .sm)

            SHDSonner(title: "Event has been created",
                      subtitle: "Sunday, December 03,  2023 at 9:00 AM",
                      icon: .notificationBellPlus)
            .sonnerVariant(variant: .destructive, size: .md)
            
            SHDSonner(title: "Event has been created",
                      subtitle: "Sunday, December 03,  2023 at 9:00 AM",
                      icon: .notificationBellPlus)
            .sonnerVariant(variant: .warning, size: .md)
            
            SHDSonner(title: "Event has been created",
                      subtitle: "Sunday, December 03,  2023 at 9:00 AM",
                      icon: .notificationBellPlus)
            .sonnerVariant(variant: .success, size: .lg)
            
        }
    }
}

#Preview {
    SHDSonnerPreview()
}
