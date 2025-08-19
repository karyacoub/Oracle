import SwiftUI

struct AlbumTileList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                AlbumTile()
                AlbumTile()
                AlbumTile()
            }
        }
    }
}

#Preview {
    AlbumTileList()
}
