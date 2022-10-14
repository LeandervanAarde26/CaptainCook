//
//  IndividualRecipe.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/10/14.
//

import SwiftUI

struct IndividualRecipe: View {
    var body: some View {
        NavigationView(){
                VStack{
                    ZStack{
                        Image("TesterImage")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .clipped()
                            .ignoresSafeArea(.all)
                        
                        VStack{
                            Text("This is a super delicious Recipe ")
                                .foregroundColor(.black)
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            Text("I am a totally awsome description that you are super interested in and that you would love to eat, right? This is just a test description so that you can see what I mean HELL YEAH BROTHER ")
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
                                Text("Rating")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                
                                    .padding(.bottom, 5)
                                
                                Spacer()
                                
                                SwiftUI.Image(systemName: "clock.fill")
                                    .foregroundColor(.white)
                                Text("Total Cook Time")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                
                                    .padding(.bottom, 5)
                            }
                            
                            HStack{
                                SwiftUI.Image(systemName: "basket.fill")
                                    .foregroundColor(.white)
                                Text("Total ingredients")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                
                                    .padding(.bottom, 0.5)
                                
                                Spacer()
                                
                                SwiftUI.Image(systemName: "leaf.fill")
                                    .foregroundColor(.white)
                                Text("Vegeterian")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                                
                                    .padding(.bottom, 0.5)
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
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.bold)
                                .padding(.bottom, 3)
                                                        
                            VStack{
                                Text("Ingredient Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.medium)
                                Divider()
                            }
                            
                            VStack{
                                Text("Ingredient Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.medium)
                                Divider()
                            }
                            
                            VStack{
                                Text("Ingredient Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.medium)
                                Divider()
                            }
                            
                            VStack{
                                Text("Ingredient Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.medium)
                                Divider()
                            }
                            
                            Text("Ingredients")
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fontWeight(.bold)
                                .padding(.bottom, 3)
                                                        
                            VStack{
                                Text("Ingredient Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.medium)
                                Divider()
                            }
                            
                            VStack{
                                Text("Ingredient Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.medium)
                                Divider()
                            }
                            
                            VStack{
                                Text("Ingredient Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.medium)
                                Divider()
                            }
                            
                            VStack{
                                Text("Ingredient Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.medium)
                                Divider()
                            }
                            
                            
                            
                        }
                        .frame(minHeight: 456, maxHeight: 540)
               
//                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color("Main"))
                                .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
                                .frame(minHeight: 540)
                        )
                        
                    }
                    .frame( maxHeight: .infinity, alignment: .leading)
                  
                    
                    
                }
                .navigationBarTitle("Home")
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
        }
    }
    

struct IndividualRecipe_Previews: PreviewProvider {
    static var previews: some View {
        IndividualRecipe()
    }
}
