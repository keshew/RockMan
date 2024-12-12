import SwiftUI

class RockWinViewModel: ObservableObject {
    let contact = RockWinModel()
    @Published var isMenuAvailible = false
    @Published var isNextAvailible = false

    func goToMenu() {
        RockUserDefaultsManager().completeLevel()
        isMenuAvailible = true
    }
    
    func goToNext() {
        RockUserDefaultsManager().completeLevel()
        isNextAvailible = true
    }
}
