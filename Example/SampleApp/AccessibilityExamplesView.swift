/*
See LICENSE folder for this sample’s licensing information.

Abstract:
iOS accessibility examples view
*/

import Foundation
import SwiftUI

// Contents view for a specific example
public struct ExampleView: View {
    public let example: AccessibilityExample

    public init(_ example: AccessibilityExample) {
        self.example = example
    }

    public var body: some View {
        VStack {
            example.view
                .padding(.horizontal)

            Spacer()
        }
    }
}

// Top-level view for all examples
public struct AccessibilityExamplesView: View {
    public var body: some View {
        NavigationView {
            List {
                ForEach(examples, id: \.name) { example in
                    NavigationLink(destination: ExampleView(example)) {
                        Text(verbatim: example.name)
                    }
                }
            }
            .navigationBarTitle(Text("Examples"))
        }
    }

    public init() {}
}
