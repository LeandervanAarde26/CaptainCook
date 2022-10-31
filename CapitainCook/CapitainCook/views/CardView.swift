//
//  CardView.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/03.
//

import SwiftUI

struct CardView: View{
//    var recipe: recipes
    var rating: String
    var cookTime: String
    var vegan : Bool
    var heading: String
    var PreviewPhoto: String

    
    init(rating: String, cookTime: String, vegan: Bool, heading: String, Image: String){
        
        self.rating = rating
        self.cookTime = cookTime
        self.vegan = vegan
        self.heading = heading
        self.PreviewPhoto = Image
        
    }
    
    var body: some View {
        HStack(alignment: .center){
            AsyncImage(url: URL(string: PreviewPhoto)){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 7)
                    .clipped()

            } placeholder: {
                Image(systemName: "photo")
            } //End of Image
            
            VStack(alignment: .leading){
                Text(heading)
                    .font(.system(size: 19, weight: .bold, design: .default))
                    .foregroundColor(Color("Text"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 2)
                    .padding(.top, 2)
                
                HStack{
                    SwiftUI.Image(systemName: "star.fill")
                        .foregroundColor(Color("Yellow"))
                    Text("\(rating) stars")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(Color("Text"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 0.5)
                }
                
                HStack{
                    SwiftUI.Image(systemName: "clock")
                        .foregroundColor(Color("Text"))
                    Text(cookTime)
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(Color("Text"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 0.5)
                }
                
                HStack{
                    if vegan{
                        SwiftUI.Image(systemName: "leaf")
                                .foregroundColor(.green)
                        Text("Vegan Friendly")
                            .font(.system(size: 16, weight: .medium, design: .default))
                            .foregroundColor(Color("Text"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 0.5)
                    } else{
                        SwiftUI.Image(systemName: "x.circle")
                            .foregroundColor(.red)
                        Text("Not vegan Friendly")
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(Color("Text"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 0.5)
                    } // End of ifelse
                } // end of vegan Hstack
                
            } // End of inner VStack

        }
        .padding(.all, 5)
        .frame(maxWidth: .infinity, alignment: .center)
                .padding(.all, 10)//End of HStack main
                .background(
                    RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("Main"))
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
                    .frame(maxHeight: 150)
                )
    }
}


//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(rating: "5", cookTime: "10 Minutes", vegan: true, heading: "Food Pizza",  Image: "TesterImage"){
//            MainView()
//        }
//    }
//}
