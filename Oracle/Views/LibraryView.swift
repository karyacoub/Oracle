import SwiftUI

struct LibraryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Library")
                .font(.largeTitle)
                .padding(.bottom)
                .bold()
            
            let columns = [
                GridItem(), // left column
                GridItem()  // right column
            ]
            LazyVGrid(columns: columns) {
                LibraryButton(text: "Songs", image: "music.note")
                LibraryButton(text: "Albums", image: "rectangle.stack.fill")
                LibraryButton(text: "Playlists", image: "music.note.list")
                LibraryButton(text: "Favorites", image: "heart.fill")
            }
            .padding(.trailing)
            .padding(.bottom)
            .cornerRadius(10)
            
            Text("Recently Played")
                .font(.title2)

            AlbumTileList()
                .padding(.bottom)
            
            Text("Recently Added")
                .font(.title2)
                
            AlbumTileList()
                .padding(.bottom)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding(.top)
        .padding(.leading)
    }
}

#Preview {
    LibraryView()
}
