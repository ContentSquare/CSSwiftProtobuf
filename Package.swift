// swift-tools-version:5.7

import PackageDescription

let version = "1.26.0"
let repo = "ContentSquare/CSSwiftProtobuf"
let checksum = "6e2b51ecb5dde287208f26d6b151c567598619cdc8e2445ac5f4367b530a7a8f"

let binaryTarget : Target

if repo.isEmpty || checksum.isEmpty || version.isEmpty {
    binaryTarget = .binaryTarget(
        name: "CSSwiftProtobuf",
        path: "CSSwiftProtobuf.xcframework"
    )
} else {
    binaryTarget = .binaryTarget(
        name: "CSSwiftProtobuf",
        url: "https://github.com/\(repo)/releases/download/\(version)/package.zip",
        checksum: checksum
    )
}

let package = Package(
    name: "CSSwiftProtobuf",
    platforms: [
        .macOS(.v11),
        .iOS(.v12),
        .watchOS(.v5),
        .tvOS(.v12),
    ],
    products: [
        .library(
            name: "CSSwiftProtobuf",
            targets: ["CSSwiftProtobufWrapper"]
        ),
    ],
    targets: [
        binaryTarget,
        .target(
            name: "CSSwiftProtobufWrapper",
            dependencies: ["CSSwiftProtobuf"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
