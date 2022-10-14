//
//  IndividualRecipe.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/14.
//

import SwiftUI

struct IndividualRecipe: View {
    let Recipe: recipes
    
    var body: some View {
        NavigationView(){
                VStack{
                    ZStack{
                        
                        AsyncImage(url: URL(string: Recipe.Image)){ image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 250)
                                .clipped()
                                .ignoresSafeArea(.all)
                                .overlay{
                                    Rectangle()
                                        .frame(maxWidth: .infinity, maxHeight: 250)
                                        .clipped()
                                        .scaledToFill()
                                        .foregroundColor(.black)
                                        .ignoresSafeArea(.all)
                                        .opacity(0.3)
                                }
                              
                              
                        } placeholder: {
                            Image(systemName: "photo")
                        }
                        
                        
//                        Image("TesterImage")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(maxWidth: .infinity, maxHeight: 250)
//                            .clipped()
//                            .ignoresSafeArea(.all)
                        
                        VStack{
                            Text("\(Recipe.Name)")
                                .foregroundColor(.black)
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("\(Recipe.Description) ")
                                .foregroundColor(.black)
                                .font(.custom("px", size: 16))
                            //                        .padding(.trailing, 25)
                            //                        .padding(.leading, 25)
                                .padding(.top, 0.5)
                                .padding(.bottom, 0.5)
                                .lineLimit(3)
                            
                            HStack{
                                SwiftUI.Image(systemName: "star.fill")
                                    .foregroundColor(.white)
                                Text("\(Recipe.Rating) stars")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                
                                    .padding(.bottom, 5)
                                
                                Spacer()
                                
                                SwiftUI.Image(systemName: "clock.fill")
                                    .foregroundColor(.white)
                                Text("\(Recipe.TotalCookTime)")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                
                                    .padding(.bottom, 5)
                            }
                            
                            HStack{
                                SwiftUI.Image(systemName: "basket.fill")
                                    .foregroundColor(.white)
                                Text("\(Recipe.Ingredients.count) ingredients")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                
                                    .padding(.bottom, 0.5)
                                
                                Spacer()
                                
                                if Recipe.Vegan == true{
                                    SwiftUI.Image(systemName: "leaf.fill")
                                        .foregroundColor(.white)
                                    Text("Vegan Recipe")
                                        .font(.system(size: 16))
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                    
                                        .padding(.bottom, 0.5)
                                } else{
                                    SwiftUI.Image(systemName: "leaf.fill")
                                        .foregroundColor(.red)
                                    Text("Non-Vegan Recipe")
                                        .font(.system(size: 16))
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                    
                                        .padding(.bottom, 0.5)
                                }
                                
                            }
                        }
                        .padding(.top, 30)
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                        .padding(.bottom, 30)
                        
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color("Yellow"))
                                .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
                                .padding()
                                .frame(minHeight: 180)
                        )
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    
                    VStack{
                        ScrollView{
                            
                            Text("Ingredients")
                                .foregroundColor(.black)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.bold)
                                .padding(.bottom, 3)
                                     
                            ForEach(0 ..< Recipe.Ingredients.count) {value in
                                
                                HStack{
                                    Circle()
                                        .frame(width: 7, height: 7)
                                        .foregroundColor(.black)
                                        .frame(alignment: .leading)
                                    
                                    Spacer()
                                    
                                    Text("\(Recipe.Ingredients[value])")
                                            .foregroundColor(.black)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .fontWeight(.medium)
                                        Divider()
                                       }
                                }
                            
                            Text("Cooking Instructions")
                                .foregroundColor(.black)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.bold)
                                .padding(.bottom, 3)
                            
                            
                            ForEach(0 ..< Recipe.CookingInstructions.count) {value in
                       
                       HStack{
                           Text("\(value+1).")
                               .foregroundColor(.black)
                               .fontWeight(.bold)
                               .frame(maxHeight: .infinity, alignment: .top)
                           
                           Text(" \( Recipe.CookingInstructions[value])")
                                   .foregroundColor(.black)
                                   .frame(maxWidth: .infinity, alignment: .leading)
                                   .fontWeight(.medium)
                                   .padding(.leading, 6)
                                   .padding(.trailing, 6)
                               Divider()
                              }
                       }
                                                                                    
                            
                        }
                        .padding(.leading, 20)
                        .frame(minHeight: 300, maxHeight: 540)
                        .padding(.bottom, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color("Main"))
                                .frame(minHeight: 320)
                        )
                        
                    }
                    .frame( maxHeight: .infinity, alignment: .leading)
                }
            
                .navigationBarBackButtonHidden(true)
//                .navigationBarBackButtonHidden(true)
                    .foregroundColor(Color("Main"))
                    .navigationBarItems(trailing:
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height:70)
                            .padding(.top, -150)
                        
                    )
            }
        }
    }
    

struct IndividualRecipe_Previews: PreviewProvider {
    static var previews: some View {
    MainView()
    }
}
