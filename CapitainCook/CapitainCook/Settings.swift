//
//  Settings.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView(){
            VStack(alignment: .leading, spacing: 0) {
                Text("I am the Settings page!")
                }
                .padding()
                .navigationBarTitle("Settings")
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

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
