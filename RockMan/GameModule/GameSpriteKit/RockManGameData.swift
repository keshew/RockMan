import Foundation

class RockManGameData: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
    @Published var isMenu = false
    @Published var countOfLives = 3.0
    @Published var timeLeft = 30
}
