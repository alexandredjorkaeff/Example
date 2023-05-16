// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "LegacyInterface",
    platforms: [.iOS("13.0")],
    products: [
        .library(
            name: "LegacyInterface",
            targets: ["LegacyInterface"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "LegacyInterface",
            dependencies: []
        )
    ]
)
