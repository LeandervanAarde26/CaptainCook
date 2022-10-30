import SwiftUI
import SpriteKit

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}

struct SplashScreen: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var screenActive:Bool = false
    @State private var shouldAnimate = false
    @State var show = false
    @State private var isAnimating = false
    @State private var showProgress = false
    @State var currentColor = Color("Orange")
    @State var currentImage = "Hat"
    @State var textImage = "Moustache"
    @State var backgroundHat = "BlackHat"
    @State var animationScale = false
    @State var number = 0.0
    @State var widthNumber = 0.0
    @AppStorage("hasOpened") var hasOpened : Bool = false
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    @State private var rotation = 0.0
    var body: some View {
        VStack{
            if self.screenActive{
                if hasOpened{
                    MainView()
                        .environment(\.managedObjectContext, viewContext)
                } else{
                    Onboarding()
                        .environment(\.managedObjectContext, viewContext)
                }
            } else{
                ZStack{
                    
                    currentColor.ignoresSafeArea(.all)
                        .ignoresSafeArea(.all)
                    
                    SpriteView(scene: RainFall(), options: [.allowsTransparency])
                    
                    Image(currentImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width:300,height:300)
                        .position(x: UIScreen.main.bounds.width / 2 , y: UIScreen.main.bounds.height / 2.6 )
                    
                    if showProgress {
                        Image(textImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:200,height:200)
                            .clipShape(Circle())
                            .frame(minWidth:300,minHeight:300)
                            .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0), anchor: .center)
                            .animation(self.isAnimating ? foreverAnimation : .default)
                            .position(x: UIScreen.main.bounds.width / 2 , y: UIScreen.main.bounds.height / 1.55 )
                            .onAppear { self.isAnimating = true }
                    } else {
                        Image(textImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:300,height:300)
                    }
                }
                .onAppear {
                    self.showProgress = true
                    DispatchQueue.main.asyncAfter(deadline: .now()+3.0){
                        withAnimation{
                            self.currentColor = Color("Yellow")
                            self.currentImage = "DarkHat"
                            self.textImage = "DarkMoustache"
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+7.0){
                        withAnimation{
                            self.screenActive = true
                        }
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
        
    }
}

class RainFall: SKScene{
    override func sceneDidLoad() {
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        backgroundColor = .clear
        anchorPoint = CGPoint(x: 0.5, y: 1)
        let node = SKEmitterNode(fileNamed: "RainFall.sks")!
        addChild(node)
        node.particlePositionRange.dx = UIScreen.screenWidth
    }
}



