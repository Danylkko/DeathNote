// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "DeathNote",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "DeathNote",
            targets: ["DeathNote"]),
    ],
    dependencies: [
        // List your dependencies here, for example:
        // .package(url: "https://github.com/AnotherFramework.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "DeathNote",
            dependencies: [],
            path: "DeathNote/Sources"
        ),
    ]
)

