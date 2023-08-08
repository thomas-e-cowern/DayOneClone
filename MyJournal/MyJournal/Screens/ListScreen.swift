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
                .listRowInsets(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
