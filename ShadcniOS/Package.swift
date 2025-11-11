// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShadcniOS",
    platforms: [
        .iOS(.v26)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ShadcniOS",
            targets: ["ShadcniOS"]
        )
    ],
    dependencies: [
        // 👇 Add SwiftLint as a dependency
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.54.0")
    ],
    targets: [
        .target(
            name: "ShadcniOS",
            dependencies: [],
            resources: [.process("Resources")],
            // 👇 Attach the SwiftLint plugin
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")
            ]
        )
    ]
)
