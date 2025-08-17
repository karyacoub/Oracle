import SwiftUI

struct AlbumTile: View {
    var body: some View {
        
        Image(systemName: "music.note")
            .resizable()
            .scaledToFit()
            .padding(50)
            .frame(width: 170, height: 170)
            .foregroundColor(Colors.DARK_GRAY)
            .background(Colors.GRAY)
            .cornerRadius(10)
    }
}

#Preview {
    AlbumTile()
}
