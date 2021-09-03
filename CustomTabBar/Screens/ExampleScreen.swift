//
//  

import SwiftUI

struct ExampleScreen: View {
    @State private var selectedTab: Tab = .home
    
    private let viewModel = ExampleScreenViewModel()
    
    private var tabInfo: [TabViewInfo] {
        var tabs: [TabViewInfo] = []
        
        for tab in Tab.allCases {
            let image = Image(systemName: self.viewModel.getImageName(for: tab))
            let text = self.viewModel.getText(for: tab)
            let color: Color = tab == self.selectedTab ? .blue : .blue.opacity(0.4)
            
            let tabView = TabView(image: image, text: text)
                .color(color)
                .backgroundColor(Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255))
            
            let screen = self.viewModel.getScreen(for: tab)
            let newTab = TabViewInfo(associatedScreen: screen,
                                     tab: tab,
                                     content: { tabView })
            
            
            tabs.append(newTab)
        }
        
        return tabs
    }
    
    var body: some View {
        GeometryReader { geometry in
            CustomTabBar(tabInfo: self.tabInfo, selectedTab: self.$selectedTab)
                .tabHeight(56 + geometry.safeAreaInsets.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleScreen()
    }
}
