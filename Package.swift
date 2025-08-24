// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-pretty-print",
    products: [
        .library(name: "PrettyPrint", targets: ["PrettyPrint"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.0")
    ],
    targets: [
        .target(name: "PrettyPrint"),
        .executableTarget(
            name: "pretty-print-cli",
            dependencies: [
                "PrettyPrint",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "PrettyPrintTests",
            dependencies: ["PrettyPrint"]
        )
    ]
)
