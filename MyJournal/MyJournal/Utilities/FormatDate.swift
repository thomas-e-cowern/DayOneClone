//
//  FormatDate.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import Foundation

struct FormatDate {
    
    func dateAsString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
}
