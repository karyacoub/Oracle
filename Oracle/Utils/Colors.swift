import SwiftUI

public protocol ColorProtocol {
    var PRIMARY_TEXT: Color { get }
    var SECONDARY_TEXT: Color { get }
    var CARD_BACKGROUND: Color { get }
}

private final class DefaultColorsLightMode: ColorProtocol {
    static let shared: ColorProtocol = DefaultColorsLightMode()
    private init() {}
    
    let PRIMARY_TEXT = Color.black
    let SECONDARY_TEXT = Color(red: 0.4, green: 0.4, blue: 0.4)
    let CARD_BACKGROUND = Color(red: 0.93, green: 0.93, blue: 0.93)
}

private final class DefaultColorsDarkMode: ColorProtocol {
    static let shared: ColorProtocol = DefaultColorsDarkMode()
    private init() {}
    
    let PRIMARY_TEXT = Color.white
    let SECONDARY_TEXT = Color(red: 0.6, green: 0.6, blue: 0.6)
    let CARD_BACKGROUND = Color(red: 0.15, green: 0.15, blue: 0.15)
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
