// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "RouterService",
    platforms: [.iOS("13.0")],
    products: [
        .library(
            name: "RouterService",
            targets: ["RouterService"]
        )
    ],
    dependencies: [
        .package(path: "../RouterServiceInterface")
    ],
    targets: [
        .target(
            name: "RouterService",
            dependencies: [
                "RouterServiceInterface"
            ]
        )
    ]
)
