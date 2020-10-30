import PlaybookAccessibilitySnapshot
import XCTest

@testable import SampleApp

public final class AccessibilitySnapshotTests: XCTestCase {
    public func testTakeSnapshot() throws {
        guard let directory = ProcessInfo.processInfo.environment["SNAPSHOT_DIR"] else {
            fatalError("Set directory to the build environment variables with key `SNAPSHOT_DIR`.")
        }

        Playbook.default.add(AllScenarios.self)

        try Playbook.default.run(
            AccessibilitySnapshot(
                directory: URL(fileURLWithPath: directory),
                clean: true,
                format: .png,
                scale: 1,
                keyWindow: UIApplication.shared.windows.first { $0.isKeyWindow },
                devices: [.iPhone11Pro(.portrait)]
            )
        )
    }
}
