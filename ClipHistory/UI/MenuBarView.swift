//
//  ContentView.swift
//  ClipHistory
//
//  Created by Ambrose Blay on 1/7/26.
//

import SwiftUI

struct ClipboardHistoryView: View {
    
    var items : [String];
    var body: some View {
        Spacer()
        
        VStack(alignment: .leading) {
            Text("Recent Clips")
            
            Divider()
            
            ForEach(items.prefix(10), id: \.self) { item in
                Button(action: {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(item, forType: .string)
                })
                {
                    Text(item)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                .buttonStyle(.plain)
                
                Divider()
                
            }
        }.padding(.leading, 8)
    }
}
