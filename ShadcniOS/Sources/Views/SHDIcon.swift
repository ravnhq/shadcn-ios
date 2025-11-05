//
//  SHDIcon.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/5/25.
//

import SwiftUI

public struct SHDIcon: View {
    private let icon: SHDIconAssets
    private let renderingMode: Image.TemplateRenderingMode
    private let size: CGFloat?

    public init(
        _ icon: SHDIconAssets,
        renderingMode: Image.TemplateRenderingMode = .template,
        size: CGFloat? = 24
    ) {
        self.icon = icon
        self.renderingMode = renderingMode
        self.size = size
    }

    public var body: some View {
        Image(icon.rawValue, bundle: .module)
            .resizable()
            .renderingMode(renderingMode)
            .aspectRatio(contentMode: .fit)
            .flipsForRightToLeftLayoutDirection(true)
            .frame(width: size, height: size)
    }
}
