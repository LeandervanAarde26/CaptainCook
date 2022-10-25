
import SwiftUI


struct MainView: View {
//    @Environment(\.colorScheme) var colorScheme
//    @Binding var colorScheme: ColorScheme?
@Environment(\.managedObjectContext) private var viewContext
    
    func saveContext(){
        do{
            try viewContext.save()
        } catch{
            fatalError("Oh no bro")
        }
    }

    var body: some View {
        NavigationView{
            TabView{
                ContentView()
                    .environment(\.managedObjectContext, viewContext)
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                        
                    }.tag(1)
                
                Favorites()
                    .environment(\.managedObjectContext, viewContext)
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
            .foregroundColor(.white)
            .accentColor(Color("Orange"))
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()            
    }
}
