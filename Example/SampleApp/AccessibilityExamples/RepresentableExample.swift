/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Platform representable accessibility examples
*/

import Foundation
import SwiftUI

public struct RepresentableExample: View {
    public var body: some View {
        VStack(alignment: .leading) {
            Text("Element with representable view")
                .accessibilityLabel("representable view")

            // You can use SwiftUI's Accessibility API to customize to accessibility of
            // AppKit or UIKit represented elements
            RepresentableView()
                .frame(width: 128, height: 48)
                .accessibilityLabel(Text("representable view accessibility label"))
                .accessibilityValue(Text("representable view accessibility value"))
                .accessibilityHint(Text("representable view accessibility hint"))

            LargeSpacer()

            Text("Element with representable view controller")
                .accessibilityLabel("representable view controller")

            RepresentableViewController()
                .frame(width: 128, height: 48)
                .accessibilityLabel(Text("representable view controller accessibility label"))
                .accessibilityValue(Text("representable view controller accessibility value"))
                .accessibilityHint(Text("representable view accessibility hint"))
        }
    }

    public init() {}
}
