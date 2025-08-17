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
                HStack {
                    Text("Songs")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "music.note")
                }
                .padding(.all)
                .background(Colors.GRAY)
                
                HStack {
                    Text("Albums")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "rectangle.stack.fill")
                }
                .padding(.all)
                .background(Colors.GRAY)
                
                HStack {
                    Text("Playlists")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "music.note.list")
                }
                .padding(.all)
                .background(Colors.GRAY)
                
                HStack {
                    Text("Favorites")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "heart.fill")
                }
                .padding(.all)
                .background(Colors.GRAY)
            }
            .padding(.trailing)
            .padding(.bottom)
            .cornerRadius(10)
            
            Text("Recently Played")
                .font(.title)

            AlbumTileList()
                .padding(.bottom)
            
            Text("Recently Added")
                .font(.title)
                
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
