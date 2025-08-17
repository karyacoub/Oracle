import SwiftUI

struct AlbumTileList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
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
