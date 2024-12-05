import SwiftUI

struct WinView: View {
    @StateObject var winModel =  WinViewModel()

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            Image(ImageName.congratulation.rawValue)
                .resizable()
                .ignoresSafeArea()
            
            Image(ImageName.congratulation.rawValue)
                .resizable()
                .ignoresSafeArea()
                .offset(y: 460)
            
            VStack {
                HStack {
                    SmallButton(foregroundImage: ImageName.menu.rawValue,
                                action: winModel.goToMenu)
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
                
                Text("YOU WIN!")
                    .Jelly(size: 110)
                    .outlineText(color: .red, width: 1)
                
                Text("Congratulations!")
                    .Jomhuria(size: 50, color: .white)
                
                Image(ImageName.cup.rawValue)
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
                MenuView()
            }
            
            .navigationDestination(isPresented: $winModel.isNextAvailible) {
                DifficultyView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WinView()
}

