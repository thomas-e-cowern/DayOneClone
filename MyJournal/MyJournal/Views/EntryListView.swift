//
//  EntryListView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 8/8/23.
//

import SwiftUI

struct EntryListView: View {
    
    private var entry: Entry
    
    var body: some View {
        HStack {
            if let image = entry.pictures.first {
                Image(uiImage: image.fullImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
            }

            VStack (alignment: .leading) {
                Text("\(FormatDate().dateAsString(date: entry.date))")
                    .bold()
                Text(entry.text)
            }
    } //: End of HStack
}

//struct EntryListView_Previews: PreviewProvider {
//
//    var entry: Entry()
//
//    static var previews: some View {
//        EntryListView(entry: entry)
//    }
//}
