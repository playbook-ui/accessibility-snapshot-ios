# PlaybookAccessibility

<a href="https://developer.apple.com/swift"><img alt="Swift5" src="https://img.shields.io/badge/language-Swift5-orange.svg"/></a>
<a href="LICENSE"><img alt="Lincense" src="http://img.shields.io/badge/License-Apache%202.0-black.svg"/></a>
<br>

`PlaybookAccessibility` is an extension to [Playbook](https://github.com/playbook-ui/playbook-ios) that uses [AccessibilitySnapshot](https://github.com/cashapp/AccessibilitySnapshot) to produce snapshots with accessibility information such as activation points and labels.

---

## Usage

- [API Document](https://playbook-ui.github.io/playbook-ios)
- [Example App](https://github.com/playbook-ui/playbook-ios/tree/master/Example)

---

### PlaybookAccessibilitySnapshot


```swift
final class AccessibilitySnapshotTests: XCTestCase {
    func testTakeAccessibilitySnapshot() throws {
        let directory = ProcessInfo.processInfo.environment["SNAPSHOT_DIR"]!

        try Playbook.default.run(
            PlaybookAccessibilitySnapshot(
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

<img src="https://raw.githubusercontent.com/jiayi-zhou/playbook-accessibility-ios/main/assets/accessibility-snapshot.png" alt="accessibility snapshot">

---

## Requirements

- Swift 5.1+
- Xcode 11.0+
- iOS
  - `PlaybookAccessibility`: 12.0+
  
---

## Installation
### [CocoaPods](https://cocoapods.org)

Add the following to your `Podfile`:

```ruby
target 'YourPlaybook' do
  pod 'Playbook'
  pod 'PlaybookUI'

  target 'YourPlaybookTests' do
    inherit! :search_paths

    pod 'PlaybookAccessibility'
  end
end
```

---

## License

Playbook is released under the [Apache 2.0 License](https://github.com/playbook-ui/playbook-ios/tree/master/LICENSE).

<br>
<p align="center">
<img alt="Playbook" src="https://raw.githubusercontent.com/playbook-ui/playbook-ios/master/assets/footer-logo.png" width="280">
</p>
