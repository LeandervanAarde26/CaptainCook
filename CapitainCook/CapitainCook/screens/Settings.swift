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
            VStack(alignment: .leading, spacing: 0) {
                
                Text("Settings")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Orange"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
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
                
                
                ForEach(settingsInformation) { information in
                    HStack{
                        Image(information.Image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 50, maxHeight: 40)
                        Spacer()
                            .frame(width: 30)
                        Text(information.Texts)
                            .foregroundColor(.black)
                    }
                    Spacer()
                        .frame(height: 10)
                }
                
                Spacer()
                    .frame(height: 10)
                
                
                Text("Switch theme").foregroundColor(Color("Text")).padding(10)
                ToggleThemeView
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
        .background(Color("BackgroundColor"))
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear(perform: {
            setAppTheme()
        })
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
