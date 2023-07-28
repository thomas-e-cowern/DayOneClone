//
//  ListScreen.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI
import RealmSwift

struct ListScreen: View {
    
    @State var entries: [Entry] = []
    
    var body: some View {
        VStack {
            AddEntryView()
            
            Spacer()
            
        }
        .onAppear {
            loadEntries()
        }
    }
    
    func loadEntries () {
        if let realm = try? Realm() {
            entries = realm.objects(Entry.self)
            print(entries.count)
            print(entries[0].text)
            print(entries[0].date)
            print(entries[0].pictures.count)
        }
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
