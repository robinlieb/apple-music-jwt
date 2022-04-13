// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "apple-music-jwt",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppleMusicJWT",
            targets: ["AppleMusicJWT"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Kitura/Swift-JWT.git", from: "3.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AppleMusicJWT",
            dependencies: [
                .product(name: "SwiftJWT", package: "Swift-JWT"),
            ]),
        .testTarget(
            name: "AppleMusicJWTTests",
            dependencies: ["AppleMusicJWT"],
            resources: [
                .copy("ec256_key"),
                .copy("rsa_key"),
            ]),
    ]
)
