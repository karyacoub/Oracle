import SwiftUI
import Foundation

struct SongsListView: View {
    
    func listFiles() -> [URL] {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return []
        }

        let fileManager = FileManager.default
        var audioFiles: [URL] = []
        let enumeratorErrorHandler : (URL, Error) -> Bool = { (url, error) -> Bool in
            print("Error accessing \(url): \(error)")
            return true
        }
    
        
        if let enumerator = fileManager.enumerator(
            at: documentsDirectory,
            includingPropertiesForKeys: nil,
            options: [.skipsHiddenFiles],
            errorHandler: enumeratorErrorHandler
        ) {
            for case let fileURL as URL in enumerator {
                let ext = fileURL.pathExtension.lowercased()
                if ["mp3", "wav", "m4a"].contains(ext) {
                    audioFiles.append(fileURL)
                }
            }
        }

        print("Audio files: \(audioFiles)")
        return audioFiles
    }
    
    var body: some View {
        let files: String = listFiles().map { $0.lastPathComponent }.joined(separator: "\n")
        
        VStack {
            Text("Files:")
            Text(files)
        }
    }
}

#Preview {
    SongsListView()
}
