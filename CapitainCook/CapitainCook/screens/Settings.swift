//
//  Settings.swift
//  CapitainCook
//
//  Created by Leander Van Aarde on 2022/09/26.
//

import SwiftUI
enum Theme: String, CaseIterable, Identifiable{
    case dark, light
    var id: Self { self }
}

extension Theme{
    var theme: Bool{
        switch self{
        case .light:
            return false
        case .dark:
            return true
        }
    }
}

struct Settings: View {
    @Environment(\.openURL) var openURL
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkModeOn = false
    @State private var selectedColor: Theme = .light
    var settingsInformation: [settingModel] = settingsDat
    
    func setAppTheme(){
        isDarkModeOn = UserDefaultsUtils.shared.getDarkMode()
        changeDarkMode(state: isDarkModeOn)
        
        if (selectedColor == .dark || colorScheme == .dark)
        {
            selectedColor = .dark
        }
        else{
            
            selectedColor = .light
        }
        changeDarkMode(state: selectedColor.theme)
    }
    
    func changeDarkMode(state: Bool){
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
        UserDefaultsUtils.shared.setDarkMode(enable: state)
    }
    
    var ToggleThemeView: some View {
        Picker("Theme", selection: $selectedColor){
            Text("Dark Mode").tag(Theme.dark)
            Text("Light Mode").tag(Theme.light)
        }
        .pickerStyle(.segmented)
        .onChange(of: selectedColor.theme){ (state) in
            changeDarkMode(state: state)
        }
    }
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Orange"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 20)
                Text("About the Developer 🧑‍💻")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Orange"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 10)
                Text("Designed and Developed by Leander van Aarde 2022")
                    .padding(.bottom, 10)
                    .foregroundColor(Color("Text"))
                
                Spacer()
                    .frame(height: 20)
                
                Text("Technologies used")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Orange"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(settingsInformation) { information in
                    HStack{
                        Image(information.Image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 50, maxHeight: 40)
                        Spacer()
                            .frame(width: 30)
                        Text(information.Texts)
                            .foregroundColor(Color("Text"))
                            .fontWeight(.medium)
                    }
                    Spacer()
                        .frame(height: 10)
                }
                
                VStack{
                    Spacer()
                        .frame(height: 20)
                    Text("Switch theme").foregroundColor(Color("Text")).padding(10)
                    ToggleThemeView
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Button("View Github") {
                        openURL(URL(string: "https://www.Github.com/LeandervanAarde")!)
                    }
                    .frame(maxWidth: .infinity)
                    .frame( height: 50)
                    .foregroundColor(Color("White"))
                    .buttonStyle(.plain)
                    .frame(maxWidth: 150, maxHeight: 40)
                    .background( Color("Yellow"))
                    .foregroundColor(Color("White"))
                    .clipShape(Capsule())
                    .padding(20)
                }
                Spacer()
                
            }
            .padding()
        }
        .background(Color("BackgroundColor"))
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            setAppTheme()
        })
    }
}

//struct Settings_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
