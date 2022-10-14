
import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var model = viewModel()
    
    init() {
      let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    @State var recipes: [recipes] = []
    var body: some View {
        
    NavigationView(){
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.horizontal){
                HStack{
                    Preview(Emoji: "🥗", Extra: "\(model.allRecipes.filter({$0.Vegan == true }).count)", Text: "Vegan Recipes"){
                        MainView()
                    }
                    Preview(Emoji: "🍝", Extra: "\(model.allRecipes.count)", Text: "Total Recipes"){
                        MainView()
                    }
                    Preview(Emoji: "⭐️", Extra: "\(model.allRecipes.filter({$0.Vegan == true }).count)", Text: "Favorite Recipes"){
                        MainView()
                    }
                }
            }
            Text("Top 3 Recipes")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.black)
            ScrollView{
                
                VStack{
                    ForEach(model.allRecipes.prefix(3)) { recipe in
                        NavigationLink(destination: IndividualRecipe(Recipe: recipe)){
                            CardView(rating: String(recipe.Rating), cookTime: recipe.TotalCookTime, vegan: recipe.Vegan, heading: recipe.Name, Image: recipe.Image){
                                MainView()
                            }
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("Home")
        .navigationBarBackButtonHidden(true)
        .foregroundColor(Color("Orange"))

        .navigationBarItems(trailing:
            VStack{
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 75, minHeight:75)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(height: 75)
        )
  
        .onAppear(){
            model.getData()
            self.recipes = model.allRecipes
            UserDefaults.standard.set(true, forKey: "hasOpened")
        }
    }
    .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(viewModel())
    }
}
