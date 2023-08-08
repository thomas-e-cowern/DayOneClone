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
                    ForEach(entries, id: \.self) { entry in
                        HStack {
                            Image(systemName: "photo.artframe")
                                .font(.system(size: 65))
                            VStack (alignment: .leading) {
                                Text("\(FormatDate().dateAsString(date: entry.date))")
                                    .bold()
                                Text(entry.text)
                            }
                        }
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
