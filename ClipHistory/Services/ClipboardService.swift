//
//  ClipboardService.swift
//  ClipHistory
//
//  Created by Ambrose Blay on 1/7/26.
//

import Foundation


import SwiftUI
import AppKit
import Observation
internal import Combine

@Observable

class ClipboardManager {
    
    var items: [String] = []
    
    var currentText: String = ""
    private var lastChangeCount = NSPasteboard.general.changeCount
    
    init() {
        
        refreshClips()

        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            let pb = NSPasteboard.general
            if pb.changeCount != self.lastChangeCount {
                self.lastChangeCount = pb.changeCount
                let newContent = pb.string(forType: .string) ?? ""
                
                withAnimation {
                    self.items.insert(newContent, at: 0)
                    if self.items.count > 50 { self.items.removeLast() }
                }
                
                Task {
                    writeClip(clip: newContent)
                }
                
            }
        }
    }
    
    func refreshClips() {
        self.items = loadClips()
    }
}
