//
//

import SwiftUI

struct CustomTabBar: View {
    @Binding private var selectedTab: Tab
    
    let tabViews: [Tab: AnyView]
    let tabScreens: [Tab: AnyView]
    var tabHeight: CGFloat = 72
    
    private var screens: [AnyView] {
        self.tabs.compactMap {
            self.tabScreens[$0]
        }
    }
    
    private var tabs: [Tab] {
        self.tabViews.keys.sorted { left, right in
            left.rawValue < right.rawValue
        }
    }
    
    private var screenOffset: CGFloat {
        let tabIndex = self.tabs.firstIndex(of: self.selectedTab) ?? 0
        let cgIndex = CGFloat(tabIndex)
        return -cgIndex * UIScreen.main.bounds.width
    }
    
    init(tabInfo: [TabViewInfo], selectedTab: Binding<Tab>) {
        var tabViews: [Tab: AnyView] = [:]
        var tabScreens: [Tab: AnyView] = [:]
        
        tabInfo.forEach {
            tabViews[$0.tab] = $0.content
            tabScreens[$0.tab] = $0.associatedScreen
        }
        
        self.tabViews = tabViews
        self.tabScreens = tabScreens
        self._selectedTab = selectedTab
    }
    
    private var screenViews: some View {
        HStack(spacing: 0) {
            ForEach(0..<self.screens.count) { index in
                self.screens[index]
                    .frame(width: UIScreen.main.bounds.width)
            }
            .edgesIgnoringSafeArea(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .offset(x: self.screenOffset)
        .animation(.none)
    }
    
    private var tabStack: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(self.tabs, id: \.self) { tab in
                self.getTabView(for: tab)
                    .onTapGesture { self.tabSelected(tab) }
                    .accessibility(hint: Text("Select this tab to change which screen is shown"))
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            self.screenViews
                        
            self.tabStack
                .animation(.none)
                .frame(height: self.tabHeight)
                .layoutPriority(100)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func getTabView(for tab: Tab) -> some View {
        self.tabViews[tab]
    }
    
    private func tabSelected(_ tab: Tab) {
        guard self.tabs.contains(tab) else { return }
        
        self.selectedTab = tab
    }
}

extension CustomTabBar {
    func tabHeight(_ height: CGFloat) -> CustomTabBar {
        var mutable = self
        mutable.tabHeight = height
        return mutable
    }
}
