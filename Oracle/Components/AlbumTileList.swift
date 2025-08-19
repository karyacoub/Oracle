import SwiftUI

struct AlbumTileList: View {
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    AlbumTile().id(0)
                    AlbumTile().id(1)
                    AlbumTile().id(2)
                }
            }
            .padding(.leading)
            .padding(.trailing)
            .onAppear {
                // Delay scroll to ensure layout is ready
                // Fixes bug where horizontal scrollview starts in the center
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    proxy.scrollTo(0, anchor: .leading)
                }
            }
        }
    }
}

#Preview {
    AlbumTileList()
}
