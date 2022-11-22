// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "soto-codegenerator-plugin-test",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        .package(url: "https://github.com/soto-project/soto-codegenerator", branch: "feature/plugin"),
        .package(url: "https://github.com/soto-project/soto-core.git", from: "6.0.0")
    ],
    targets: [
        .executableTarget(
            name: "PluginTest",
            dependencies: [
                "SotoS3",
                .product(name: "SotoCore", package: "soto-core")
            ]
        ),
        .target(
            name: "SotoS3",
            dependencies: [.product(name: "SotoCore", package: "soto-core")],
            plugins: [.plugin(name: "SotoCodeGeneratorPlugin", package: "soto-codegenerator")]
        )
    ]
)
