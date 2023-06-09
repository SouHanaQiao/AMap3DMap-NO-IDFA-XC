// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AMap3DMap-NO-IDFA-XC",
    platforms: [
      .iOS(.v11),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AMap3DMap-NO-IDFA-XC",
            targets: [ "AMap3DMap-NO-IDFA-XC"])
    ],
    dependencies: [
        .package(url: "https://github.com/SouHanaQiao/AMapFoundation-NO-IDFA-XC", from: "1.8.2")
    ],
    targets: [
        .binaryTarget(name: "AMap3DMap-NO-IDFA", url: "https://github.com/SouHanaQiao/AMap3DMap-NO-IDFA-XC/releases/download/9.7.0/AMap3DMap-NO-IDFA.zip", checksum: "9532b5220ca264c48cbfd90b2a7ccf636f461aedb7efe9eba4e34a901a6a4061"),
        .target(name: "AMap3DMap-NO-IDFA-XC", dependencies: [
            .product(name: "AMapFoundation-NO-IDFA-XC", package: "AMapFoundation-NO-IDFA-XC"),
            .target(name: "AMap3DMap-NO-IDFA")
        ], linkerSettings: [
            .linkedFramework("CFNetwork"),
            .linkedFramework("SystemConfiguration"),
            .linkedFramework("QuartzCore"),
            .linkedFramework("CoreGraphics"),
            .linkedFramework("CoreMotion"),
            .linkedFramework("CoreTelephony"),
            .linkedFramework("GLKit"),
            .linkedLibrary("c++"),
            .linkedLibrary("z")
        ]),
        .testTarget(
            name: "AMap3DMap-NO-IDFA-XCTests",
            dependencies: ["AMap3DMap-NO-IDFA-XC"]),
    ],
    swiftLanguageVersions: [.v5]
)
