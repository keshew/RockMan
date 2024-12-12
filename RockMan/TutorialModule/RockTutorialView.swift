import SwiftUI

struct RockTutorialView: View {
    @StateObject var tutorialModel =  RockTutorialViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Image(RockImageName.gameBackground.rawValue)
                    .resizable()
                    .ignoresSafeArea()
                
                ZStack {
                    HStack {
                        Button(action: {
                            tutorialModel.currentIndex += 1
                            if tutorialModel.currentIndex == 5 {
                                tutorialModel.isLinkVisible = true
                            }
                        }) {
                            Image("clearImage")
                                .resizable()
                                .ignoresSafeArea()
                                .frame(width: 393, height: 852)
                        }
                        
                    }
                    
                }
                
                VStack {
                    HStack {
                        SmallButton(foregroundImage: RockImageName.menu.rawValue,
                                    action: tutorialModel.goToRockMenu)
                        Spacer()
                        ZStack {
                            Image(RockImageName.buttonBackground.rawValue)
                                .resizable()
                                .frame(width: 120, height: 50)
                            HStack {
                                Text("2000")
                                    .Jomhuria(size: 35, color: .white)
                                    .offset(y: 3)
                                
                                Image(RockImageName.money.rawValue)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }
                    .padding()
                    
                    ZStack {
                        Image(RockImageName.cloud.rawValue)
                            .resizable()
                            .frame(width: 325, height: 300)
                        
                        Text(tutorialModel.getTextAndSize().0)
                            .Jelly(size: tutorialModel.getTextAndSize().1, color: .white)
                            .frame(width: 250)
                            .offset(y: -15)
                            .multilineTextAlignment(.center)
                    }
                    
                    Image(RockImageName.rockMan.rawValue)
                        .resizable()
                        .frame(width: 230   , height: 300)
                    
                    Text("TAP TO SKIP")
                        .Jomhuria(size: 54, color: .white)
                   }
                if tutorialModel.isLinkVisible {
                    NavigationLink(destination: RockGameView()) {
                        Text("perehod")
                            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                            .foregroundColor(.clear)
            }
        }
                }
             }
        }
}

#Preview {
    RockTutorialView()
}

