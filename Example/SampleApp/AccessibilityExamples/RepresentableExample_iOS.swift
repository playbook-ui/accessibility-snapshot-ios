/*
See LICENSE folder for this sample’s licensing information.

Abstract:
iOS NSViewRepresentable implementations
*/

import Foundation
import SwiftUI
import UIKit

public final class RepresentableUIView: UIView {
    public var color: UIColor

    public init(_ color: UIColor, accessibilityUserInputLabels: [String]) {
        self.color = color
        super.init(frame: .zero)
        self.isAccessibilityElement = true
        self.accessibilityUserInputLabels = accessibilityUserInputLabels
        layer.backgroundColor = color.cgColor
        layer.cornerRadius = defaultCornerRadius
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }
}

public struct RepresentableView: UIViewRepresentable {
    public func makeUIView(context: UIViewRepresentableContext<RepresentableView>) -> RepresentableUIView {
        return RepresentableUIView(.red, accessibilityUserInputLabels: ["Red", "Rectangular"])
    }

    public func updateUIView(_ nsView: RepresentableUIView, context: UIViewRepresentableContext<RepresentableView>) {
    }

    public init() {}
}

public final class RepresentableUIViewController: UIViewController {
    public override func loadView() {
        self.view = RepresentableUIView(.blue, accessibilityUserInputLabels: ["Blue", "Rectangular"])
    }
}

public struct RepresentableViewController: UIViewControllerRepresentable {
    public func makeUIViewController(context: UIViewControllerRepresentableContext<RepresentableViewController>) -> RepresentableUIViewController {
        return RepresentableUIViewController()
    }

    public func updateUIViewController(
        _ nsViewController: RepresentableUIViewController,
        context: UIViewControllerRepresentableContext<RepresentableViewController>
    ) {
    }

    public init() {}
}
