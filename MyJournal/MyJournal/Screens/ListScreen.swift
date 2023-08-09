//
//  ListScreen.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI
import RealmSwift

struct ListScreen: View {
    
    @ObservedResults(Entry.self) var entries
    
    var body: some View {
        VStack {
            AddEntryView()
            
            Spacer()
            
            if (try? Realm()) != nil {
                List {
                    ForEach(entries.sorted(by: \.date, ascending: false), id: \.self) { entry in
                        EntryListView(entry: entry)
                    }
                } // MARK: End of list
                .listStyle(.insetGrouped)
                
            }
        }
    }
    
    func groupByYear(_ entries: [Entry]) -> [(String, [Entry])] {
        let grouped = Dictionary(grouping: entries, by: { $0.date.formatted(.dateTime.year()) })
            return grouped.sorted(by: { $0.key < $1.key })
        }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
