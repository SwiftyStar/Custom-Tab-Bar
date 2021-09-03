//
//  

import SwiftUI

struct TabView: View {
    
    private let image: Image
    private let text: String
    private var color: Color = .blue.opacity(0.4)
    private var backgroundColor: Color = Color(UIColor.systemBackground)
    
    init(image: Image, text: String) {
        self.image = image
        self.text = text
    }

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 8)
            
            self.image
                .resizable()
                .renderingMode(.template)
                .foregroundColor(self.color)
                .frame(width: 24, height: 24)
                .padding(.bottom, 2)
            Text(self.text)
                .font(.subheadline)
                .foregroundColor(self.color)
                .frame(maxWidth: .infinity, alignment: .center)

            Spacer()
        }
        .background(self.backgroundColor)
        .accessibility(hint: Text("Tap for \(self.text) tab"))
    }
}

extension TabView {
    /// Adjusts the color of the tab view's content. Defaults to faded blue
    /// - Parameter color: Color
    /// - Returns: TabView
    func color(_ color: Color) -> TabView {
        var mutable = self
        mutable.color = color
        return mutable
    }
    
    /// Adjusts the background color of the tab. Defaults to system background
    /// - Parameter color: Color
    /// - Returns: TabView
    func backgroundColor(_ color: Color) -> TabView {
        var mutable = self
        mutable.backgroundColor = color
        return mutable
    }
}
