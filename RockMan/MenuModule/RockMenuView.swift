import SwiftUI

struct RockMenuView: View {
    @StateObject var menuModel =  RockMenuViewModel()
    @State var showSettings = false
    
    func goToSettings() {
        showSettings.toggle()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(ImageName.menuBackground.rawValue)
                    .resizable()
                    .ignoresSafeArea()
                
                if showSettings {
                    RockSettingsView(showSettings: $showSettings)
                        .zIndex(1)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        SmallButton(foregroundImage: ImageName.gear.rawValue,
                                    action: goToSettings)
                    }
                    .padding()
                    
                    Spacer()
                    
                    VStack {
                        Text("THE ROCK GAME")
                            .Jelly(size: 65)
                            .outlineText(color: Color(red: 255/255, green: 0/255, blue: 0/255), width: 1)
                            .frame(width: 340)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Image(ImageName.rockMan.rawValue)
                            .resizable()
                            .frame(minWidth: 150, maxWidth: 200, minHeight: 300, maxHeight: 360)
                        Spacer()
                        WideButton(text: "LEVELS",
                                   action: menuModel.goToLevelDif,
                                   sizeWButton: 250, sizeHButton: 130,
                                   sizeText: 66,
                                   offsetY: 8)
                    }
                }
            }
            .navigationDestination(isPresented: $menuModel.isLevelDifvailible) {
                DifficultyView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RockMenuView()
}

