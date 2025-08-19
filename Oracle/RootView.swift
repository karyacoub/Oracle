import SwiftUI

struct RootView: View {
    
    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Library")
                }
            ForYouView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("For You")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

#Preview {
    RootView()
}
