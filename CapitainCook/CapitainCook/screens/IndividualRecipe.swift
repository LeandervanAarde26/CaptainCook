//
//  IndividualRecipe.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/14.
//

import SwiftUI

struct IndividualRecipe: View {
    let Recipe: recipes
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FavRecipe.name, ascending: true)])
    private var FavoriteRecipes: FetchedResults<FavRecipe>
    @State var showAlert: Bool = false
    @State var comingFromInd: Bool
    
    var body: some View {
        NavigationView(){
            VStack{
                ZStack{
                    VStack{
                        AsyncImage(url: URL(string: Recipe.Image)){ image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 250)
                                .clipped()
                                .ignoresSafeArea(.all)
                                .overlay{
                                    Rectangle()
                                        .frame(maxWidth: .infinity, maxHeight: 250, alignment: .leading)
                                        .clipped()
                                        .scaledToFill()
                                        .foregroundColor(.black)
                                        .ignoresSafeArea(.all)
                                        .opacity(0.3)
                                }
                            
                            
                        } placeholder: {
                            Image(systemName: "photo")
                        }
                    }
                    
                    VStack{
                        Text("\(Recipe.Name)")
                            .foregroundColor(Color("Text"))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("\(Recipe.Description) ")
                            .foregroundColor(Color("Text"))
                            .font(.custom("px", size: 16))
                            .padding(.top, 0.5)
                            .padding(.bottom, 0.5)
                            .lineLimit(3)
                        
                        HStack{
                            SwiftUI.Image(systemName: "star.fill")
                                .foregroundColor(.white)
                            Text("\(Recipe.Rating) stars")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(Color("Text"))
                            
                                .padding(.bottom, 5)
                            
                            Spacer()
                            
                            SwiftUI.Image(systemName: "clock.fill")
                                .foregroundColor(.white)
                            Text("\(Recipe.TotalCookTime)")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(Color("Text"))
                            
                                .padding(.bottom, 5)
                        }
                        
                        HStack{
                            SwiftUI.Image(systemName: "basket.fill")
                                .foregroundColor(.white)
                            Text("\(Recipe.Ingredients.count) ingredients")
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                                .foregroundColor(Color("Text"))
                            
                                .padding(.bottom, 0.5)
                            
                            Spacer()
                            
                            if Recipe.Vegan == true{
                                SwiftUI.Image(systemName: "leaf.fill")
                                    .foregroundColor(.white)
                                Text("Vegan Recipe")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("Text"))
                                
                                    .padding(.bottom, 0.5)
                            } else{
                                SwiftUI.Image(systemName: "leaf.fill")
                                    .foregroundColor(.red)
                                Text("Non-Vegan Recipe")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("Text"))
                                
                                    .padding(.bottom, 0.5)
                            }
                            
                        }
                        
                    } //End of block Vstack
                    .padding(20)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("Yellow"))
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
                            .padding()
                            .frame(minHeight: 230)
                    )
                } //End of ZStack
                .frame(alignment: .top)
                
                
                VStack{
                    if !comingFromInd{
                        Button("Add to Favorites ????"){
                            
                            var exists = false
                            for r in FavoriteRecipes {
                                if Int(r.id) == Recipe.id{
                                    exists = true
                                    break
                                }
                            }
                            
                            if !exists{
                                let newFavorite = FavRecipe(context: viewContext)
                                newFavorite.id = Int64(Recipe.id)
                                newFavorite.author = Recipe.Author
                                newFavorite.categories = Recipe.Categories
                                newFavorite.cookingInstructions = Recipe.CookingInstructions
                                newFavorite.desc = Recipe.Description
                                newFavorite.favorite = true
                                newFavorite.image = Recipe.Image
                                newFavorite.ingredients = Recipe.Ingredients
                                newFavorite.name = Recipe.Name
                                newFavorite.rating = Int64(Recipe.Rating)
                                newFavorite.totalCookTime = Recipe.TotalCookTime
                                newFavorite.vegan = Recipe.Vegan
                                
                                do{
                                    try viewContext.save()
                                }
                                catch{
                                    print(error.localizedDescription)
                                }
                            }else{
                                showAlert = true
                            }
                            
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color("White"))
                        .buttonStyle(.plain)
                        .frame(maxWidth: 150, maxHeight: 40)
                        .background( Color("Yellow"))
                        .foregroundColor(Color("White"))
                        .clipShape(Capsule())
                    }
                    
                }
                
                ScrollView{
                    
                    Text("Ingredients")
                        .foregroundColor(Color("Text"))
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .padding(.bottom, 3)
                    
                    ForEach(0 ..< Recipe.Ingredients.count) {value in
                        
                        HStack{
                            Circle()
                                .frame(width: 7, height: 7)
                                .foregroundColor(Color("Text"))
                                .frame(alignment: .leading)
                            
                            Spacer()
                            
                            Text("\(Recipe.Ingredients[value])")
                                .foregroundColor(Color("Text"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.medium)
                            Divider()
                        }
                    }
                    
                    Text("Cooking Instructions")
                        .foregroundColor(Color("Text"))
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .padding(.bottom, 3)
                    
                    
                    ForEach(0 ..< Recipe.CookingInstructions.count) {value in
                        
                        HStack{
                            Text("\(value+1).")
                                .foregroundColor(Color("Text"))
                                .fontWeight(.bold)
                                .frame(maxHeight: .infinity, alignment: .top)
                            
                            Text(" \( Recipe.CookingInstructions[value])")
                                .foregroundColor(Color("Text"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.medium)
                                .padding(.leading, 6)
                                .padding(.trailing, 6)
                            Divider()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
            }
            .alert( isPresented: $showAlert){
                  Alert(title: Text("This is already in your favorites ??????"), dismissButton: .default(Text("Dismiss")))
              }
        }
    }
}

//
//struct IndividualRecipe_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
