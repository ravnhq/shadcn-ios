//
//  SHDSonnerPreview.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

internal struct SHDSonnerPreview: View {
    var body: some View {
        SHDSonner(title: "Event has been created",
                  subtitle: "Sunday, December 03,  2023 at 9:00 AM")
    }
}

#Preview {
    SHDSonnerPreview()
}
