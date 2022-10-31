//
//  Preview.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/14.
//

import SwiftUI

struct Preview : View {
    var Emoji: String
    var Extra: String
    var Text : String
//    let content: Content
    @Binding var selected : Bool
    
//    init(Emoji: String, Extra: String, Text: String, selected: Bool){
//
//        self.Emoji = Emoji
//        self.Extra = Extra
//        self.Text = Text
//        self.selected = selected
////        self.content = contentBuilder()
//    }
    
    var body: some View {
        VStack{
            SwiftUI.Text(Emoji)
                .font(.system(size: 78))
        
            SwiftUI.Text(Extra)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color("Text"))
    
            SwiftUI.Text(Text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(Color("Text"))
                .padding(.bottom, 30)
        }
        .onAppear{
            print(selected)
        }
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 20)
            .aspectRatio(1.0, contentMode: .fit)
            .frame(maxHeight: 150)
            .foregroundColor(selected ? Color("Yellow") : Color("Main"))
            .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
            .padding(.bottom, 20)
//        @ViewBuilder contentBuilder: () -> Content
        )
    }
}

//struct Preview_Previews: PreviewProvider {
//    static var previews: some View {
//       MainView()
//    }
//}
