import SwiftUI

struct HardLevelsView: View {
    @StateObject var hardLevelsModel =  HardLevelsViewModel()

    var body: some View {
        ZStack {
            Image(ImageName.hardBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    SmallButton(foregroundImage: ImageName.menu.rawValue,
                                action: hardLevelsModel.goToMenu)
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
                
                VStack(spacing: 30) {
                    Text("HARD")
                        .Jelly(size: 60)
                        .outlineText(color: Color(red: 255/255, green: 0/255, blue: 0/255), width: 1)
                    
                    Text("You’ve made it to the main stage of the world-famous Rock Arena! The spotlight is blinding, the music is electrifying, and the beats are coming at lightning speed. The audience is tossing coins like crazy, but so are the pranksters with eggs—stay sharp and own the stage like the legend you are!")
                        .Jomhuria(size: 25, color: .white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                ZStack {
                    Image(ImageName.hardLevelsBackground.rawValue)
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                    
                    LevelPin(image: ImageName.finishPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / -3.1,
                             offsetY: UIScreen.main.bounds.height / -5.5,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / -2.7,
                             offsetY: UIScreen.main.bounds.height / 7.9,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / -20.4,
                             offsetY: UIScreen.main.bounds.height / 16,
                             action: hardLevelsModel.goToGame)

                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / -8,
                             offsetY: UIScreen.main.bounds.height / -16.7,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / 3.2,
                             offsetY: UIScreen.main.bounds.height / 6.7,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: hardLevelsModel.imageFor(number: 19),
                             text: "19",
                             offsetX: UIScreen.main.bounds.width / 2.9,
                             offsetY: UIScreen.main.bounds.height / -4.7,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: hardLevelsModel.imageFor(number: 18),
                             text: "18",
                             offsetX: UIScreen.main.bounds.width / 3.9,
                             offsetY: UIScreen.main.bounds.height / 5.6,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: hardLevelsModel.imageFor(number: 17),
                             text: "17",
                             offsetX: UIScreen.main.bounds.width / 24.45,
                             offsetY: UIScreen.main.bounds.height / 4.8,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: hardLevelsModel.imageFor(number: 22),
                             text: "22",
                             offsetX: UIScreen.main.bounds.width / 5.0,
                             offsetY: UIScreen.main.bounds.height / 9.8,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: hardLevelsModel.imageFor(number: 24),
                             text: "24",
                             offsetX: UIScreen.main.bounds.width / -4.25,
                             offsetY: UIScreen.main.bounds.height / -9,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: hardLevelsModel.imageFor(number: 21),
                             text: "21",
                             offsetX: UIScreen.main.bounds.width / 3.55,
                             offsetY: UIScreen.main.bounds.height / -18.5,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: hardLevelsModel.imageFor(number: 23),
                             text: "23",
                             offsetX: UIScreen.main.bounds.width / 23.25,
                             offsetY: UIScreen.main.bounds.height / -9.5,
                             action: hardLevelsModel.goToGame)
                    
                    LevelPin(image: hardLevelsModel.imageFor(number: 20),
                             text: "20",
                             offsetX: UIScreen.main.bounds.width / -32,
                             offsetY: UIScreen.main.bounds.height / -5.4,
                             action: hardLevelsModel.goToGame)
                }
            }
            .navigationDestination(isPresented: $hardLevelsModel.isMenuAvailible) {
                MenuView()
            }
            
            .navigationDestination(isPresented: $hardLevelsModel.isGameAvailible) {
                GameView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HardLevelsView()
}

