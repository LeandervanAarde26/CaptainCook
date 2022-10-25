//
//  Favorites.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI

struct Favorites: View {
    @Environment(\.managedObjectContext) private var viewContext
        
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FavRecipe.name, ascending: true)])
    private var FavoriteRecipes: FetchedResults<FavRecipe>
    
    
    var body: some View {
        NavigationView(){
            VStack(alignment: .leading, spacing: 0) {
                
                ScrollView{
                    if FavoriteRecipes.count == 0{
                        Text("You have no Favorites 😢")
                    }
                    ForEach(FavoriteRecipes){ recipe in
                        
                        NavigationLink {
                            IndividualRecipe(Recipe: recipes(id: Int(recipe.id), Author: recipe.author ?? "//", Categories: recipe.categories ?? [] , CookingInstructions: recipe.cookingInstructions ?? [], Description: recipe.desc ?? "//", Favorite: recipe.favorite, Image: recipe.image ?? "//", Ingredients: recipe.ingredients ?? [], Name: recipe.name ?? "//", Rating: Int(recipe.rating), Vegan: recipe.vegan, TotalCookTime: recipe.totalCookTime ?? "//"), comingFromInd: true)
                                .environment(\.managedObjectContext, viewContext)
                        } label: {
                            CardView(rating: String(recipe.rating), cookTime: recipe.totalCookTime ?? "//", vegan: recipe.vegan, heading: recipe.name ?? "//",  Image: recipe.image ?? "//"){
                                MainView()
                            }
                            
                        }
                    }
                    Button(role: .destructive){
                        for r in FavoriteRecipes{
                            viewContext.delete(r)
                        }
                        
                        do{
                            try viewContext.save()
                        }
                        catch{
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                    } label: {
                        Text("Clear data")
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
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
