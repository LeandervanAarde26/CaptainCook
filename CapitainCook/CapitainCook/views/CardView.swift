//
//  CardView.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/03.
//

import SwiftUI

struct CardView <Content: View>: View{
    
    var rating: String
    var cookTime: String
    var vegan : Bool
    var heading: String
    var Image: String
    let content: Content
    
    init(rating: String, cookTime: String, vegan: Bool, heading: String, Image: String,  @ViewBuilder contentBuilder: () -> Content){
        
        self.rating = rating
        self.cookTime = cookTime
        self.vegan = vegan
        self.heading = heading
        self.Image = Image
        self.content = contentBuilder()
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
             .overlay(
                HStack{
                    SwiftUI.Image(Image)
                        .resizable()
                        .scaledToFill()
                        .frame( maxWidth: 90, maxHeight: 117)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    VStack{
                        
                        Text(heading)
                            .font(.system(size: 26))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 2)
                        
                        HStack{
                            SwiftUI.Image(systemName: "star.fill")
                                .foregroundColor(Color("Yellow"))
                            Text("Food Rating")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 0.5)
                        }
                        
                        HStack{
                            SwiftUI.Image(systemName: "clock")
                                .foregroundColor(.black)
                            Text(cookTime)
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 0.5)
                        }
                        
                        vegan ?
                        HStack{
                            SwiftUI.Image(systemName: "leaf")
                                .foregroundColor(.black)
                            Text("Vegan friendly")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 0.5)
                        }
                        :
                        nil
                    }
                }
                
             )
             .frame(maxWidth: .infinity, minHeight: 120)
             .foregroundColor(Color("Main"))
             .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
         
         Spacer()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(rating: "5", cookTime: "10 Minutes", vegan: true, heading: "Food Pizza",  Image: "TesterImage"){
            MainView()
        }
    }
}
