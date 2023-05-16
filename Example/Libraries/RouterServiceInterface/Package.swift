// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "RouterServiceInterface",
    platforms: [.iOS("13.0")],
    products: [
        .library(
            name: "RouterServiceInterface",
            targets: ["RouterServiceInterface"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "RouterServiceInterface",
            dependencies: []
        )
    ]
)
