//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 20/02/22.
//

import SwiftUI

struct DetailView: View {
    
    //Source of truth
    @Binding var scrum:DailyScrum
    
    
    //We are only using this as a local source of truth for edit screen , to get the changed data and update it later when user pressees done, Keep in mind that
    //This value also updates when user presses cancel in Edit screen , but when u reenter the dit screen we are setting a fresh value frm scrum to this
    @State private var data = DailyScrum.Data()
    @State private var isPresentingEditView = false  //When you declare a property as a @State, you create a source of truth within your view.
    
    var body: some View {
        List{
            Section(header: Text("Meeting Info")){
                
                NavigationLink(destination:MeetingView()){
                    Label("Start Meeting", systemImage:"timer").font(.headline).foregroundColor(.accentColor)
                }
                
                HStack{
                    Label("Length",systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }.accessibilityElement(children: .combine)
                
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name).padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            
            
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees){
                    attendee in
                    
                    Label(attendee.name , systemImage: "person")
                }
                
            }
            
        }.navigationTitle(scrum.title)
            .toolbar{
                Button("Edit"){
                    isPresentingEditView = true
                    //Idk why we are going this way, why update after user tap on Edit?Maybe to handle plus button so user get's a default view
                    data = scrum.data
                }
            }
            .sheet(isPresented: $isPresentingEditView, onDismiss:{
                
            }){
                //Hate this here , would have put it in Detail Edit view and would have used a closure to return a callback,Horrible
                NavigationView{
                    //Bcz of $ sign , Binding is getting passes as @State is a delegate which gives back Binding
                    //Also changes user make in EditView will automatically update here as well in data
                    DetailEditView(data: $data)
                        .navigationTitle(scrum.title)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    scrum.update(from: data)
                                }
                            }
                        }
                }
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
