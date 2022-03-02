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
            NavigationView{
                ScrumView(scrums: DailyScrum.sampleData)
            }
            
        }
    }
}
