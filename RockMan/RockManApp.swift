import SwiftUI

@main
struct RockManApp: App {
    var body: some Scene {
        WindowGroup {
            RockMenuView()
                .onAppear {
                    RockUserDefaultsManager().firstLaunch()
                }
        }
    }
}
