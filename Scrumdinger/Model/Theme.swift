//
//  Theme.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 20/02/22.
//

import Foundation
import SwiftUI

enum Theme:String,CaseIterable,Identifiable{

    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    
    var name: String {
           rawValue.capitalized
       }
    
    //From identifable protocol
    var id: String{
        name
    }
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    var mainColor: Color {
            Color(rawValue)
        }
    
    
}
