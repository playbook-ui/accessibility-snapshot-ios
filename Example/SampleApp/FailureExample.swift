//
//  FailureExample.swift
//  SampleApp
//
//  Created by Jiayi Zhou on 2020-11-26.
//

import SwiftUI

struct FailureExample: View {
    var body: some View {
        ScrollView {
            /// "Accessibility label" check
            /// checkForAXLabelPresent
            Button(action: {
                print("pressed")
            }, label: {
                Rectangle()
                    .frame(width: 45, height: 45, alignment: .center)
            })
            
            /// "Accessibility label-trait overlap" check
            /// checkForAXLabelNotRedundantWithTraits
            Button(action: {
                print("pressed")
            }, label: {
                Rectangle()
                    .frame(width: 45, height: 45, alignment: .center)
            })
            .accessibilityLabel("Button")
            
            /// "Accessibility label punctuation" check
            /// checkForAXLabelNotPunctuated
            Button(action: {
                print("pressed")
            }, label: {
                Rectangle()
                    .frame(width: 45, height: 45, alignment: .center)
            })
            .accessibilityLabel("Label Punctuation.")
            
            /// "Touch target size"  check
            /// checkForMinimumTappableArea
            Button(action: {
                print("pressed")
            }, label: {
                Rectangle()
                    .frame(width: 30, height: 30, alignment: .center)
            })
            .accessibilityLabel("Minimum touch target size")
            
            /// "Accessibility traits" check
            /// checkForAXTraitDontConflict
            Button(action: {
                print("pressed")
            }, label: {
                Rectangle()
                    .frame(width: 45, height: 45, alignment: .center)
            })
            .accessibilityLabel("Conflicting traits")
            .accessibilityAddTraits([.isButton, .isLink])
        }
    }
}

struct FailureExample_Previews: PreviewProvider {
    static var previews: some View {
        FailureExample()
    }
}
