//
//  SHDAvatarDemo.swift
//  ShadcniOSDemo
//
//  Created by JoseAlvarez on 11/25/25.
//

import ShadcniOS
import SwiftUI

struct SHDAvatarDemo: View {

    @State private var size: SHDAvatarSize = .md
    @State private var variant: SHDAvatarVariant = .filled

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {

                // MARK: - Controls
                VStack(alignment: .leading, spacing: 16) {
                    Text("Configuration")
                        .font(.headline)

                    HStack(spacing: 20) {
                        Picker("Size", selection: $size) {
                            Text("Small").tag(SHDAvatarSize.sm)
                            Text("Medium").tag(SHDAvatarSize.md)
                            Text("Large").tag(SHDAvatarSize.lg)
                        }
                        .pickerStyle(.menu)

                        Picker("Variant", selection: $variant) {
                            Text("Light").tag(SHDAvatarVariant.light)
                            Text("Filled").tag(SHDAvatarVariant.filled)
                            Text("Outline").tag(SHDAvatarVariant.outline)
                        }
                        .pickerStyle(.menu)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)

                // MARK: - Preview
                VStack(alignment: .leading, spacing: 24) {
                    Text("Preview")
                        .font(.headline)

                    HStack(spacing: 48) {

                        VStack(spacing: 8) {
                            Text("Image")
                                .font(.subheadline)

                            SHDAvatar(image: Image(systemName: "person.fill"))
                                .shdAvatarStyle(size: size, variant: variant)

                        }

                        VStack(spacing: 8) {
                            Text("Icon")
                                .font(.subheadline)

                            SHDAvatar(icon: .notificationCheckCheck)
                                .shdAvatarStyle(size: size, variant: variant)

                        }

                        VStack(spacing: 8) {
                            Text("Initials")
                                .font(.subheadline)

                            SHDAvatar(text: "AM")
                                .shdAvatarStyle(size: size, variant: variant)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
        }
        .navigationTitle("SHDAvatar")
    }
}

#Preview {
    NavigationStack {
        SHDAvatarDemo()
    }
}
