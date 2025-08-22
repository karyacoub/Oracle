import AudioToolbox

public protocol AudioFileMetadata {
    var title: String { get set }
    var artist: String { get set }
    var album: String { get set }
    var trackNumber: String { get set }
    var year: Int { get set }
}

public struct AudioFileUtils {
    public static func readMetadata(url: URL) -> NSDictionary? {
        var fileID: AudioFileID? = nil
        var status: OSStatus = AudioFileOpenURL(url as CFURL, .readPermission, kAudioFileFLACType, &fileID)

        guard status == noErr else { return nil }

        var audioFileInfoDict: CFDictionary? = nil
        var albumArtWork: CFData? = nil
        var dataSize = UInt32(MemoryLayout<CFDictionary?>.size(ofValue: audioFileInfoDict))

        guard let audioFile = fileID else { return nil }

        status = AudioFileGetProperty(audioFile, kAudioFilePropertyInfoDictionary, &dataSize, &audioFileInfoDict)
        
        guard status == noErr else { return nil }
        
        // TODO: Get album artwork from file
//        status = AudioFileGetProperty(audioFile, kAudioFilePropertyAlbumArtwork, &dataSize, &albumArtWork)
//        print(status)

        AudioFileClose(audioFile)

        guard let cfDict = audioFileInfoDict else { return nil }

        let tagsDict = NSDictionary.init(dictionary: cfDict)

        return tagsDict
    }
    
    public static func getAudioFileURLs() -> [URL] {
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

        return audioFiles
    }
    
    public static func durationSecondsToMinutes(durationInSeconds: Int) -> String {
        let minutes = (durationInSeconds % 3600) / 60
        let seconds = durationInSeconds % 60
        
        return "\(minutes):\(seconds)"
    }
}
