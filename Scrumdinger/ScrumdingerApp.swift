//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 20/02/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            //Still feel NavigationView should be used inside ScrumView
            NavigationView{
                ScrumView(scrums: DailyScrum.sampleData)
            }
            
        }
    }
}
