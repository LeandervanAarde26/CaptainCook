//
//  Favorites.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        NavigationView(){
            VStack(alignment: .leading, spacing: 0) {
                
                Text("All my favorites")
                    .font(.system(size: 24))
                    .padding(.top, 20)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Orange"))
                
                ScrollView{
                    
                    ForEach((1...10), id: \.self){ index in
                        CardView(rating: "5", cookTime: "10 Minutes", vegan: true, heading: "Food Pizza",  Image: "TesterImage"){
                            MainView()
                        }
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        }
                    }
     
                }
                .padding()
                .navigationBarTitle("Favourites")
                .navigationBarBackButtonHidden(true)
                .foregroundColor(Color("Orange"))
                .navigationBarItems(trailing:
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height:70)
                        .padding(.top, 75)
                )
            }
        .navigationBarBackButtonHidden(true)
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
