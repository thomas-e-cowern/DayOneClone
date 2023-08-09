//
//  EntryDetailView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 8/9/23.
//

import SwiftUI
import RealmSwift

struct EntryDetailView: View {
    
    var entry: Entry
    
    var body: some View {
        EntryDetailHeaderView(date: entry.entryDateAsString())
        ScrollView {

            Text(entry.text)
                .padding(.horizontal, 5)
            
            if entry.pictures.count == 0 {
                Text("There are no pictures for this entry")
            } else {
                ForEach(entry.pictures) { picture in
                    Image(uiImage: picture.fullImage())
                        .resizable()
                        .scaledToFill()
                }
            }
        }
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailView(entry: Entry())
    }
}
