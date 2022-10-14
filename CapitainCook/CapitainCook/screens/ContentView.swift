
import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var model = viewModel()
    
    init() {
      let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
        
//        model.getData()
        
    }
            
    @AppStorage("hasOpened") private var hasOpened : Bool = true
    
    @State var recipes: [recipes] = []
    var body: some View {
        
    NavigationView(){
        VStack(alignment: .leading, spacing: 0) {
            HStack{
                Text("Home")
                Spacer()
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 70)
                
            }
            Spacer()
            Spacer()
            ScrollView(.horizontal){
              
                HStack{
                    ForEach( 1..<4 ){ index in
                        RoundedRectangle(cornerRadius: 20)
                            .aspectRatio(1.0, contentMode: .fit)
                            .frame(maxHeight: 150)
                            .foregroundColor(Color("Main"))
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
                            .padding(.bottom, 20)
                            .overlay{
                                VStack{
                                    Text("🍝")
                                        .font(.system(size: 80))

                                
                                    Text("\(model.allRecipes.count)")
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Text("Total something")
                                        .font(.system(size: 18))
                                        .fontWeight(.medium)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 30)
                                }
                            }
                        Spacer(minLength: 20)
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
                        NavigationLink(destination: IndividualRecipe()){
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
//        .navigationBarTitle("Home")
//        .navigationBarBackButtonHidden(true)
//        .foregroundColor(Color("Orange"))
//        .navigationBarItems(trailing:
//            Image("Logo")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 70, height:70)
//                .padding(.top, 75)
//        )
        .onAppear(){
            model.getData()
            self.recipes = model.allRecipes
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
