//
//  Onboarding.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/20.
//

import SwiftUI

struct Onboarding: View {

    var body: some View {
        NavigationLink(destination: ContentView()){
            VStack{
               Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200, alignment: Alignment.top)
                Text("View Recipes And Information!")
                    .foregroundColor(Color("Orange"))
                    .font(.largeTitle.weight(.bold))
                  
                    
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
