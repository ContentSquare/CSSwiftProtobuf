// swift-tools-version:5.7

import PackageDescription

let version = "1.28.2-pre"
let repo = "ContentSquare/CSSwiftProtobuf"
let checksum = "c0c0cd9dae4862d57cca2df1ee3dc20eaa37de016f031515b104b9f5a7385909"

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
            name: "CSSwiftProtobufWrapper",
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
