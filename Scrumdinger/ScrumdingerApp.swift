//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 20/02/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    @State private var scrums = DailyScrum.sampleData
    
    

    
    
    var body: some Scene {
        WindowGroup {
            //Still feel NavigationView should be used inside ScrumView
            NavigationView{
                ScrumView(scrums:$scrums)
            }
            
        }
    }
}
