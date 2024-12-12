import SwiftUI

class RockSettingsViewModel: ObservableObject {
    let contact = RockSettingsModel()
    @Published var isMenuAvailible = false
  
    
    func goToRockMenu() {
        isMenuAvailible = true
    }
}
