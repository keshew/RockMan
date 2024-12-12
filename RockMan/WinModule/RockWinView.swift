import SwiftUI

struct RockWinView: View {
    @StateObject var winModel =  RockWinViewModel()

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            Image(RockImageName.congratulation.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            Image(RockImageName.congratulation.rawValue)
                .resizable()
                .ignoresSafeArea()
                .offset(y: 460)
            
            VStack {
                HStack {
                    SmallButton(foregroundImage: RockImageName.menu.rawValue,
                                action: winModel.goToRockMenu)
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
                
                Text("YOU WIN!")
                    .Jelly(size: 110)
                    .outlineText(color: .red, width: 1)
                
                Text("Congratulations!")
                    .Jomhuria(size: 50, color: .white)
                
                Image(RockImageName.cup.rawValue)
                    .resizable()
                    .frame(minWidth: 300, maxWidth: 300, minHeight: 300, maxHeight: 350)
                
                WideButton(text: "NEXT",
                           action: winModel.goToNext,
                           sizeWButton: 250,
                           sizeHButton: 130,
                           sizeText: 80,
                           offsetY: 8)
            }
            .navigationDestination(isPresented: $winModel.isMenuAvailible) {
                RockMenuView()
            }
            
            .navigationDestination(isPresented: $winModel.isNextAvailible) {
                DifficultyView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RockWinView()
}

