
import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var model = viewModel()
    @Environment(\.managedObjectContext) private var viewContext
    init() {
      let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \FavRecipe.name, ascending: true)])
    private var FavoriteRecipes: FetchedResults<FavRecipe>
    
    @State var recipes: [recipes] = []
    var body: some View {
        
//    NavigationView(){
        VStack(alignment: .leading, spacing: 0) {

            ScrollView(.horizontal){
                HStack{
                    Preview(Emoji: "🥗", Extra: "\(model.allRecipes.filter({$0.Vegan == true }).count)", Text: "Vegan Recipes"){
                        MainView()
                    }
                    Preview(Emoji: "🍝", Extra: "\(model.allRecipes.count)", Text: "Total Recipes"){
                        MainView()
                    }
                    Preview(Emoji: "⭐️", Extra: "\(FavoriteRecipes.count)", Text: "Favorite Recipes"){
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
                    ForEach(model.allRecipes.sorted{  $0.Rating > $1.Rating}.prefix(3)) { recipe in
                        NavigationLink {
                            IndividualRecipe(Recipe: recipe, comingFromInd: false)
                                .environment(\.managedObjectContext, viewContext)
                        } label: {
                            CardView(rating: String(recipe.Rating), cookTime: recipe.TotalCookTime, vegan: recipe.Vegan, heading: recipe.Name, Image: recipe.Image){
                                MainView()
                            }
                        }
                    }
                }
                .padding(.trailing, 2)
                .padding(.leading, 2)
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
//    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(viewModel())
    }
}
