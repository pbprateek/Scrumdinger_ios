//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 20/02/22.
//

import Foundation
import SwiftUI

struct TrailingIconLabelStyle:LabelStyle{
    
    
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
    }
}


//We did this so that any function which takes LabelStyle as parameter , we can pass it using dot operator
//Ex - labelStyle(.trailingIcon)

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}


