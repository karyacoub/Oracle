import Foundation

public struct FileStorageUtils {
    
    // creates placeholder file so that app directory shows up in Files app
    public static func createPlaceholderFile() {
        guard let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Could not get documents directory")
            return
        }
        
        let placeholderURL = documentsURL.appendingPathComponent("placeholder.txt")
            
        do {
            try "Place your music in this directory!".write(to: placeholderURL, atomically: true, encoding: .utf8)
            print("Created placeholder file")
        } catch {
            print("Could not create placeholder file: \(error.localizedDescription)")
        }
    }
}
