import SwiftUI



struct CardButton<Destination: View>: View {
    @Environment(\.colorScheme) var systemColorScheme: ColorScheme
    
    var colors: ColorProtocol {
        return ColorSchemeManager(colorScheme: systemColorScheme).createColorScheme()
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
                PrimaryText(text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                PrimarySystemIcon(image)
            }
            .padding(.all)
            .background(colors.CARD_BACKGROUND)
            .cornerRadius(5)
        }
    }
}

#Preview {
    CardButton(text: "Songs", image: "music.note") {
        SongsListView()
    }
}
