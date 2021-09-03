# Custom-Tab-Bar
A custom tab bar built in SwiftUI, giving you more opportunities for customization.

# Notes
With this implementation, each screen should take all available height. This is easy since most fullscreens will use a VStack with a spacer or some other View that takes all available height.

In the example, I have just an image with text for the TabView, but you should be able to use any View you'd like.

The height of the tab bar should take into consideration the height of the views in it. I just used a static value in the example, but this should be derived by some logic.

You may want some EnvironmentObject or other method that is updated when a new tab is selected - if you want to be able to perform some other actions when they are selected.

# Example

iPhone 8

![Simulator Screen Shot - iPhone 8 - 2021-09-02 at 19 12 05](https://user-images.githubusercontent.com/81925718/131932259-a80c2f1c-6b35-4503-a018-eefb9c318ed1.png)

iPhone 11

![Simulator Screen Shot - iPhone 11 - 2021-09-02 at 19 15 10](https://user-images.githubusercontent.com/81925718/131932268-2a638ba1-3245-4ae7-b771-42ef3256cba0.png)

