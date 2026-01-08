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
    
    var items: [ClipboardItem] = []
    
    var currentText: String = ""
    private var lastChangeCount = NSPasteboard.general.changeCount
    
    init() {
        
        refreshClips()

        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            let pb = NSPasteboard.general
            if pb.changeCount != self.lastChangeCount {
                self.lastChangeCount = pb.changeCount
                let newContent = pb.string(forType: .string) ?? ""
                
                let clipItem : ClipboardItem = ClipboardItem(content: newContent)
                
                withAnimation {
                    self.items.insert(clipItem, at: 0)
                    if self.items.count > 50 { self.items.removeLast() }
                }
                
                Task {
                    writeClip(clip: clipItem)
                }
                
            }
        }
    }
    
    func refreshClips() {
        self.items = loadClips()
    }
}
