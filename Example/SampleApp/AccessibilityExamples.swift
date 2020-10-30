/*
See LICENSE folder for this sample’s licensing information.

Abstract:
List of accessibility examples
*/

import Foundation
import SwiftUI

// Standard "large space"
public struct LargeSpacer: View {
    public var body: some View {
        Spacer(minLength: 25)
            .frame(maxHeight: 25)
    }

    public init() {}
}

// Representation of an example
public struct AccessibilityExample {
    public var name: String
    public var view: AnyView

    public init<V: View>(name: String, view: V) {
        self.name = name
        self.view = AnyView(view)
    }
}

// Default corner radius to be used for rounding
public let defaultCornerRadius: CGFloat = 10

// List of examples to be shown
public let examples = [
    AccessibilityExample(name: "Standard Controls", view: StandardControlExample()),
    AccessibilityExample(name: "Images", view: ImageExample()),
    AccessibilityExample(name: "Text", view: TextExample()),
    AccessibilityExample(name: "Containers", view: ContainerExample()),
    AccessibilityExample(name: "Actions", view: ActionExample()),
    AccessibilityExample(name: "ViewRepresentable", view: RepresentableExample()),
]

// Visual representaiton of an element
public struct AccessibilityElementView: View {
    public let color: Color
    public let text: Text

    public var body: some View {
        RoundedRectangle(cornerRadius: defaultCornerRadius)
            .fill(color)
            .frame(width: 128, height: 48)
            .overlay(text, alignment: .center)
            .foregroundColor(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: defaultCornerRadius)
                    .strokeBorder(Color.white, lineWidth: 2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: defaultCornerRadius)
                    .strokeBorder(Color.gray, lineWidth: 1)
            )
    }

    public init(
        color: Color,
        text: Text
    ) {
        self.color = color
        self.text = text
    }
}
