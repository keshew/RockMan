import SwiftUI

struct DifficultyView: View {
    @StateObject var difficultyModel =  DifficultyViewModel()

    var body: some View {
        ZStack {
            Image(RockImageName.menuBackground.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    SmallButton(foregroundImage: RockImageName.menu.rawValue,
                                action: difficultyModel.goToRockMenu)
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
                
                Text("CHOOSE DIFFICULTY")
                    .Jelly(size: 50)
                    .outlineText(color: Color(red: 255/255, green: 0/255, blue: 0/255), width: 1)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                
                
                Spacer()
                
                VStack {
                    DifficultButton(text: "EASY",
                                    image: RockImageName.greenDifficulty.rawValue,
                                    action: difficultyModel.goToEasy,
                                    sizeWButton: 230,
                                    sizeHButton: 120,
                                    sizeText: 40)
                
                    
                    DifficultButton(text: "NORMAL",
                                    image: RockImageName.yellowDifficulty.rawValue,
                                    action: difficultyModel.goToNormal,
                                    sizeWButton: 230,
                                    sizeHButton: 120,
                                    sizeText: 40)
                    
                    DifficultButton(text: "HARD",
                                    image: RockImageName.redDifficulty.rawValue,
                                    action: difficultyModel.goToHard,
                                    sizeWButton: 230,
                                    sizeHButton: 120,
                                    sizeText: 40)
                }
                Spacer()
            }
            .navigationDestination(isPresented: $difficultyModel.isMenuAvailible) {
                RockMenuView()
            }
            
            .navigationDestination(isPresented: $difficultyModel.isEasyAvailible) {
                EasyLevelsView()
            }
            
            .navigationDestination(isPresented: $difficultyModel.isNormalAvailible) {
                NormalLevelsView()
            }
            
            .navigationDestination(isPresented: $difficultyModel.isHardAvailible) {
                HardLevelsView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DifficultyView()
}

