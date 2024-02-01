<p align="center">
<img src="https://raw.githubusercontent.com/playbook-ui/mediakit/master/logo/default-h%402x.png" alt="Playbook" width="400">
</p>

# PlaybookAccessibilitySnapshot

<a href="https://developer.apple.com/swift"><img alt="Swift5" src="https://img.shields.io/badge/language-Swift5-orange.svg"/></a>
<a href="https://github.com/playbook-ui/accessibility-snapshot-ios/actions"><img alt="CI Status" src="https://github.com/playbook-ui/accessibility-snapshot-ios/workflows/GitHub%20Actions/badge.svg"/></a>
<a href="LICENSE"><img alt="Lincense" src="http://img.shields.io/badge/License-Apache%202.0-black.svg"/></a>
<br>
<a href="https://github.com/playbook-ui/accessibility-snapshot-ios/releases/latest"><img alt="Release" src="https://img.shields.io/github/v/release/playbook-ui/accessibility-snapshot-ios.svg"/></a>
<a href="https://swift.org/package-manager"><img alt="Swift Package Manager" src="https://img.shields.io/badge/SwiftPM-compatible-yellowgreen.svg"/></a>

`PlaybookAccessibilitySnapshot` is an extension to [Playbook](https://github.com/playbook-ui/playbook-ios) that uses [AccessibilitySnapshot](https://github.com/cashapp/AccessibilitySnapshot) to produce snapshots with accessibility information such as activation points and labels.

---

## Usage

- [API Document](https://playbook-ui.github.io/accessibility-snapshot-ios/documentation/playbookaccessibilitysnapshot)
- [Example App](https://github.com/playbook-ui/accessibility-snapshot-ios/tree/main/Example)

---

### AccessibilitySnapshot

```swift
final class AccessibilitySnapshotTests: XCTestCase {
    func testTakeAccessibilitySnapshot() throws {
        let directory = ProcessInfo.processInfo.environment["SNAPSHOT_DIR"]!

        try Playbook.default.run(
            AccessibilitySnapshot(
                directory: URL(fileURLWithPath: directory),
                clean: true,
                format: .png,
                keyWindow: UIApplication.shared.windows.first { $0.isKeyWindow },
                devices: [.iPhone11Pro(.portrait)]
            )
        )
    }
}
```

<img src="https://raw.githubusercontent.com/playbook-ui/accessibility-snapshot-ios/main/assets/snapshot.png" alt="snapshot">

|Sample|Before|After|
|:-----|:-----|:----|
|<img src="https://raw.githubusercontent.com/playbook-ui/accessibility-snapshot-ios/main/assets/sample.png" alt="sample">|<img src="https://raw.githubusercontent.com/playbook-ui/accessibility-snapshot-ios/main/assets/sample-before.png" alt="before">|<img src="https://raw.githubusercontent.com/playbook-ui/accessibility-snapshot-ios/main/assets/sample-after.png" alt="after">|

---

### Integration with Third-party Tools

The generated snapshot images with accessibility information can be used for more advanced visual regression testing by using a variety of third party tools.  

#### [percy](https://percy.io)

<img src="https://raw.githubusercontent.com/playbook-ui/accessibility-snapshot-ios/main/assets/percy.png" alt="percy" width="600">

---

## Requirements

- Swift 5.9+
- Xcode 15.0+
- iOS 13.0+

---

## Installation

### [Swift Package Manager](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

Select Xcode menu `File > Swift Packages > Add Package Dependency...` and enter repository URL with GUI.

```
Repository: https://github.com/playbook-ui/accessibility-snapshot-ios.git
```

---

## Development

1. Run `make proj` at the root of this repository.
1. Open `Example/Example.xcworkspace` via Xcode.

---

## License

Playbook is released under the [Apache 2.0 License](https://github.com/playbook-ui/accessibility-snapshot-ios/tree/main/LICENSE).

<br>
<p align="center">
<img alt="Playbook" src="https://raw.githubusercontent.com/playbook-ui/mediakit/master/logo/default%402x.png" width="280">
</p>
