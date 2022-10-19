//
//  AllRecipes.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI

struct AllRecipes: View {
    @ObservedObject var model = viewModel()
    @State var recipes: [recipes] = []
    
    @State private var searchText = ""
    var searchResults:[recipes] {
        return searchText.isEmpty ? model.allRecipes :
        model.allRecipes.filter{$0.Name.contains(searchText)}
    }
    
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
                    ForEach(searchResults) { recipe in
                        CardView(rating: String(recipe.Rating), cookTime: recipe.TotalCookTime, vegan: recipe.Vegan, heading: recipe.Name, Image: recipe.Image){
                            MainView()
                        }
                    }
                }
                
                Spacer()
                }

            .padding()
            .navigationBarTitle("Recipes")
            .navigationBarBackButtonHidden(true)
            .foregroundColor(Color("Orange"))
            .navigationBarItems(trailing:
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height:70)
                    .padding(.top, 75)
            )
            .onAppear(){
                print("It worked bro")
                model.getData()
                self.recipes = model.allRecipes
                print(recipes)

            }
            }
        .frame(alignment: Alignment.top)

          
    }
}

struct AllRecipes_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
