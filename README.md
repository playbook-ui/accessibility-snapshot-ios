<p align="center">
<img src="https://raw.githubusercontent.com/playbook-ui/mediakit/master/logo/default-h%402x.png" alt="Playbook" width="400">
</p>


# PlaybookAccessibilitySnapshot

<a href="https://developer.apple.com/swift"><img alt="Swift5" src="https://img.shields.io/badge/language-Swift5-orange.svg"/></a>
<a href="https://github.com/playbook-ui/accessibility-snapshot-ios/actions"><img alt="CI Status" src="https://github.com/playbook-ui/accessibility-snapshot-ios/workflows/GitHub%20Actions/badge.svg"/></a>
<a href="LICENSE"><img alt="Lincense" src="http://img.shields.io/badge/License-Apache%202.0-black.svg"/></a>
<br>
<a href="https://github.com/playbook-ui/accessibility-snapshot-ios/releases/latest"><img alt="Release" src="https://img.shields.io/github/v/release/playbook-ui/accessibility-snapshot-ios.svg"/></a>
<a href="https://cocoapods.org/pods/PlaybookAccessibilitySnapshot"><img alt="CocoaPods" src="https://img.shields.io/cocoapods/v/PlaybookAccessibilitySnapshot.svg"/></a>

`PlaybookAccessibilitySnapshot` is an extension to [Playbook](https://github.com/playbook-ui/playbook-ios) that uses [AccessibilitySnapshot](https://github.com/cashapp/AccessibilitySnapshot) to produce snapshots with accessibility information such as activation points and labels.

---

## Usage

- [API Document](https://playbook-ui.github.io/accessibility-snapshot-ios)
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

- Swift 5.3+
- Xcode 12.2+
- iOS 12.0+

---

## Installation

### [CocoaPods](https://cocoapods.org)

Add the following to your `Podfile`:

```ruby
target 'YourPlaybook' do
  pod 'Playbook'

  target 'YourPlaybookTests' do
    inherit! :search_paths

    pod 'PlaybookAccessibilitySnapshot'
  end
end
```

---

## Development

1. Run `make proj` at the root of this repository.
1. Open `Example/Example.xcworkspace` via Xcode.
1. Develop a PlaybookAccessibilitySnapshot installed as a development pods.

---

## License

Playbook is released under the [Apache 2.0 License](https://github.com/playbook-ui/accessibility-snapshot-ios/tree/main/LICENSE).

<br>
<p align="center">
<img alt="Playbook" src="https://raw.githubusercontent.com/playbook-ui/mediakit/master/logo/default%402x.png" width="280">
</p>
