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
//Without this also we could just have passed the object of above struct int the styple of Label , but this goes with SwiftUI pattern
//Ex - labelStyle(.trailingIcon) or .labelStyle(TrailingIconLabelStyle()) //Both works but 1st approach looks better

//Here we are doing so to  Implicit Member Expression , so Swift will be able to infer using dot operator 




extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}


