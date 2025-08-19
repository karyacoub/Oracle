import SwiftUI

struct AlbumTile: View {
    var body: some View {
        VStack {
            Image(systemName: "music.note")
                .resizable()
                .scaledToFit()
                .padding(50)
                .frame(width: 170, height: 170)
                .foregroundColor(getColorScheme().BUTTON_BACKGROUND)
                .background(getColorScheme().TEXT)
                .cornerRadius(10)
            Text("Album Title")
                .bold()
            Text("Artist")
                .foregroundColor(getColorScheme().BUTTON_BACKGROUND)
            
        }
    }
}

#Preview {
    AlbumTile()
}
