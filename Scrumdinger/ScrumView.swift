//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 20/02/22.
//

import SwiftUI

struct ScrumView: View {
    
    let scrums:[DailyScrum]
    
    var body: some View {
        List{
            ForEach(scrums){ scrum in
            
                NavigationLink(destination:DetailView(scrum: scrum)){
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrum")
        .toolbar(content: {
            Button(action:{}){
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        })
        
        
    }
}

struct ScrumView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ScrumView(scrums: DailyScrum.sampleData)
        }
    }
}
