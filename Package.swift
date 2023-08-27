// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "soto-codegenerator-plugin-test",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        .package(url: "https://github.com/soto-project/soto-codegenerator", from: "0.8.0"),
        .package(url: "https://github.com/soto-project/soto-core.git", from: "6.5.0")
    ],
    targets: [
        .executableTarget(
            name: "SNSTest",
            dependencies: [
                "SotoSNS",
                .product(name: "SotoCore", package: "soto-core")
            ]
        ),
        .target(
            name: "SotoSNS",
            dependencies: [.product(name: "SotoCore", package: "soto-core")],
            plugins: [.plugin(name: "SotoCodeGeneratorPlugin", package: "soto-codegenerator")]
        )
    ]
)
