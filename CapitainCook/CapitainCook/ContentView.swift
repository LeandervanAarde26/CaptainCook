
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
            Text("Hello, World!")
                .onAppear{
                    hasOpened = false
                }
            }
        
            .padding()
            .navigationBarTitle("Home")
            .navigationBarBackButtonHidden(true)
            .foregroundColor(Color("Orange"))
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
