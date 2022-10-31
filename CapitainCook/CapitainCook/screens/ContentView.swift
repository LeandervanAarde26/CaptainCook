
import SwiftUI


struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @ObservedObject var model = viewModel()
    @State var something: Bool = false
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
        VStack(alignment: .leading, spacing: 0) {
            Text("Home")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Orange"))
            
            ScrollView(.horizontal){
                HStack{
                    Preview(Emoji: "🥗", Extra: "\(model.allRecipes.filter({$0.Vegan == true }).count)", Text: "Vegan Recipes", selected: $something)
                    Preview(Emoji: "🍝", Extra: "\(model.allRecipes.count)", Text: "Total Recipes", selected: $something)
                    Preview(Emoji: "⭐️", Extra: "\(FavoriteRecipes.count)", Text: "Favorite Recipes", selected: $something)
                }
            }
            Text("Top 3 Recipes")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color("Text"))
            ScrollView{
                
                VStack{
                    ForEach(model.allRecipes.sorted{  $0.Rating > $1.Rating}.prefix(3)) { recipe in
                        NavigationLink {
                            IndividualRecipe(Recipe: recipe, comingFromInd: false)
                                .environment(\.managedObjectContext, viewContext)
                        } label: {
                            CardView(rating: String(recipe.Rating), cookTime: recipe.TotalCookTime, vegan: recipe.Vegan, heading: recipe.Name, Image: recipe.Image)
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
            HStack{
            colorScheme == .light
            ?
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 75, minHeight:75)
            :
            Image("WhiteLogo")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 75, minHeight:75)
            
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(height: 75)
        )
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            model.getData()
            self.recipes = model.allRecipes
            UserDefaults.standard.set(false, forKey: "hasOpened")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(viewModel())
    }
}
