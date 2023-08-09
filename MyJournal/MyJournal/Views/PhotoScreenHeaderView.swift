//
//  PhotoScreenHeaderView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 8/9/23.
//

import SwiftUI

struct PhotoScreenHeaderView: View {
    var body: some View {
            VStack {
                Text("My Journal")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color("PrimaryColor"))
    }
}

struct PhotoScreenHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoScreenHeaderView()
    }
}
