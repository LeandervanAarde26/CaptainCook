import SwiftUI

struct OnBoardingViews: Identifiable {
    let id: String = UUID().uuidString
    var Image: String = ""
    var Text: String = ""
    var background: Color
}

class onboarding: ObservableObject {
    @Published var views: [OnBoardingViews] = []
    init(_ views: [OnBoardingViews]) {
            self.views = views
        }
}

struct Onboarding: View {
    
    var Images = [
    "CookingGuy",
    "Pancakes",
    "PhoneGuy"]
    
    var Colors = [
        "Yellow",
        "Orange",
        "White"
    ]
    
    var Titles = [
    "View Recipes and information",
    "Filter and search for your next meal!",
    "Get details on a meal and save it to favorites!"
    ]
    
    @State private var currentLocation = 0
    @State var showMain = false
    
    var body: some View {
  
            ZStack{
                Color("\(Colors[currentLocation])")
                .ignoresSafeArea(.all)
                VStack{
                    Image("\(Images[currentLocation])")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 200, maxHeight: 200, alignment: Alignment.top)
                        .transition(.slide)
                    Text("\(Titles[currentLocation])")
                        .foregroundColor(currentLocation == 2 ? Color("Orange") : Color("White"))
                        .font(.largeTitle.weight(.bold))
                        .padding()
                    
                    VStack{
//                        Images are going to go inside here
                    }
                    .frame(maxWidth:.infinity, maxHeight: 250 )
                    
                    HStack{
                        HStack{
                            ForEach((1...3), id: \.self){ index in
                                Circle()
                                    .fill(index == currentLocation+1 ? currentLocation == 1 ? Color("Yellow") : Color("Orange"): Color(.lightGray))
                                    .frame(width: 15, height: 15)
                            }
                        }
                    Spacer()
                        NavigationLink(destination:  MainView(), isActive: $showMain) {
                            Text("")
                        }
                        Button("Next") {
                            withAnimation(.spring()) {
                                if (currentLocation == 2){
                                    self.showMain = true
                                } else{
                                    currentLocation = currentLocation+1
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color("White"))
                            .buttonStyle(.plain)
                            .frame(maxWidth: 150, maxHeight: 40)
                            .background(currentLocation == 1 ? Color("Yellow") : Color("Orange"))
                            .foregroundColor(Color("White"))
                            .clipShape(Capsule())
                    }
                    .padding(30.5)
                    
                }
            }
        }
    }

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}