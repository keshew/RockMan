import SwiftUI

class TutorialViewModel: ObservableObject {
    let contact = TutorialModel()
    @Published var isMenuAvailible = false
    @Published var currentIndex = 0
    @Published var isLinkVisible = false
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func getTextAndSize() -> (String, CGFloat) {
        return (contact.textArray[currentIndex], contact.sizeArray[currentIndex])
    }
}
