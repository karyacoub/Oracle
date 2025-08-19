import SwiftUI

struct AlbumTile: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var colors: ColorProtocol {
        return ColorSchemeManager(colorScheme: colorScheme).createColorScheme()
    }
    
    var body: some View {
        VStack {
            Image(systemName: "music.note")
                .resizable()
                .scaledToFit()
                .padding(50)
                .frame(width: 170, height: 170)
                .foregroundColor(colors.SUBTEXT)
                .background(colors.BUTTON_BACKGROUND)
                .cornerRadius(10)
            Text("Album Title")
                .bold()
            Text("Artist")
                .foregroundColor(colors.SUBTEXT)
            
        }
    }
}

#Preview {
    AlbumTile()
}
