import SwiftUI

public protocol ColorProtocol {
    var BUTTON_BACKGROUND: Color { get }
    var TEXT: Color { get }
}

private final class DefaultColorsLightMode: ColorProtocol {
    static let shared: ColorProtocol = DefaultColorsLightMode()
    private init() { }
    
    let BUTTON_BACKGROUND = Color(red: 0.7, green: 0.7, blue: 0.7)
    let TEXT = Color(red: 0.9, green: 0.9, blue: 0.9)
}

private final class DefaultColorsDarkMode: ColorProtocol {
    static let shared: ColorProtocol = DefaultColorsDarkMode()
    private init() { }
    
    let BUTTON_BACKGROUND = Color(red: 0.9, green: 0.9, blue: 0.9)
    let TEXT = Color(red: 0.7, green: 0.7, blue: 0.7)
}

public func getColorScheme() -> ColorProtocol {
    @Environment(\.colorScheme) var colorScheme
    
    return colorScheme == .light ? DefaultColorsLightMode.shared : DefaultColorsDarkMode.shared
}
