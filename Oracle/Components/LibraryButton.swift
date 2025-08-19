import SwiftUI



struct LibraryButton: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var colors: ColorProtocol {
        return ColorSchemeManager(colorScheme: colorScheme).createColorScheme()
    }
    
    let text: String
    let image: String
    
    var body: some View {
        HStack {
            Text("Songs")
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: image)
        }
        .padding(.all)
        .background(colors.BUTTON_BACKGROUND)
        .cornerRadius(5)
    }
}

#Preview {
    LibraryButton(text: "Test", image: "music.note")
    LibraryButton(text: "Test", image: "music.note")
}
