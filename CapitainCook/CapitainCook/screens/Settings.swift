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
                Text("👨🏼‍💻 The Developer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 10)
                    .foregroundColor(.black)
                Text("Designed and Developed by Leander van Aarde 2022")
                    .padding(.bottom, 10)
                    .foregroundColor(.black)
                    
                Text("Technologies")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer()
                    .frame(height: 10)
                
                HStack{
                    Image("SwiftUI")
                    Spacer()
                        .frame(width: 30)
                    Text("SwiftUI")
                        .foregroundColor(.black)
                }
                
                Spacer()
                    .frame(height: 10)
                HStack{
                    Image("Xcode")
                    Spacer()
                        .frame(width: 30)
                    Text("Xcode")
                        .foregroundColor(.black)
                }
                
                Spacer()
                    .frame(height: 10)
                
                HStack{
                    Image("AWS")
                        .resizable()
                        .frame(maxWidth: 30, maxHeight: 40)
                    
                    Spacer()
                        .frame(width: 30)
                    
                    Text("AWS S3 buckets")
                        .foregroundColor(.black)
                }
                
                Text("Available on all iOS devices")
                    .foregroundColor(.black)
                    .font(.headline)
                    .padding(.top, 20)
                
                
                                                    
            }
            .padding()
            .navigationBarTitle("Settings")
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

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
