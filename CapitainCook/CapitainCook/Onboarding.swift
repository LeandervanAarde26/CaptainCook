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
                Text("ONBOARDING ONE")
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
