//
//  

import SwiftUI

struct ExampleScreenViewModel {
    /// Gets the system image name for a given tab
    /// - Parameter tab: Tab
    /// - Returns: String
    func getImageName(for tab: Tab) -> String {
        switch tab {
        case .home:
            return "house.fill"
        case .list:
            return "list.bullet.rectangle"
        case .settings:
            return "gearshape"
        case .profile:
            return "person.fill"
        }
    }
    
    /// Gets the text to be shown for a given tab
    /// - Parameter tab: Tab
    /// - Returns: String
    func getText(for tab: Tab) -> String {
        switch tab {
        case .home:
            return "Home"
        case .list:
            return "List"
        case .settings:
            return "Settings"
        case .profile:
            return "Profile"
        }
    }
    
    func getScreen(for tab: Tab) -> some View {
        switch tab {
        case .home:
            return AnyView(HomeScreen())
        case .list:
            return AnyView(ListScreen())
        case .settings:
            return AnyView(SettingsScreen())
        case .profile:
            return AnyView(ProfileScreen())
        }
    }
}
