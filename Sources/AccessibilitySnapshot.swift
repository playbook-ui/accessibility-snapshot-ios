import PlaybookSnapshot
import UIKit

#if SWIFT_PACKAGE
import AccessibilitySnapshotCore
#else
import AccessibilitySnapshot
#endif

/// The testing tool which generates snapshot images from scenarios managed by `Playbook`.
public struct AccessibilitySnapshot: TestTool {
    private let snapshot: Snapshot

    /// Creates a new snapshot tool for export all image files with accessibility tags into specified directory.
    ///
    /// - Parameters:
    ///   - directory: A base directory for exporting snapshot image files.
    ///   - clean: Specifies whether to clean directory before generating snapshots.
    ///   - format: An image file format of exported data.
    ///   - timeout: A timeout interval until the finish snapshot of all scenarios.
    ///   - scale: A rendering scale of the snapshot image.
    ///   - keyWindow: The key window of the application.
    ///   - devices: A set of snapshot environment simulating devices.
    public init(
        directory: URL,
        clean: Bool = false,
        format: SnapshotSupport.ImageFormat,
        timeout: TimeInterval = 600,
        scale: CGFloat = UIScreen.main.scale,
        keyWindow: UIWindow? = nil,
        devices: [SnapshotDevice]
    ) {
        snapshot = Snapshot(
            directory: directory,
            clean: clean,
            format: format,
            timeout: timeout,
            scale: scale,
            keyWindow: keyWindow,
            devices: devices,
            viewPreprocessor: { view in
                // Use view.superview due to layout issues with SnapshotWindow.contentView
                let accessibilityView = AccessibilitySnapshotView(
                    containedView: view.superview ?? view,
                    viewRenderingMode: .renderLayerInContext,
                    activationPointDisplayMode: .always,
                    showUserInputLabels: true
                )

                // Ignoring the error thrown by the parse function. It will be handled correctly
                // once `PlaybookSnapshot` supports `viewPreprocessor` parameter to throw an error.
                try? accessibilityView.parseAccessibility(useMonochromeSnapshot: false)
                accessibilityView.sizeToFit()
                return accessibilityView
            }
        )
    }

    /// Generates snapshot images for passed `Playbook` instance.
    ///
    /// - Parameters:
    ///   - playbook: A `Playbook` instance to be tested.
    public func run(with playbook: Playbook) throws {
        try snapshot.run(with: playbook)
    }
}
