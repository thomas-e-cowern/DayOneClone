//
//  MenuView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            AddEntryView()
            
            Spacer()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
