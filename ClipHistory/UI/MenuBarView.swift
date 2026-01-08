//
//  ContentView.swift
//  ClipHistory
//
//  Created by Ambrose Blay on 1/7/26.
//

import SwiftUI

struct ClipboardHistoryView: View {
    
    var items : [ClipboardItem];
    var body: some View {
        Spacer()
        
        VStack(alignment: .leading) {
            Text("Recent Clips")
            
            Divider()
            
            ForEach(items.prefix(10)) { item in
                Button(action: {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(item.content, forType: .string)
                })
                {
                    Text(item.content)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                .buttonStyle(.plain)
                
                Divider()
                
            }
        }.padding(.leading, 8)
    }
}
