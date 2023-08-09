//
//  PhotoScreen.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI
import RealmSwift

struct PhotoScreen: View {
    
    @ObservedResults(Picture.self) var pictures
    
    private var gridItemLayout = [GridItem(.fixed(200)), GridItem(.fixed(200))]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout) {
                if (try? Realm()) != nil {
                    ForEach(pictures, id: \.self) { picture in
                        ZStack {
                            
                            Image(uiImage: picture.fullImage())
                                .resizable()
                                .scaledToFit()
                                .overlay (
                                    Text(picture.entry?.entryDateAsString() ?? "No Date")
                                        .foregroundColor(.white)
                                    , alignment: .bottomTrailing
                                )
                
//                            Text(picture.entry?.entryDateAsString() ?? "No Date")
//                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
    
    func getPictures() {
        if (try? Realm()) != nil {
            
        }
    }
}

struct PhotoScreen_Previews: PreviewProvider {
    static var previews: some View {
        PhotoScreen()
    }
}
