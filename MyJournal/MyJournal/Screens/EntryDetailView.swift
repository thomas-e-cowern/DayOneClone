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
        PhotoScreenHeaderView()
        ScrollView {
            Text(entry.entryDateAsString())
            Text(entry.text)
            
            ForEach(entry.pictures) { picture in
                Image(uiImage: picture.fullImage())
                    .resizable()
                    .scaledToFill()
            }
        }
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailView(entry: Entry())
    }
}
