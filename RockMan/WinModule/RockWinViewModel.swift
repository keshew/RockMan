import SwiftUI

class RockWinViewModel: ObservableObject {
    let contact = RockWinModel()
    @Published var isMenuAvailible = false
    @Published var isNextAvailible = false

    func goToRockMenu() {
        RockUserDefaultsManager().completeRockLevel()
        isMenuAvailible = true
    }
    
    func goToNext() {
        RockUserDefaultsManager().completeRockLevel()
        isNextAvailible = true
    }
}
