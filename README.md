# apple-music-jwt
Library to generate JWT for Apple Music API.

# Getting Started

## Installation

### Swift Package Manager

To include AppleMusicJWT into a Swift Package Manger project add the `dependencies` value in your `Package.swift`:

```
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/robinlieb/apple-music-jwt.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "YourProject",
            dependencies: [
                .product(name: "AppleMusicJWT", package: "apple-music-jwt"),
            ]),
    ]
)
```

## Usage

You can use the AppleMusicJWT.generateToken(teamId:keyId:keyFileUrl:exp:) function to retrieve an optional String of the JWT. 

```swift
import AppleMusicJWT

let token = AppleMusicJWT().generateToken(teamId: "1A2B3C4D5E", keyId: "5E4D3C2B1A", keyFileUrl: "path/to/file", exp: 60)
```
