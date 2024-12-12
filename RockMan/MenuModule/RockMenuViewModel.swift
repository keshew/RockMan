import SwiftUI

class RockMenuViewModel: ObservableObject {
    let contact = RockMenuModel()
    @Published var isLevelDifvailible = false
  
    
    func goToLevelDif() {
        isLevelDifvailible = true
    }
}
