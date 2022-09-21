//
//  CapitainCookApp.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/20.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct CapitainCookApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
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
