import SwiftUI

class WinViewModel: ObservableObject {
    let contact = WinModel()
    @Published var isMenuAvailible = false
    @Published var isNextAvailible = false

    func goToMenu() {
        UserDefaultsManager().completeLevel()
        isMenuAvailible = true
    }
    
    func goToNext() {
        UserDefaultsManager().completeLevel()
        isNextAvailible = true
    }
}
