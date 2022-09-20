//
//  SplashScreen.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/20.

import SwiftUI

struct SplashScreen: View {
    @State private var isActive:Bool = false
    @State private var shouldAnimate = false
    @State var show = false
    @State private var isAnimating = false
    @State private var showProgress = false
    @State var currentColor = Color("Orange")
    @State var currentImage = "Hat"
    @State var textImage = "Moustache"
    @AppStorage("hasOpened") private var hasOpened = false
    
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    @State private var rotation = 0.0
    var body: some View {
        VStack{
            if self.isActive{
                if hasOpened{
                    ContentView()
                } else{
                    Onboarding()
                }
            } else{
                ZStack{
                    currentColor.ignoresSafeArea(.all)
                        Image(currentImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width:300,height:300)
                            .position(x: UIScreen.main.bounds.width / 2 , y: UIScreen.main.bounds.height / 2.6 )
                    
                    if showProgress {
                        Image(textImage)
               
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:200,height:200)
                            .clipShape(Circle())
                            .frame(minWidth:300,minHeight:300)
                            .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0), anchor: .center)
                            .animation(self.isAnimating ? foreverAnimation : .default)
                            .position(x: UIScreen.main.bounds.width / 2 , y: UIScreen.main.bounds.height / 1.55 )
                            .onAppear { self.isAnimating = true }
                    } else {
                        Image(textImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:300,height:300)
                    }
                }
                .onAppear {
                    self.showProgress = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.3) {
                        withAnimation{
                            self.currentColor = Color("Yellow")
                            self.currentImage = "DarkHat"
                            self.textImage = "DarkMoustache"
                        }
                    }
                                        
                    DispatchQueue.main.asyncAfter(deadline: .now()+5.0){
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()

    }
}


