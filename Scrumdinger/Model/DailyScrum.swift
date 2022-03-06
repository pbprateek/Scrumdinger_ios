//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 20/02/22.
//

import Foundation


struct DailyScrum:Identifiable {
    internal init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map{
            Attendee(name: $0)
        }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    
    var id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    
    
}



extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    
    //We just created a Copy kind of thing just for UI purpose and to pass it around
    struct Data {
           var title: String = ""
           var attendees: [Attendee] = []
           var lengthInMinutes: Double = 5
           var theme: Theme = .seafoam
       }
    
    var data:Data {
        //Here we returned the original value, more like a copy
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}



//Adding a Static variable using extension to DailyScrum,We could have added directly to struct as well
extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}
