// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "TodoList",
    platforms: [.iOS("13.0")],
    products: [
        .library(
            name: "TodoList",
            targets: ["TodoList"]
        )
    ],
    dependencies: [
        .package(path: "../LegacyInterface"),
        .package(path: "../TodoListInterface"),
        .package(path: "../RouterServiceInterface")
    ],
    targets: [
        .target(
            name: "TodoList",
            dependencies: [
                "LegacyInterface",
                "TodoListInterface",
                "RouterServiceInterface"
            ]
        ),
        .testTarget(
            name: "TodoListTests",
            dependencies: [
                "LegacyInterface",
                "TodoList"
            ]
        )
    ]
)
