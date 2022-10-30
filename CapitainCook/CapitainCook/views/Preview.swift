//
//  Preview.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/14.
//

import SwiftUI

struct Preview <Content: View>: View {
    var Emoji: String
    var Extra: String
    var Text : String
    let content: Content

    
    init(Emoji: String, Extra: String, Text: String,  @ViewBuilder contentBuilder: () -> Content){
        
        self.Emoji = Emoji
        self.Extra = Extra
        self.Text = Text
        self.content = contentBuilder()
        
    }
    
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
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 20)
            .aspectRatio(1.0, contentMode: .fit)
            .frame(maxHeight: 150)
            .foregroundColor(Color("Main"))
            .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
            .padding(.bottom, 20)
        )
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
       MainView()
    }
}
