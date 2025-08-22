import SwiftUI

struct SongListItem: View {
    var title: String
    var artist: String
    var album: String
    var durationInSeconds: Double
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var colors: ColorProtocol {
        return ColorSchemeManager(colorScheme: colorScheme).createColorScheme()
    }
    
    init(title: String, artist: String, album: String, durationInSeconds: Double) {
        self.title = title
        self.artist = artist
        self.album = album
        self.durationInSeconds = durationInSeconds
    }
    
    var body: some View {
        HStack {
            PrimarySystemIcon("music.note")
                .scaledToFit()
                .frame(width: 75, height: 75)
                .foregroundColor(colors.SECONDARY_TEXT)
                .background(colors.CARD_BACKGROUND)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                let itemText = "\(artist) — \(album)"
                
                PrimaryText(title)
                    .lineLimit(1)
                    .truncationMode(.tail)

                SecondaryText(itemText)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .padding(.leading)
            .padding(.trailing)
            
            Spacer()
            
            PrimaryText(AudioFileUtils.durationSecondsToMinutes(durationInSeconds: Int(durationInSeconds)))
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

#Preview {
    SongListItem(title: "Song Title", artist: "Artist", album: "album name", durationInSeconds: 83.0)
    SongListItem(title: "Song Title", artist: "Artist", album: "long album name", durationInSeconds: 93.0)
    SongListItem(title: "Song Title", artist: "Artist", album: "Very long album name", durationInSeconds: 103.0)
    SongListItem(title: "Song Title", artist: "Artist", album: "Very very very long album name", durationInSeconds: 403.0)
}
