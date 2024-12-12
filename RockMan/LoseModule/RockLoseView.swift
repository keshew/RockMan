import SwiftUI

struct RockLoseView: View {
    @StateObject var loseModel =  RockLoseViewModel()

    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
          
            
            VStack {
                HStack {
                    SmallButton(foregroundImage: ImageName.menu.rawValue,
                                action: loseModel.goToMenu)
                    Spacer()
                    ZStack {
                        Image(ImageName.buttonBackground.rawValue)
                            .resizable()
                            .frame(width: 120, height: 50)
                        HStack {
                            Text("2000")
                                .Jomhuria(size: 35, color: .white)
                                .offset(y: 3)
                            
                            Image(ImageName.money.rawValue)
                                .resizable()
                            .frame(width: 24, height: 24)
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                Text("YOU LOSE!")
                    .Jelly(size: 60)
                    .outlineText(color: .red, width: 1)
                
                Text("You want to keep playing?")
                    .Jomhuria(size: 40, color: .white)
                
                Spacer()
                
                Text("CONTINUE?")
                    .Jelly(size: 60)
                    .outlineText(color: .red, width: 1)
                
                
                ZStack {
                    Image(ImageName.buttonBackground.rawValue)
                        .resizable()
                        .frame(width: 130, height: 65)
                    HStack {
                        Text("25")
                            .Jomhuria(size: 45, color: .white)
                            .offset(y: 3)
                        
                        Image(ImageName.money.rawValue)
                            .resizable()
                        .frame(width: 25, height: 25)
                    }
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        
                    }) {
                        Image(ImageName.playButton.rawValue)
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    HStack(spacing: 30) {
                        Button(action: {
                            
                        }) {
                            Image(ImageName.menuButton.rawValue)
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                        
                        Button(action: {
                            
                        }) {
                            Image(ImageName.retryButton.rawValue)
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
                Spacer()
            }
            .navigationDestination(isPresented: $loseModel.isMenuAvailible) {
                RockMenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RockLoseView()
}

