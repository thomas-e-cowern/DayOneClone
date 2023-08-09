//
//  EntryDetailHeaderView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 8/9/23.
//

import SwiftUI

struct EntryDetailHeaderView: View {
    
    var date: String
    
    var body: some View {
        VStack {
            Text(date)
                .foregroundColor(.white)
            .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color("PrimaryColor"))
    }
}

struct EntryDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailHeaderView(date: "Jan 1, 2023")
    }
}
