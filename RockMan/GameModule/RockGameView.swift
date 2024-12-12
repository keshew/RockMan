import SwiftUI
import SpriteKit

struct RockGameView: View {
    @StateObject var gameModel =  RockGameViewModel()
    @StateObject private var gameData = RockManGameData()
    
    var body: some View {
            SpriteView(scene: gameModel.createGameScene(gameData: gameData))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        
                .navigationDestination(isPresented: $gameData.isWin) {
                    RockWinView()
                }
        
                .navigationDestination(isPresented: $gameData.isLose) {
                    RockLoseView()
                }
    }
}

#Preview {
    RockGameView()
}

