import SwiftUI



struct LibraryButton<Destination: View>: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var colors: ColorProtocol {
        return ColorSchemeManager(colorScheme: colorScheme).createColorScheme()
    }
    
    let text: String
    let image: String
    let destination: Destination
    
    public init(text: String, image: String, @ViewBuilder destination: () -> Destination) {
        self.text = text
        self.image = image
        self.destination = destination()
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Text(text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(colors.PRIMARY_TEXT)
                Image(systemName: image)
                    .foregroundStyle(colors.PRIMARY_TEXT)
            }
            .padding(.all)
            .background(colors.CARD_BACKGROUND)
            .cornerRadius(5)
        }
    }
}

#Preview {
    LibraryButton(text: "Songs", image: "music.note") {
        SongsListView()
    }
//    LibraryButton(text: "Test", image: "music.note")
}
