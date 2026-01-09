//
//  ClipHistoryApp.swift
//  ClipHistory
//
//  Created by Ambrose Blay on 1/7/26.
//

import SwiftUI


@main
struct ClipHistoryApp: App {
    
    @State private var clipboard = ClipboardManager()

    var body: some Scene {
        MenuBarExtra("ClipHistory", systemImage: "list.bullet.clipboard") {
            ClipboardHistoryView(manager: clipboard, items: clipboard.items)
            
        }
        .menuBarExtraStyle(.window)
    }
}
