import SwiftUI

class DifficultyViewModel: ObservableObject {
    let contact = DifficultyModel()
    @Published var isMenuAvailible = false
    @Published var isEasyAvailible = false
    @Published var isNormalAvailible = false
    @Published var isHardAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToEasy() {
        isEasyAvailible = true
    }
    
    func goToNormal() {
        isNormalAvailible = true
    }
    
    func goToHard() {
        isHardAvailible = true
    }
}
