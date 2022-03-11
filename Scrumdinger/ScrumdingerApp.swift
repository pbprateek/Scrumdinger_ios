//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 20/02/22.
//

import SwiftUI


//@main and confirm to App protocol to Tell what is starting point
@main
struct ScrumdingerApp: App {
    
    @State private var scrums = DailyScrum.sampleData
    
    
    //In ios we only add one scene but in pad or mac there can be multiple
    var body: some Scene {
        //SwiftUI provides primitive scenes like WindowGroup and system manages lifecycle of these Scenes
        WindowGroup {
            //Still feel NavigationView should be used inside ScrumView
            NavigationView{
                ScrumView(scrums:$scrums)
            }
            
        }
    }
}
