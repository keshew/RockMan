import SwiftUI

class MenuViewModel: ObservableObject {
    let contact = MenuModel()
    @Published var isLevelDifvailible = false
  
    
    func goToLevelDif() {
        isLevelDifvailible = true
    }
}
