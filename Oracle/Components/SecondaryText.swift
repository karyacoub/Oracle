import SwiftUI

struct SecondaryText: View {
    @Environment(\.colorScheme) var systemColorScheme: ColorScheme
    
    var colors: ColorProtocol {
        return ColorSchemeManager(colorScheme: systemColorScheme).createColorScheme()
    }
    
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text).foregroundColor(colors.SECONDARY_TEXT)
    }
}

#Preview {
    SecondaryText("This is a test")
}
