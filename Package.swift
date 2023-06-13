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
            targets: [ "AMap3DMap-NO-IDFA-XC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SouHanaQiao/AMapFoundation-NO-IDFA-XC", from: "1.8.3")
    ],
    targets: [
        .binaryTarget(name: "AMap3DMap-NO-IDFA", url: "https://github.com/SouHanaQiao/AMap3DMap-NO-IDFA-XC/releases/download/9.7.0/AMap3DMap-NO-IDFA.zip", checksum: "7ae49c8dc6cfa8ebafaa880d5a46d313cc542e6b57c56c76f52f172bc0b1fda7"),
//        .binaryTarget(name: "AMap3DMap-NO-IDFA", path: "./output/AMap3DMap-NO-IDFA/MAMapKit.xcframework"),
        .target(name: "AMap3DMap-NO-IDFA-XC", dependencies: [
            .product(name: "AMapFoundation-NO-IDFA-XC", package: "AMapFoundation-NO-IDFA-XC"),
            .target(name: "AMap3DMap-NO-IDFA")
        ], exclude: [
            "Resources"
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
