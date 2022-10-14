
import SwiftUI


struct MainView: View {

    var body: some View {
    
            TabView{
                ContentView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(1)
                
                Favorites()
                    .tabItem{
                        Image(systemName: "star")
                        Text("Favorites")
                    }.tag(2)
                
                AllRecipes()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(3)
                
                Settings()
                    .tabItem{
                        Image(systemName: "gear")
                        Text("Settings")
                    }.tag(3)
            }
            .accentColor(Color("Orange"))
            .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}