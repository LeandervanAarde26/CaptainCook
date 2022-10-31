//
//  AllRecipes.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI

struct AllRecipes: View {
    @State var isActive: Int = -1
    @ObservedObject var model = viewModel()
    @State var Recipes: [showRecipes] =  []
    @State var filterRecipes: [Filter] = filterData
    @State var currentFilter = ""
    @State private var searchText = ""

    
    @State var show: [Bool] = []
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Recipes")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Orange"))
                .frame(maxWidth: .infinity, alignment: .leading)
            SearchBar( text: $searchText)
                .onChange(of: searchText) { newValue in
                    for i in 0 ..< Recipes.count{
                        if Recipes[i].recipe.Name.contains(newValue){
                            Recipes[i].show = true
                        }else if newValue == ""{
                            Recipes[i].show = true
                        } else{
                            Recipes[i].show = false
                        }
                    }
                }
            ScrollView{
                Text("Filter Recipes")
                    .font(.system(size: 24))
                    .padding(.top, 20)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Orange"))
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(Array(filterRecipes.enumerated()), id: \.offset) { index , recipe in
                            Preview(Emoji: recipe.Emoji, Extra: "", Text: recipe.FilterName,  selected: isActive == index ? .constant(true) : .constant(false))
                                .onTapGesture {
                                    print(isActive)
                                    if currentFilter != recipe.FilterName {
                                        isActive = index
                                        for i in 0 ..< Recipes.count {
                                            if Recipes[i].recipe.Categories.contains(recipe.FilterName){
                                                Recipes[i].show = true
                                            } else{
                                                Recipes[i].show = false
                                            }
                                        }
                                        currentFilter = recipe.FilterName
                                    } else{
                                        isActive = -1
                                        for i in 0 ..< Recipes.count {
                                            Recipes[i].show = true
                                        }
                                        currentFilter = " "
                                    }
                                }
                            }
                        }
                    }
                
                    Text("\(currentFilter)")
                    .font(.subheadline)
                    .foregroundColor(Color("Orange"))
                                    
                    ForEach(Recipes) { recipe in
                        if recipe.show{
                            NavigationLink {
                                IndividualRecipe(Recipe: recipe.recipe, comingFromInd: false)
                            } label: {
                                CardView(rating: String(recipe.recipe.Rating), cookTime: recipe.recipe.TotalCookTime, vegan: recipe.recipe.Vegan, heading: recipe.recipe.Name, Image: recipe.recipe.Image)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .onAppear(){
                Task{
                    await model.getData()
                    self.Recipes = model.allRecipes.map({ recipes in
                        showRecipes(show: true, recipe: recipes)
                    })
                    print("Hello" )
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


struct showRecipes: Identifiable {
    var id = UUID()
    var show: Bool
    var recipe: recipes
    
}
