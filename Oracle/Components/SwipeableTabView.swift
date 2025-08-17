import SwiftUI

struct SwipeableTabView<Content: View>: View {
    @State private var selectedTab = 0
    
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
//                Color.red.tag(0)
//                Color.green.tag(1)
//                Color.blue.tag(2)
//                Text("Test")
//                self.content
            }
            .tabViewStyle(.page(indexDisplayMode: .never)) // Hides dots
            .animation(.easeInOut, value: selectedTab)
            
            // Custom Tab Bar
            HStack {
//                tabBarItem(title: "Red", tag: 0)
//                tabBarItem(title: "Green", tag: 1)
//                tabBarItem(title: "Blue", tag: 2)
//                self.content
            }
            .padding()
            .background(.ultraThinMaterial)
        }
    }
    
//    private func tabBarItem(title: String, tag: Int) -> some View {
//        VStack {
//            Circle()
//                .fill(tag == selectedTab ? .blue : .gray)
//                .frame(width: 24, height: 24)
//            Text(title)
//                .font(.caption)
//                .foregroundColor(tag == selectedTab ? .blue : .gray)
//        }
//        .onTapGesture { selectedTab = tag }
//        .frame(maxWidth: .infinity)
//    }
}

struct SwipeableTab: View {
    var title: String
//    var tag: Int
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        VStack {
            Circle()
                .fill(self.isSelected ? .blue : .gray)
                .frame(width: 24, height: 24)
            Text(title)
                .font(.caption)
                .foregroundColor(self.isSelected ? .blue : .gray)
        }
//        .onTapGesture { selectedTab = tag }
        .onTapGesture { self.onTap() }
        .frame(maxWidth: .infinity)
    }
}

func test() -> Void {  }

#Preview {
    SwipeableTabView(content: {
        SwipeableTab(title: "Test 1", isSelected: true, onTap: test)
        SwipeableTab(title: "Test 2", isSelected: false, onTap: test)
        SwipeableTab(title: "Test 3", isSelected: false, onTap: test)
    })
}
