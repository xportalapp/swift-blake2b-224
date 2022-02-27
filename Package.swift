// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Blake2b",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Blake2b",
            targets: ["Blake2b"]),
    ],
    targets: [
        .target(
            name: "Blake2b",
            dependencies: ["Blake2bC"]),
        .target(
            name: "Blake2bC"),
        .testTarget(
            name: "Blake2bTests",
            dependencies: ["Blake2b"])
    ]
)
