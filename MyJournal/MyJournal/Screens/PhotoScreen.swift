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
    
    private var gridItemLayout = [GridItem(.fixed(180)), GridItem(.fixed(180))]
    
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    if (try? Realm()) != nil {
                        ForEach(pictures, id: \.self) { picture in
                            ZStack {
                                Image(uiImage: picture.fullImage())
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 180)
                                    .overlay (
                                        Text(picture.entry?.entryDateAsString() ?? "No Date")
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                            .padding(.trailing, 2)
                                        , alignment: .bottomTrailing
                                    )
                            }
                        }
                    }
                }
                .padding()
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
