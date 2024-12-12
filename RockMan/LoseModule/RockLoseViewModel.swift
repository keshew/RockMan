import SwiftUI

class RockLoseViewModel: ObservableObject {
    let contact = RockLoseModel()
    @Published var isMenuAvailible = false
    @Published var isRetryAvailible = false
    @Published var isKeepAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToRetry() {
        isRetryAvailible = true
    }
    
    func goToPlay() {
        isKeepAvailible = true
    }
}
