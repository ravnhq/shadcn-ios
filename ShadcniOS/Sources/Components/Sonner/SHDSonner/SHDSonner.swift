//
//  SHDSonner.swift
//  ShadcniOS
//
//  Created by Diego Takaki on 12/15/25.
//

import SwiftUI

public struct SHDSonner: View {

    private var title: String
    private var subtitle: String

    public init(title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading , spacing: .sm) {
                Text(title)
                    .textStyle(.textBaseSemibold)

                Text(subtitle)
                    .foregroundStyle(.foregroundMuted)
                    .textStyle(.textBaseRegular)
            }

            Spacer()

        }
        .padding(.all, .sm)
        .backgroundColor(.backgroundDefault)
    }
}

#Preview {
    SHDSonnerPreview()
}
