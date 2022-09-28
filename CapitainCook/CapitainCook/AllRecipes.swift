//
//  AllRecipes.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI

struct AllRecipes: View {
    var body: some View {
        NavigationView(){
            VStack(alignment: .leading, spacing: 0) {
                Text("I am the All Recipes and search page!")
                }
                .padding()
                .navigationBarTitle("Recipes")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(trailing:
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100.0,height:100)
                        .padding(.top, 75)
                )
            }
          
    }
}

struct AllRecipes_Previews: PreviewProvider {
    static var previews: some View {
        AllRecipes()
    }
}
