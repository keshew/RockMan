import SwiftUI

class RockTutorialViewModel: ObservableObject {
    let contact = RockTutorialModel()
    @Published var isMenuAvailible = false
    @Published var currentIndex = 0
    @Published var isLinkVisible = false
    
    func goToRockMenu() {
        isMenuAvailible = true
    }
    
    func getTextAndSize() -> (String, CGFloat) {
        return (contact.textArray[currentIndex], contact.sizeArray[currentIndex])
    }
}
