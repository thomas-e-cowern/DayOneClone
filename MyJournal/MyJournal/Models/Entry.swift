//
//  Entry.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/28/23.
//

import Foundation
import RealmSwift

class Entry: Object, Identifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var text = ""
    @Persisted var date = Date()
    @Persisted var pictures = List<Picture>()
    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, d, yyyy"
        return formatter.string(from: date)
    }
}
