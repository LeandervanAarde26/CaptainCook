
import SwiftUI


struct ContentView: View {
    
    @AppStorage("hasOpened") private var hasOpened : Bool = false
    var body: some View {
    
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(Color("Orange"))
            Text("Hello, Leander!")
        }
        .padding()
        .onAppear{
           hasOpened = true
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
