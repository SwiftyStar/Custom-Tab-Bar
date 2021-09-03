//
//

import SwiftUI

/// To be customized as per the application
enum Tab: Int, CaseIterable {
    case home
    case list
    case settings
    case profile
}

struct TabViewInfo {
    /// The screen to show when the tab is selected
    let associatedScreen: AnyView
    /// The content of the tab itself
    let content: AnyView
    /// Tab enum case
    let tab: Tab
    
    init<AssociatedScreen: View, Content: View>(associatedScreen: AssociatedScreen, tab: Tab, @ViewBuilder content: () -> Content) {
        self.associatedScreen = AnyView(associatedScreen)
        self.content = AnyView(content())
        self.tab = tab
    }
}
