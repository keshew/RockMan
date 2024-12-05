import SwiftUI
import SpriteKit

struct GameView: View {
    @StateObject var gameModel =  GameViewModel()
    @StateObject private var gameData = GameData()
    
    var body: some View {
            SpriteView(scene: gameModel.createGameScene(gameData: gameData))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        
                .navigationDestination(isPresented: $gameData.isWin) {
                    WinView()
                }
        
                .navigationDestination(isPresented: $gameData.isLose) {
                    LoseView()
                }
    }
}

#Preview {
    GameView()
}

