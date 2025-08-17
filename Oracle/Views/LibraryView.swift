import SwiftUI

struct LibraryView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Library")
                .font(.largeTitle)
                .padding(.bottom)
                .bold()
            
            Text("Recently Played")
                .font(.title)
                
            AlbumTileList()
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
