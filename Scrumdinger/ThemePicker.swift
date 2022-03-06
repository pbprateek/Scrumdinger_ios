//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Prateek Kumar on 05/03/22.
//

import SwiftUI

struct TheamePicker:View{
    
    //This binding communicates changes to the theme within the theme picker, back to the parent view.
    @Binding var selection:Theme
    
    var body:some View{
        Picker("Theme",selection: $selection){
            ForEach(Theme.allCases){//theme in
                ThemeView(theme:$0).tag($0)
            }
        }
    }
}


struct ThemeView: View {
    
    let theme:Theme
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 4).fill(theme.mainColor)
            Label(theme.name, systemImage:"paintpalette").padding(4)
        }
        .foregroundColor(theme.accentColor)
        //this behaves more like wrap content
        .fixedSize(horizontal: false, vertical:true)
    }
}







struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        //ThemeView(theme:.buttercup)
        //.constant used for preview purpose to create a data of binding type
        TheamePicker(selection: .constant(.periwinkle))
    }
}
