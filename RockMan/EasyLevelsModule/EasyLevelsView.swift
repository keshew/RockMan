import SwiftUI

struct EasyLevelsView: View {
    @StateObject var easyLevelsModel =  EasyLevelsViewModel()

    var body: some View {
        ZStack {
            Image(ImageName.easyBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    SmallButton(foregroundImage: ImageName.menu.rawValue,
                                action: easyLevelsModel.goToMenu)
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
                    Text("EASY")
                        .Jelly(size: 60)
                        .outlineText(color: Color(red: 255/255, green: 0/255, blue: 0/255), width: 1)
                    
                    Text("It's your first time on stage at the local music fair. The crowd is small but cheerful, and the melodies are flowing smoothly. A perfect chance to get comfortable and show them your potential—just don’t trip on the eggs flying from the snack stand!")
                        .Jomhuria(size: 25, color: .white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                ZStack {
                    Image(ImageName.easyLevelsBackground.rawValue)
                        .resizable()
                        .padding()
                        .aspectRatio(contentMode: .fit)
                    
                    LevelPin(image: easyLevelsModel.imageFor(number: 1),
                             text: "1",
                             offsetX: UIScreen.main.bounds.width / -14,
                             offsetY: UIScreen.main.bounds.height / 4.6,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.finishPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / -2.4,
                             offsetY: UIScreen.main.bounds.height / -4.5,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / -2.8,
                             offsetY: UIScreen.main.bounds.height / 36.9,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / 9.4,
                             offsetY: UIScreen.main.bounds.height / 6.7,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / 30,
                             offsetY: UIScreen.main.bounds.height / -25.7,
                             action: easyLevelsModel.goToGame)

                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / 30,
                             offsetY: UIScreen.main.bounds.height / -25.7,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: ImageName.moneyPin.rawValue,
                             text: "",
                             offsetX: UIScreen.main.bounds.width / 3.7,
                             offsetY: UIScreen.main.bounds.height / -8.7,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: easyLevelsModel.imageFor(number: 2),
                             text: "2",
                             offsetX: UIScreen.main.bounds.width / 5,
                             offsetY: UIScreen.main.bounds.height / 4.5,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: easyLevelsModel.imageFor(number: 3),
                             text: "3",
                             offsetX: UIScreen.main.bounds.width / 2.45,
                             offsetY: UIScreen.main.bounds.height / 7,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: easyLevelsModel.imageFor(number: 4),
                             text: "4",
                             offsetX: UIScreen.main.bounds.width / -3.25,
                             offsetY: UIScreen.main.bounds.height / 6.5,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: easyLevelsModel.imageFor(number: 5),
                             text: "5",
                             offsetX: UIScreen.main.bounds.width / -4.75,
                             offsetY: UIScreen.main.bounds.height / 9.5,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: easyLevelsModel.imageFor(number: 6),
                             text: "6",
                             offsetX: UIScreen.main.bounds.width / -6.75,
                             offsetY: UIScreen.main.bounds.height / -10.5,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: easyLevelsModel.imageFor(number: 7),
                             text: "7",
                             offsetX: UIScreen.main.bounds.width / 5.75,
                             offsetY: UIScreen.main.bounds.height / -17.5,
                             action: easyLevelsModel.goToGame)
                    
                    LevelPin(image: easyLevelsModel.imageFor(number: 8),
                             text: "8",
                             offsetX: UIScreen.main.bounds.width / -7,
                             offsetY: UIScreen.main.bounds.height / -4.9,
                             action: easyLevelsModel.goToGame)
                }
            }
            .navigationDestination(isPresented: $easyLevelsModel.isGameAvailible) {
                GameView()
            }
            
            .navigationDestination(isPresented: $easyLevelsModel.isMenuAvailible) {
                MenuView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EasyLevelsView()
}
