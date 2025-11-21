// swift-tools-version:5.7

import PackageDescription

let version = "1.33.3"
let repo = "ContentSquare/CSSwiftProtobuf"
let checksum = "444a2475cd2fd43aa5288eb60bbc3f5d663cc8acd97c9633525f16c1dd94ce4e"

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
