/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Container-related accessibility examples
*/

import Foundation
import SwiftUI

public struct ContainerExample: View {
    @State public var onState = true

    public var body: some View {
        VStack(alignment: .leading) {
            // Create a stack with multiple toggles and a label inside.
            VStack(alignment: .leading) {
                Text("Grouping Container")
                    .accessibilityAddTraits(.isHeader)
                    .accessibilitySortPriority(0)

                Toggle(isOn: $onState) { Text("Toggle 1") }
                    .accessibilitySortPriority(2)
                Toggle(isOn: $onState) { Text("Toggle 2") }
                    .accessibilitySortPriority(1)
                Toggle(isOn: $onState) { Text("Toggle 3") }
                    .accessibilitySortPriority(3)
                Toggle(isOn: $onState) { Text("Toggle 4") }
                    .accessibilitySortPriority(4)
            }
            .padding()
            .background(Color.white)
            .border(Color.blue, width: 0.5)
            // Explicitly make a new accessibility element
            // which will contain the children.
            .accessibilityElement(children: .contain)
            .accessibilityLabel(Text("Grouping Container"))

            LargeSpacer()

            VStack(alignment: .leading) {
                Text("Hiding Container")
                Image("dot_red", label: Text("Red Dot"))
                    .resizable()
                    .frame(width: 48, height: 48)
                    .scaledToFit()
                Image("dot_green", label: Text("Green Dot"))
                    .resizable()
                    .frame(width: 48, height: 48)
                    .scaledToFit()
            }
            .padding()
            .background(Color.white)
            .border(Color.blue, width: 0.5)
            // Hide all the accessibility elements that come from controls
            // inside this stack
            .accessibilityHidden(true)
            // Create a new accessibility element to contain them
            .accessibilityElement(children: .contain)
            .accessibilityLabel(Text("Hiding Container"))

            LargeSpacer()

            // Two text elements in a vertical stack, with different hints.
            VStack(alignment: .leading) {
                Text("Combining").accessibilityHint(Text("First Hint"))
                Text("Container").accessibilityHint(Text("Second Hint"))
            }
            .padding()
            .background(Color.white)
            .border(Color.blue, width: 0.5)
            // Explicitly create a container that will combine it's children
            // This will have a combined label and hint from the text elements
            // below it. And the text elements will be hidden.
            .accessibilityElement(children: .combine)
        }
    }

    public init() {}
}
