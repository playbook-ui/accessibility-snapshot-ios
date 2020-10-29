/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Standard control accessibility examples
*/

import Foundation
import SwiftUI

public struct StandardControlExample: View {
    @State public var toggleOn = false

    public var body: some View {
        VStack(alignment: .leading) {
            Button(action: {}) {
                Text("Button with hint & identifier")
            }
            .accessibilityHint(Text("Accessibility hint for first button"))
            .accessibilityIdentifier("First Button")

            LargeSpacer()

            Toggle(isOn: $toggleOn) {
                Text("Toggle with hint")
            }
            .accessibilityHint(Text("Accessibility hint for toggle"))

            LargeSpacer()

            Text("Element with Label and Value")

            AccessibilityElementView(color: Color.purple, text: Text("Element"))
                .accessibilityLabel(Text("Purple Color Label"))
                .accessibilityValue(Text("Purple Color Value"))
        }
    }

    public init() {}
}
