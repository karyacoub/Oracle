import SwiftUI

public protocol ColorProtocol {
    var BUTTON_BACKGROUND: Color { get }
    var TEXT: Color { get }
    var SUBTEXT: Color { get }
}

private final class DefaultColorsLightMode: ColorProtocol {
    static let shared: ColorProtocol = DefaultColorsLightMode()
    private init() {}
    
    let BUTTON_BACKGROUND = Color(red: 0.7, green: 0.7, blue: 0.7)
    let TEXT = Color(red: 0.9, green: 0.9, blue: 0.9)
    let SUBTEXT = Color(red: 0.9, green: 0.9, blue: 0.9)
}

private final class DefaultColorsDarkMode: ColorProtocol {
    static let shared: ColorProtocol = DefaultColorsDarkMode()
    private init() {}
    
    let BUTTON_BACKGROUND = Color(red: 0.15, green: 0.15, blue: 0.15)
    let TEXT = Color(red: 0.9, green: 0.9, blue: 0.9)
    let SUBTEXT = Color(red: 0.6, green: 0.6, blue: 0.6)
}

public struct ColorSchemeManager {
    
    let colorScheme: ColorScheme
    
    public init(colorScheme: ColorScheme) {
        self.colorScheme = colorScheme
    }
    
    func createColorScheme() -> ColorProtocol {
        return colorScheme == .dark
            ? DefaultColorsDarkMode.shared
            : DefaultColorsLightMode.shared
    }
}

public func getColorScheme(colorScheme: ColorScheme) -> ColorProtocol {
    return colorScheme == .dark
        ? DefaultColorsDarkMode.shared
        : DefaultColorsLightMode.shared
}

#Preview {
    LibraryView()
}
