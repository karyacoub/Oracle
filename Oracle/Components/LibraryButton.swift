import SwiftUI



struct LibraryButton: View {
    
    let text: String
    let image: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Text("Songs")
                .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: image)
        }
        .padding(.all)
        .background(getColorScheme().TEXT)
        .cornerRadius(5)
    }
}

#Preview {
    LibraryButton(text: "Test", image: "music.note")
    LibraryButton(text: "Test", image: "music.note")
}
