
// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PlaybookAccessibilitySnapshot",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "PlaybookAccessibilitySnapshot", targets: ["PlaybookAccessibilitySnapshot"]),
    ],
    dependencies: [
        .package(
            name: "Playbook",
            url: "https://github.com/playbook-ui/playbook-ios.git",
            .upToNextMinor(from: "0.3.0")
        ),
        .package(
            name: "AccessibilitySnapshot",
            url: "https://github.com/cashapp/AccessibilitySnapshot.git",
            .upToNextMinor(from: "0.5.0")
        ),
    ],
    targets: [
        .target(
            name: "PlaybookAccessibilitySnapshot",
            dependencies: [
                .product(name: "PlaybookSnapshot", package: "Playbook"),
                .product(name: "AccessibilitySnapshotCore", package: "AccessibilitySnapshot"),
            ],
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
