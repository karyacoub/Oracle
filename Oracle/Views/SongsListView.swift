import SwiftUI
import Foundation

struct SongsListView: View {
    var songs: [NSDictionary] = []
    
    init() {
        let files: [URL] = AudioFileUtils.getAudioFileURLs()
        
        songs = files.map { file in
            AudioFileUtils.readMetadata(url: file) ?? [:]
        }
    }
    
    var body: some View {
        VStack() {
            ScrollView(.vertical) {
                ForEach(songs, id: \.self) {song in
                    SongListItem(
                        title: song["title"] as! String,
                        artist: song["artist"] as! String,
                        album: song["album"] as! String,
                        durationInSeconds: Double(song["approximate duration in seconds"] as! String) ?? 0.0
                    )
                }
            }
        }
    }
}

#Preview {
    SongsListView()
}
