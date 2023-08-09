//
//  PhotoScreen.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI
import RealmSwift

struct PhotoScreen: View {
    
    @ObservedResults(Entry.self) var entries
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
    private var gridItemLayout = [GridItem(.flexible(minimum: 100, maximum: 200)), GridItem(.flexible(minimum: 100, maximum: 200))]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 0) {
                if (try? Realm()) != nil {
                    ForEach(entries, id: \.self) { entry in
                        ForEach(entry.pictures) { picture in
                            Image(uiImage: picture.fullImage())

                        }
                    }
                }
            }
        }
    }
    
    func getPictures() {
        
    }
}

struct PhotoScreen_Previews: PreviewProvider {
    static var previews: some View {
        PhotoScreen()
    }
}
