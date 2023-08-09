//
//  EntryDetailView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 8/9/23.
//

import SwiftUI

struct EntryDetailView: View {
    
    var entry: Entry
    
    var body: some View {
        Text("Entry Detail View")
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailView(entry: Entry())
    }
}
