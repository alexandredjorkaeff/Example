// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "TodoListInterface",
    platforms: [.iOS("13.0")],
    products: [
        .library(
            name: "TodoListInterface",
            targets: ["TodoListInterface"]
        )
    ],
    dependencies: [
        .package(path: "../RouterServiceInterface")
    ],
    targets: [
        .target(
            name: "TodoListInterface",
            dependencies: [
                "RouterServiceInterface"
            ]
        )
    ]
)
