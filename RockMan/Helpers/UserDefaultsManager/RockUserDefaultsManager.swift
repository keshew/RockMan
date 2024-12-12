import Foundation

enum Keys: String {
    case level = "level"
    case isFirstLauchKey = "isFirstLauchKey"
}

class RockUserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    func isFirstTime(isFirstLaunch: Bool) {
        if isFirstLaunch {
            RockUserDefaultsManager.defaults.set(true, forKey: Keys.isFirstLauchKey.rawValue)
        }
    }
    
    func firstLaunch() {
        if RockUserDefaultsManager.defaults.string(forKey: Keys.level.rawValue) == nil {
            RockUserDefaultsManager.defaults.set(1, forKey: Keys.level.rawValue)
        }
    }
    
    func completeLevel() {
        let currentFirst = RockUserDefaultsManager.defaults.object(forKey: Keys.level.rawValue) as? Int ?? 0
        if currentFirst < 25 {
            RockUserDefaultsManager.defaults.set(currentFirst + 1, forKey: Keys.level.rawValue)
        }
    }
}

