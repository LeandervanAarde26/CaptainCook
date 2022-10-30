//
//  AllRecipes.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI

struct AllRecipes: View {
    @ObservedObject var model = viewModel()
    @State var Recipes: [recipes] = []
    
    @State private var searchText = ""
    var searchResults:[recipes] {
        return searchText.isEmpty ? model.allRecipes :
        model.allRecipes.filter{$0.Name.contains(searchText)}
    }
    
    var FilterResults: [recipes] {
        return model.allRecipes
    }
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Recipes")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Orange"))
                .frame(maxWidth: .infinity, alignment: .leading)
            SearchBar( text: $searchText)
            ScrollView{
                Text("Filter Recipes")
                    .font(.system(size: 24))
                    .padding(.top, 20)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Orange"))
                
                ScrollView(.horizontal){
                    
                    ForEach(searchResults) { recipe in
                        NavigationLink {
                            IndividualRecipe(Recipe: recipe, comingFromInd: false)
                        } label: {
                            CardView(rating: String(recipe.Rating), cookTime: recipe.TotalCookTime, vegan: recipe.Vegan, heading: recipe.Name, Image: recipe.Image){
                                MainView()
                            }
                        }
                    }
                }
                
                Spacer()
            }
            
            .padding()
            .navigationBarBackButtonHidden(true)
            .onAppear(){
                model.getData()
                self.Recipes = model.allRecipes
                print(Recipes)
            }
        }
    }
}
    
    struct AllRecipes_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
