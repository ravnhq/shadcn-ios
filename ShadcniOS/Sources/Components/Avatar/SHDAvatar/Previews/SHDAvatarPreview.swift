//
//  SHDAvatarPreview.swift
//  ShadcniOS
//
//  Created by JoseAlvarez on 11/25/25.
//

import SwiftUI

internal struct SHDAvatarPreview: View {

    private let sizes: [SHDAvatarSize] = [.sm, .md, .lg]
    private let variants: [SHDAvatarVariant] = [.light, .filled, .outline]

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {

            ForEach(sizes, id: \.self) { size in

                VStack(alignment: .leading, spacing: 12) {

                    Text("Size: \(String(describing: size).uppercased())")
                        .font(.headline)

                    HStack(spacing: 20) {
                        ForEach(variants, id: \.self) { variant in
                            VStack(spacing: 8) {

                                Text("\(String(describing: variant))")
                                    .font(.caption)
                                    .foregroundColor(.secondary)

                                SHDAvatar(image: Image(systemName: "person"))
                                    .avatarStyle(size: size, variant: variant)

                                SHDAvatar(text: "RM")
                                    .avatarStyle(size: size, variant: variant)

                                SHDAvatar(icon: .notificationBellRing)
                                    .avatarStyle(size: size, variant: variant)

                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    SHDAvatarPreview()
}
