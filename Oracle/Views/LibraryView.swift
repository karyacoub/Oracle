import SwiftUI

struct LibraryView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var colors: ColorProtocol {
        return ColorSchemeManager(colorScheme: colorScheme).createColorScheme()
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                Text("Library")
                    .font(.largeTitle)
                    .padding(.bottom)
                    .padding(.leading)
                    .bold()
                    .foregroundColor(colors.PRIMARY_TEXT)
                
                let columns = [
                    GridItem(), // left column
                    GridItem()  // right column
                ]
                LazyVGrid(columns: columns) {
                    LibraryButton(text: "Songs", image: "music.note") { SongsListView() }
                    LibraryButton(text: "Albums", image: "rectangle.stack.fill") { SongsListView() }
                    LibraryButton(text: "Playlists", image: "music.note.list") { SongsListView() }
                    LibraryButton(text: "Favorites", image: "heart.fill") { SongsListView() }
                }
                .padding(.trailing)
                .padding(.leading)
                .padding(.bottom)
                .cornerRadius(10)
                
                Text("Recently Played")
                    .font(.title2)
                    .foregroundColor(colors.PRIMARY_TEXT)
                    .padding(.leading)
                
                AlbumTileList()
                    .padding(.bottom)
                
                Text("Recently Added")
                    .font(.title2)
                    .foregroundColor(colors.PRIMARY_TEXT)
                    .padding(.leading)
                    
                AlbumTileList()
                    .padding(.bottom)
                
                Text("For You")
                    .font(.title2)
                    .foregroundColor(colors.PRIMARY_TEXT)
                    .padding(.leading)
                    
                AlbumTileList()
                    .padding(.bottom)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding(.top)
            .defaultScrollAnchor(.top)
        }
    }
}

#Preview {
    LibraryView()
}
