//
//  AddEntryView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI

struct AddEntryView: View {
    
    @State private var isEntryShowing: Bool = false
    @State private var isPhotoShowing: Bool = false
    
    var body: some View {
        HStack {
            
            Spacer()
            
            Button {
                // add photo
            } label: {
                Image(systemName: "camera")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .font(.headline)
                    

            }
            
            Spacer()
            
            Button {
                // add entry
                isEntryShowing = true
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .font(.headline)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .background(Color("PrimaryColor"))
        .sheet(isPresented: $isEntryShowing) {
            AddNewJournalEntry()
        }
        
    }
}

struct AddEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryView()
            .previewLayout(.sizeThatFits)
    }
}
