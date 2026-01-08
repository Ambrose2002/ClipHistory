//
//  HistoryStore.swift
//  ClipHistory
//
//  Created by Ambrose Blay on 1/7/26.
//

import Foundation


func writeClip(clip: String) {
    
    let fileURL = URL.documentsDirectory.appending(path: "clips.json")
    
    do {
        var current : [String] = loadClips();
        current.append(clip)
        
        let data = try JSONEncoder().encode(current)
        
        try data.write(to: fileURL, options: [.atomic, .completeFileProtection])
    } catch {
        print("Error saving JSON: \(error)")
    }
}


func loadClips() -> [String] {
    let fileURL = URL.documentsDirectory.appending(path: "users.json")
    
    // Check if file exists first
    guard FileManager.default.fileExists(atPath: fileURL.path) else { return [] }
    
    do {

        let data = try Data(contentsOf: fileURL)
        
        // Decode JSON data back into Swift objects
        let clips = try JSONDecoder().decode([String].self, from: data)
        return clips
    } catch {
        print("Error loading JSON: \(error)")
        return []
    }
}
