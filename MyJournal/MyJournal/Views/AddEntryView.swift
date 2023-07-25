//
//  AddEntryView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI

struct AddEntryView: View {
    var body: some View {
        HStack (spacing: 30) {
            Button {
                // add photo
            } label: {
                Image(systemName: "camera")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .font(.headline)
                    

            }

            Button {
                // add entry
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .background(Color("PrimaryColor"))
        
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView()
            .previewLayout(.sizeThatFits)
    }
}
