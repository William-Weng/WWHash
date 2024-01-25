// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWHash",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWHash", targets: ["WWHash"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "WWHash", dependencies: []),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
