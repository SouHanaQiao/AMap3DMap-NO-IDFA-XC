// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AMap3DMap-NO-IDFA-XC",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AMap3DMap-NO-IDFA-XC",
            targets: ["AMap3DMap-NO-IDFA-XC"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .binaryTarget(name: "AMap3DMap-NO-IDFA-XC", url: "https://github.com/SouHanaQiao/AMap3DMap-NO-IDFA-XC/releases/download/9.6.2/AMap3DMap-NO-IDFA.zip", checksum: "2668ec37e1e1040d8b2b5425952596b716bd01ec0243f3728f84f163736f6d87"),
        .testTarget(
            name: "AMap3DMap-NO-IDFA-XCTests",
            dependencies: ["AMap3DMap-NO-IDFA-XC"]),
    ]
)
