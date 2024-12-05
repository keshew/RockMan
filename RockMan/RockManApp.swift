import SwiftUI

@main
struct RockManApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
