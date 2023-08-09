//
//  EntryListView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 8/8/23.
//

import SwiftUI

struct EntryListView: View {
    
    var entry: Entry
    
    var body: some View {
        HStack {
            if let image = entry.pictures.first {
                Image(uiImage: image.fullImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(15)
                
                Spacer()
            }
            
            Text(entry.text)
                .lineLimit(3)
                
            Spacer()
            
            VStack (alignment: .center) {
                Text("\(entry.date.formatted(.dateTime.weekday()))")
                    .fontWeight(.light)
                Text("\(entry.date, format: .dateTime.day())")
                    .bold()
                    .fontWeight(.heavy)
                Text("\(entry.date, format: .dateTime.year())")
                    .fontWeight(.light)
            }
        } //: End of HStack
        .padding(0)
    }
}

//struct EntryListView_Previews: PreviewProvider {
//
//    var entry: Entry()
//
//    static var previews: some View {
//        EntryListView(entry: entry)
//    }
//}
