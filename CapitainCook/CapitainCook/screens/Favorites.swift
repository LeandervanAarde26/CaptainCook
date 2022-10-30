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
    
//    private func deleteTask(at offsets: IndexSet){
//        offsets.forEach{index in
//            let recipe = FavoriteRecipes[index]
//            viewContext.delete(recipe)
//        }
//    }
//
//    func removeFavorite(at offsets: IndexSet) {
//        for item in offsets {
//            let favorite = FavoriteRecipes[item]
//            viewContext.delete(favorite)
//            do{
//                try viewContext.save()
//            }catch{
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Favorites")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Orange"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView{
                VStack{
                    if FavoriteRecipes.count == 0{
                        Text("You have no Favorites 😢")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    ForEach(FavoriteRecipes){ recipe in
                        
                        NavigationLink{
                            IndividualRecipe(Recipe: recipes(id: Int(recipe.id), Author: recipe.author ?? "//", Categories: recipe.categories ?? [] , CookingInstructions: recipe.cookingInstructions ?? [], Description: recipe.desc ?? "//", Favorite: recipe.favorite, Image: recipe.image ?? "//", Ingredients: recipe.ingredients ?? [], Name: recipe.name ?? "//", Rating: Int(recipe.rating), Vegan: recipe.vegan, TotalCookTime: recipe.totalCookTime ?? "//"), comingFromInd: true)
                                .environment(\.managedObjectContext, viewContext)
                        }label: {
                            CardView(rating: String(recipe.rating), cookTime: recipe.totalCookTime ?? "//", vegan: recipe.vegan, heading: recipe.name ?? "//",  Image: recipe.image ?? "//"){MainView()}
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
                            .foregroundColor(.red)
                    }
                }
                .padding(.trailing, 2)
                .padding(.leading, 2)
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .foregroundColor(Color("Orange"))
        }
        .padding()
        
        .navigationBarBackButtonHidden(true)
    }
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
