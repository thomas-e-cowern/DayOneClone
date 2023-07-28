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
            
            if let realm = try? Realm() {
                
                List {
                    ForEach(entries, id: \.self) { entry in
                        Text(entry.text)
                    }
                }
            }
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
