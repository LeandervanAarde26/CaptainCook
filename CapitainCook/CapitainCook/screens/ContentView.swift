
import SwiftUI

struct ContentView: View {

    init() {
      let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
      navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    @AppStorage("hasOpened") private var hasOpened : Bool = false
    var body: some View {
        
    NavigationView(){
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.horizontal){
              
                HStack{
                    ForEach((1...3), id: \.self){ index in
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

                                
                                    Text("15")
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
            VStack{
                
                Text("Top 3 Recipes")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                
                ScrollView{
                    
                    ForEach((1...3), id: \.self){ index in
                        CardView(rating: "5", cookTime: "10 Minutes", vegan: true, heading: "Food Pizza",  Image: "TesterImage"){
                            MainView()
                        }
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
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
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height:70)
                    .padding(.top, 75)
            )
        }
    .navigationBarBackButtonHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
