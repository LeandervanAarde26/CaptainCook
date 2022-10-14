//
//  CardView.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/03.
//

import SwiftUI

struct CardView <Content: View>: View{
//    var recipe: recipes
    var rating: String
    var cookTime: String
    var vegan : Bool
    var heading: String
    var PreviewPhoto: String
    let content: Content
    
    init(rating: String, cookTime: String, vegan: Bool, heading: String, Image: String,  @ViewBuilder contentBuilder: () -> Content){
        
        self.rating = rating
        self.cookTime = cookTime
        self.vegan = vegan
        self.heading = heading
        self.PreviewPhoto = Image
        self.content = contentBuilder()
        
    }
    
    var body: some View {
//        RoundedRectangle(cornerRadius: 20)
//             .overlay(
//        NavigationLink(Individual(recipe: recipe))
                HStack{
                    
                    AsyncImage(url: URL(string: PreviewPhoto)){ image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame( minWidth: 60, maxWidth: 70, minHeight: 140, maxHeight: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        Image(systemName: "photo")
                    }
                    .frame(width: 70, height: 50)
                    
                    VStack{
                        
                        Text(heading)
                            .font(.system(size: 26))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 2)
                            .padding(.top)
                        
                        HStack{
                            SwiftUI.Image(systemName: "star.fill")
                                .foregroundColor(Color("Yellow"))
                            Text("\(rating) stars")
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
                        
    
                        HStack{
                            if vegan {
                                SwiftUI.Image(systemName: "leaf")
                                    .foregroundColor(.black)
                                Text("Vegan friendly")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            } else{
                                SwiftUI.Image(systemName: "x.circle")
                                    .foregroundColor(.red)
                                Text("Not vegan Friendly")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .padding(.bottom)
                                    
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("Main"))
                        .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
                        .padding()
                        .frame(minHeight: 180)
                )
                
//             )
//             .frame(maxWidth: .infinity)
//             .foregroundColor(Color("Main"))
//             .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
//             .padding()
        Spacer()
    }
}


//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(rating: "5", cookTime: "10 Minutes", vegan: true, heading: "Food Pizza",  Image: "TesterImage"){
//            MainView()
//        }
//    }
//}
