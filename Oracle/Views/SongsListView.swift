import SwiftUI
import Foundation

struct SongsListView: View {
    
    func listFiles() -> [URL] {
        // Get the app's Documents directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let fileManager = FileManager.default
        
        do {
            // Get all files in the directory
            let files = try fileManager.contentsOfDirectory(
                at: documentsDirectory,
                includingPropertiesForKeys: nil,
                options: [.skipsHiddenFiles]
            )
                
            // Filter only audio files (e.g., mp3, wav, m4a)
            let audioFiles = files.filter { $0.pathExtension.lowercased() == "mp3" ||
                                            $0.pathExtension.lowercased() == "wav" ||
                                            $0.pathExtension.lowercased() == "m4a" }
                return audioFiles
            } catch {
                print("Error reading directory: \(error)")
                return []
            }
    }
    
    var body: some View {
        let files: String = listFiles().map { $0.absoluteString }.joined(separator: "\n")
        VStack {
            Text("Files:")
            Text(files)
        }
    }
}

#Preview {
    SongsListView()
}
