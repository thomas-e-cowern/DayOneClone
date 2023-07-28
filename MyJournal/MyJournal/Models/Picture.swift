//
//  Picture.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/28/23.
//

import Foundation
import SwiftUI
import RealmSwift

class Picture: Object {
    @Persisted var fullImageName = ""
    @Persisted var thumbnailName = ""
    @Persisted var entry: Entry?
}
