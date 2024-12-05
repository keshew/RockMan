import SwiftUI

struct NormalLevelsView: View {
    @StateObject var normalLevelsModel =  NormalLevelsViewModel()

    var body: some View {
        ZStack {
            Image(ImageName.normalBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    SmallButton(foregroundImage: ImageName.menu.rawValue,
                                action: normalLevelsModel.goToMenu)
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
                    Text("NORMAL")
                        .Jelly(size: 60)
                        .outlineText(color: Color(red: 255/255, green: 0/255, blue: 0/255), width: 1)
                    
                    Text("Congratulations, you've been invited to play at the city’s rock festival! The tempo’s picking up, and the crowd’s starting to groove, tossing coins to show their love. But beware—the tomato-throwing critics have arrived, and they aim to ruin your rhythm!")
                        .Jomhuria(size: 25, color: .white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                ZStack {
                    Image(ImageName.normalLevelsBackground.rawValue)
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                    
                    LevelPin(image: ImageName.finishPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / 6.4,
                             offsetY: UIScreen.main.bounds.height / -4.5,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / -2.6,
                             offsetY: UIScreen.main.bounds.height / -5.9,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / 6.4,
                             offsetY: UIScreen.main.bounds.height / 16,
                             action: normalLevelsModel.goToGame)

                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / 18,
                             offsetY: UIScreen.main.bounds.height / -15.7,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / 2.25,
                             offsetY: UIScreen.main.bounds.height / -7.7,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: normalLevelsModel.imageFor(number: 11),
                             text: "11",
                             offsetX: UIScreen.main.bounds.width / 2.25,
                             offsetY: UIScreen.main.bounds.height / -32.2,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: normalLevelsModel.imageFor(number: 10),
                             text: "10",
                             offsetX: UIScreen.main.bounds.width / 3.5,
                             offsetY: UIScreen.main.bounds.height / 9.2,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: normalLevelsModel.imageFor(number: 9),
                             text: "9",
                             offsetX: UIScreen.main.bounds.width / 2.45,
                             offsetY: UIScreen.main.bounds.height / 6.2,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: normalLevelsModel.imageFor(number: 14),
                             text: "14",
                             offsetX: UIScreen.main.bounds.width / -3.0,
                             offsetY: UIScreen.main.bounds.height / 5.3,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: normalLevelsModel.imageFor(number: 12),
                             text: "12",
                             offsetX: UIScreen.main.bounds.width / -19.75,
                             offsetY: UIScreen.main.bounds.height / 8.5,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: normalLevelsModel.imageFor(number: 13),
                             text: "13",
                             offsetX: UIScreen.main.bounds.width / -8.55,
                             offsetY: UIScreen.main.bounds.height / -18.5,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: normalLevelsModel.imageFor(number: 15),
                             text: "15",
                             offsetX: UIScreen.main.bounds.width / -2.25,
                             offsetY: UIScreen.main.bounds.height / 62.5,
                             action: normalLevelsModel.goToGame)
                    
                    LevelPin(image: normalLevelsModel.imageFor(number: 16),
                             text: "16",
                             offsetX: UIScreen.main.bounds.width / -32,
                             offsetY: UIScreen.main.bounds.height / -5.5,
                             action: normalLevelsModel.goToGame)
                }
            }
            
            .navigationDestination(isPresented: $normalLevelsModel.isGameAvailible) {
                GameView()
            }
            
            .navigationDestination(isPresented: $normalLevelsModel.isMenuAvailible) {
                MenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NormalLevelsView()
}
