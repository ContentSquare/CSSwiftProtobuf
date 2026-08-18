// swift-tools-version:5.7

import PackageDescription

let version = "1.33.3-99"
let repo = "ContentSquare/CSSwiftProtobuf"
let checksum = "fa29c5a00f5125ef2f65d2b34cd5f0aa624aae0e11230117776f8c324a70fa79"

let binaryTarget : Target

if repo.isEmpty || checksum.isEmpty || version.isEmpty {
    binaryTarget = .binaryTarget(
        name: "CSSwiftProtobufBinary",
        path: "CSSwiftProtobuf.xcframework"
    )
} else {
    binaryTarget = .binaryTarget(
        name: "CSSwiftProtobufBinary",
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
            dependencies: ["CSSwiftProtobufBinary"]
        )
    ],
    swiftLanguageVersions: [.v5]
)
