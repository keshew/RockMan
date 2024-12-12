import SwiftUI

class EasyLevelsViewModel: ObservableObject {
    let contact = EasyLevelsModel()
    @Published var isMenuAvailible = false
    @Published var isGameAvailible = false

    func goToGame() {
        isGameAvailible = true
    }
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func imageFor(number: Int) -> String {
        var imageString = ""
        let currentLevel = RockUserDefaultsManager.defaults.object(forKey: Keys.level.rawValue) as? Int ?? 0
        if currentLevel == number {
            imageString = ImageName.rockManOnLevel.rawValue
        } else if currentLevel > number {
            imageString = ImageName.emptyPin.rawValue
        } else if currentLevel < number {
            imageString = ImageName.lockedPin.rawValue
        }
        return imageString
    }
}
