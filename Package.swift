// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Minima",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "Minima", targets: ["Minima"]),
    ],
    targets: [
        .target(name: "Minima")
    ]
)
