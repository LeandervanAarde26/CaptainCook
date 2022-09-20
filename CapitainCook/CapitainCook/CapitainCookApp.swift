//
//  CapitainCookApp.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/20.
//

import SwiftUI

@main
struct CapitainCookApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                SplashScreen()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
        }
    }
}
