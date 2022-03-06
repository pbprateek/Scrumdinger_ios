//
//  ScrumView.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 20/02/22.
//

import SwiftUI


//To be used inside NavigationView or else few parameters won't work
struct ScrumView: View {
    
    @Binding var scrums:[DailyScrum]
    
    var body: some View {
        List{
            //This is called some array binding where we run loop on binding array and get binding each time in closure
            ForEach($scrums){ $scrum in
                NavigationLink(destination:DetailView(scrum: $scrum)){
                    CardView(scrum: scrum)
                }.listRowBackground(scrum.theme.mainColor)
            }
        }
        //We are able to abb these navigationTitle and toolbar and all bcz the entire ScrumView is wrappend inside NavigationView in parent file or these won't work
        //The child view can affect the appearance of the NavigationView using modifiers.
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
            ScrumView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}
