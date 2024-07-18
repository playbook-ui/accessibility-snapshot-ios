
// swift-tools-version:5.9

import Foundation
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
            url: "https://github.com/playbook-ui/playbook-ios.git",
            .upToNextMinor(from: "0.4.1")
        ),
        .package(
            url: "https://github.com/cashapp/AccessibilitySnapshot.git",
            .upToNextMinor(from: "0.7.0")
        ),
    ],
    targets: [
        .target(
            name: "PlaybookAccessibilitySnapshot",
            dependencies: [
                .product(name: "PlaybookSnapshot", package: "playbook-ios"),
                .product(name: "AccessibilitySnapshotCore", package: "AccessibilitySnapshot"),
            ],
            path: "Sources"
        ),
    ],
    swiftLanguageVersions: [.v5]
)

if ProcessInfo.processInfo.environment["PLAYBOOK_DEVELOPMENT"] != nil {
    package.dependencies.append(contentsOf: [
        .package(url: "https://github.com/apple/swift-format.git", exact: "509.0.0"),
        .package(url: "https://github.com/yonaskolb/XcodeGen.git", exact: "2.38.0"),
    ])
}
