/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Action accessibility examples
*/

import Foundation
import SwiftUI

public struct ActionExample: View {
    @State public var defaultActionFired = false
    @State public var customAction1Fired = false
    @State public var customAction2Fired = false
    @State public var incrementIndex = 0

    // Color to be used for the default action element
    private var defaultActionColor: Color {
        defaultActionFired ? .purple : .red
    }

    // Color to be used for the custom action element
    private var customActionColor: Color {
        (customAction1Fired || customAction2Fired) ? .blue : .red
    }

    private func customAction1() {
        print("Custom action 1 fired!")
        customAction1Fired = true
    }

    private func customAction2() {
        print("Custom action 2 fired!")
        customAction2Fired = true
    }

    private func adjustAction(_ adjustment: AccessibilityAdjustmentDirection) {
        // Keep incrementIndex positive
        switch adjustment {
        case .decrement:
            guard self.incrementIndex > 0 else {
                return
            }
            incrementIndex -= 1
        case .increment:
            incrementIndex += 1
        default:
            return
        }
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text("Element with default action")

            AccessibilityElementView(color: defaultActionColor, text: Text("Default"))
                .accessibilityLabel(Text("Element with default action"))
                .accessibilityAddTraits(.isButton)
                .accessibilityAction {
                    print("Default action fired!")
                    self.defaultActionFired = true
                }

            LargeSpacer()

            Text("Element with custom actions")

            AccessibilityElementView(color: customActionColor, text: Text("Custom"))
                .accessibilityLabel(Text("Element with custom actions"))
                .accessibilityAction(named: Text("Custom Action 1"), customAction1)
                .accessibilityAction(named: Text("Custom Action 2"), customAction2)

            LargeSpacer()

            Text("Custom adjustment action element")

            AccessibilityElementView(color: .green, text: Text("Adjustable: \(incrementIndex)"))
                .accessibilityLabel(Text("Custom increment element"))
                .accessibilityValue(Text(verbatim: "\(incrementIndex)"))
                .accessibilityAdjustableAction(adjustAction)
        }
    }

    public init() {}
}
