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
    
    
}
