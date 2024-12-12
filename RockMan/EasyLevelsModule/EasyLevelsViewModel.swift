import SwiftUI

class EasyLevelsViewModel: ObservableObject {
    let contact = EasyLevelsModel()
    @Published var isMenuAvailible = false
    @Published var isGameAvailible = false

    func goToRockGame() {
        isGameAvailible = true
    }
    
    func goToRockMenu() {
        isMenuAvailible = true
    }
    
    func imagesFor(number: Int) -> String {
        var imageString = ""
        let currentLevel = RockUserDefaultsManager.defaults.object(forKey: Keys.level.rawValue) as? Int ?? 0
        if currentLevel == number {
            imageString = RockImageName.rockManOnLevel.rawValue
        } else if currentLevel > number {
            imageString = RockImageName.emptyPin.rawValue
        } else if currentLevel < number {
            imageString = RockImageName.lockedPin.rawValue
        }
        return imageString
    }
}
