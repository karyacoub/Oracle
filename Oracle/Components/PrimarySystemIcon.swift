import SwiftUI

struct PrimarySystemIcon: View {
    @Environment(\.colorScheme) var systemColorScheme: ColorScheme
    
    var colors: ColorProtocol {
        return ColorSchemeManager(colorScheme: systemColorScheme).createColorScheme()
    }
    
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        Image(systemName: name).foregroundColor(colors.PRIMARY_TEXT)
    }
}

#Preview {
    PrimarySystemIcon("music.note")
}
