//
//  CapitainCookApp.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/20.
//

import SwiftUI


@main
struct CapitainCookApp: App {
    let persistanceController = PersistenceController.shared
    var model = viewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                SplashScreen()
                    .environmentObject(model)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .environment(\.managedObjectContext, persistanceController.container.viewContext)
            }
        }
    }
}
