//
//  ClipboardItem.swift
//  ClipHistory
//
//  Created by Ambrose Blay on 1/7/26.
//

import Foundation

struct ClipboardItem {
    var id : UUID = UUID();
    var content : String;
    var dateCreated : Date = Date()
}
