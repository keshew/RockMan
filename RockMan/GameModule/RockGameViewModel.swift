import SwiftUI

class RockGameViewModel: ObservableObject {
    let contact = RockGameModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func createGameScene(gameData: RockManGameData) -> RockManGameSpriteKit {
        let scene = RockManGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
