import SwiftUI
import SpriteKit

struct RockGameView: View {
    @StateObject var gameModel =  RockGameViewModel()
    @StateObject private var rockGameData = RockManGameData()
    
    var body: some View {
            SpriteView(scene: gameModel.createRockGameScene(gameData: rockGameData))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
        
                .navigationDestination(isPresented: $rockGameData.isWin) {
                    RockWinView()
                }
        
                .navigationDestination(isPresented: $rockGameData.isLose) {
                    RockLoseView()
                }
    }
}

#Preview {
    RockGameView()
}

