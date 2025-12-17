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
    private var size: SHDSonnerSize = .md
    private var variant: SHDSonnerVariant = .default

    public init(title: String, subtitle: String, icon: SHDIconAsset) {
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        HStack(alignment: .top , spacing: .sm) {
            SHDIcon(variant.icon)
                .iconSize(size.iconSize)
                .foregroundColor(variant.foregroundColor)
                .padding(.top, .xxxxs)

            VStack(alignment: .leading , spacing: .sm) {
                Text(title)
                    .foregroundStyle(.foregroundDefault)
                    .textStyle(size.textStyle)

                Text(subtitle)
                    .foregroundStyle(.foregroundMuted)
                    .textStyle(size.captionStyle)
            }

            Spacer()

        }
        .padding(.all, .sm)
        .backgroundColor(.backgroundDefault)
    }

    public func sonnerVariant(variant: SHDSonnerVariant, size: SHDSonnerSize) -> some View {
        mutating { sonner in
            sonner.variant = variant
            sonner.size = size
        }
    }
}

#Preview {
    SHDSonnerPreview()
}
