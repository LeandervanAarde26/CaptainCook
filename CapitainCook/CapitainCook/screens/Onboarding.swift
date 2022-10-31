import SwiftUI


struct Onboarding: View {
    
    var onBoardingScreens: [onBoard] = onBoardingdata
    @Environment(\.managedObjectContext) private var viewContext
    @State private var currentLocation = 0
    @State var showMain = false
    
    var body: some View {
        
        ZStack{
            Color("\(onBoardingScreens[currentLocation].Colours)")
                .ignoresSafeArea(.all)
            VStack{
                Image("\(onBoardingScreens[currentLocation].Images)")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200, maxHeight: 200, alignment: Alignment.top)
                    .transition(.slide)
                Text("\(onBoardingScreens[currentLocation].Titles)")
                    .foregroundColor(currentLocation == 2 ? Color("Orange") : Color("White"))
                    .font(.largeTitle.weight(.bold))
                    .padding()
                
                VStack{
                    Image("\(onBoardingScreens[currentLocation].image2)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame( height: 250)
                        .padding(.trailing, 7)
                        .clipped()
                        
                }
                .frame(maxWidth: 350, maxHeight: 250 )
                .background(
                    RoundedRectangle(cornerRadius: 20)
                    .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 2)
                    .foregroundColor(.clear)
                    .frame(maxHeight: 250)
                )
                
                HStack{
                    HStack{
                        ForEach((1...3), id: \.self){ index in
                            Circle()
                                .fill(index == currentLocation+1 ? currentLocation == 1 ? Color("Yellow") : Color("Orange"): Color(.lightGray))
                                .frame(width: 15, height: 15)
                        }
                    }
                    Spacer()
                    //                        NavigationLink(destination:  MainView(), isActive: $showMain) {
                    //                            Text("")
                    //                        }
                    
                    NavigationLink(isActive: $showMain){
                        MainView()
                            .environment(\.managedObjectContext, viewContext)
                        
                    } label: {
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
