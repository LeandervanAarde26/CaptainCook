//
//  AllRecipes.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI

struct AllRecipes: View {
    
    @State private var searchText = ""
    var body: some View {
        NavigationView(){
            VStack(alignment: .leading, spacing: 0) {
                SearchBar( text: $searchText)
                
                Text("Filter Recipes")
                    .font(.system(size: 24))
                    .padding(.top, 20)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Orange"))
                
                ScrollView{
                    ForEach((1...10), id: \.self){ index in
                        CardView(rating: "5", cookTime: "10 Minutes", vegan: true, heading: "Food Pizza",  Image: "TesterImage"){
                            MainView()
                        }
                        }
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    }
                
                Spacer()
                }
                .padding()
                .navigationBarTitle(Text("Recipes"), displayMode: .automatic)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(trailing:
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100.0,height:70)
                        .padding(.top, 75)
                )
            }
        .frame(alignment: Alignment.top)
          
    }
}

struct AllRecipes_Previews: PreviewProvider {
    static var previews: some View {
        AllRecipes()
    }
}
