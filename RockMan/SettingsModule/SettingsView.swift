import SwiftUI

struct SettingsView: View {
    @StateObject var settingsModel =  SettingsViewModel()
    @Binding var showSettings: Bool
    
    func goToSettings() {
        showSettings = false
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
            .ignoresSafeArea()
        
            VStack {
                ZStack {
                    Image(ImageName.settingsBackground.rawValue)
                        .resizable()
                        .frame(width: 300, height: 300)
                    
                    Text("SETTINGS")
                        .Jomhuria(size: 50, color: .white)
                        .outlineText(color: Color(red: 255/255, green: 0/255, blue: 0/255), width: 1)
                        .offset(y: -70)
                    
                    Text("MUSIC")
                        .Jelly(size: 30, color: Color(#colorLiteral(red: 152/255, green: 12/255, blue: 14/255, alpha: 1)))
                        .offset(y: -30)
                    
                    Image(ImageName.lineSettings.rawValue)
                        .resizable()
                        .frame(width: 160, height: 5)
                    
                    Button(action: {
                        
                    }) {
                        Image(ImageName.linePin.rawValue)
                            .resizable()
                            .frame(width: 20, height: 30)
                    }
                    
                    Text("SOUND")
                        .Jelly(size: 30, color: Color(#colorLiteral(red: 152/255, green: 12/255, blue: 14/255, alpha: 1)))
                        .offset(y: 40)
                    
                    Image(ImageName.lineSettings.rawValue)
                        .resizable()
                        .frame(width: 160, height: 5)
                        .offset(y: 70)
                    
                    Button(action: {
                        
                    }) {
                        Image(ImageName.linePin.rawValue)
                            .resizable()
                            .frame(width: 20, height: 30)
                    }
                    .offset(y: 70)
                    
                    Button(action: {
                        goToSettings()
                    }) {
                        Image(ImageName.cancelButton.rawValue)
                            .resizable()
                            .frame(width: 60, height: 60)
                            
                    }
                    .offset(y: 130)
                }
            }
        }
    }
}

//#Preview {
//    SettingsView()
//}

