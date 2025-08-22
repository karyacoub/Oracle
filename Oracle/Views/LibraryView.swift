import SwiftUI

struct LibraryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                PrimaryText("Library")
                    .font(.largeTitle)
                    .padding(.bottom)
                    .padding(.leading)
                    .bold()
                
                let columns = [
                    GridItem(), // left column
                    GridItem()  // right column
                ]
                LazyVGrid(columns: columns) {
                    CardButton(text: "Songs", image: "music.note") {
                        SongsListView()
                    }
                    CardButton(text: "Albums", image: "rectangle.stack.fill") {
                        SongsListView()
                    }
                    CardButton(text: "Playlists", image: "music.note.list") { SongsListView()
                    }
                    CardButton(text: "Favorites", image: "heart.fill") {
                        SongsListView()
                    }
                }
                .padding(.trailing)
                .padding(.leading)
                .padding(.bottom)
                .cornerRadius(10)
                
                PrimaryText("Recently Played")
                    .font(.title2)
                    .padding(.leading)
                
                AlbumTileList()
                    .padding(.bottom)
                
                PrimaryText("Recently Added")
                    .font(.title2)
                    .padding(.leading)
                    
                AlbumTileList()
                    .padding(.bottom)
                
                PrimaryText("For You")
                    .font(.title2)
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
