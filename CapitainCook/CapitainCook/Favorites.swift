//
//  Favorites.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI

struct Favorites: View {
    var body: some View {
        NavigationView(){
            VStack(alignment: .leading, spacing: 0) {
                Text("I am the favorites page!")
                }
                .padding()
                .navigationBarTitle("Favorites")
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

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        Favorites()
    }
}
