import Foundation

enum Keys: String {
    case level = "level"
    case isFirstLauchKey = "isFirstLauchKey"
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    func isFirstTime(isFirstLaunch: Bool) {
        if isFirstLaunch {
            UserDefaultsManager.defaults.set(true, forKey: Keys.isFirstLauchKey.rawValue)
        }
    }
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.string(forKey: Keys.level.rawValue) == nil {
            UserDefaultsManager.defaults.set(1, forKey: Keys.level.rawValue)
        }
    }
    
    func completeLevel() {
        let currentFirst = UserDefaultsManager.defaults.object(forKey: Keys.level.rawValue) as? Int ?? 0
        if currentFirst < 25 {
            UserDefaultsManager.defaults.set(currentFirst + 1, forKey: Keys.level.rawValue)
        }
    }
}

