import AccessibilitySnapshot

extension SnapshotSupport {

    /// Generates an image file data that snapshots the given scenario with accessibility markers.
    ///
    /// - Parameters:
    ///   - scenario: A scenario to be snapshot.
    ///   - device: A snapshot environment simulating device.
    ///   - format: An image file format of exported data.
    ///   - scale: A rendering scale of the snapshot image.
    ///   - keyWindow: The key window of the application.
    ///   - handler: A closure that to handle generated data.
    ///
    /// - Note: Passing the key window adds the scenario content to the view
    ///         hierarchy and actually renders it, so producing a more accurate
    ///         snapshot image.
    public static func accessibilityData(
        for scenario: Scenario,
        on device: SnapshotDevice,
        format: ImageFormat,
        scale: CGFloat = UIScreen.main.scale,
        keyWindow: UIWindow? = nil,
        handler: @escaping (Data) -> Void
    ) {
        view(for: scenario, on: device, keyWindow: keyWindow) { scenarioView in
            let accessibilityView = AccessibilitySnapshotView(
                containedView: scenarioView,
                viewRenderingMode: .renderLayerInContext,
                activationPointDisplayMode: .always
            )

            accessibilityView.parseAccessibility(useMonochromeSnapshot: false)
            accessibilityView.sizeToFit()

            data(
                for: accessibilityView,
                on: device,
                format: format,
                scale: scale,
                keyWindow: keyWindow,
                handler: handler
            )
        }
    }
}
