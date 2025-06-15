import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Tab("Library", systemImage: "folder") {
                LibraryView()
            }
            Tab("For You", systemImage: "heart.fill") {
                ForYouView()
            }
            Tab("Browse", systemImage: "music.note") {
                BrowseView()
            }
            Tab("Search", systemImage: "magnifyingglass") {
                SearchView()
            }
        }
    }
}

#Preview {
    RootView()
}
