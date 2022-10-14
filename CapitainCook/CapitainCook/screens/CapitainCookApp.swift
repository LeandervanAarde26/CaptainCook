//
//  CapitainCookApp.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/20.
//

import SwiftUI
//
//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

@main
struct CapitainCookApp: App {
    var model = viewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                SplashScreen()
                    .environmentObject(model)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            }
        }
    }
}
