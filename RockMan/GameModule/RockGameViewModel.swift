import SwiftUI

class RockGameViewModel: ObservableObject {
    let contact = RockGameModel()
    @Published var isMenuAvailible = false

    func goToRockMenu() {
        isMenuAvailible = true
    }
    
    func createRockGameScene(gameData: RockManGameData) -> RockManGameSpriteKit {
        let scene = RockManGameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
