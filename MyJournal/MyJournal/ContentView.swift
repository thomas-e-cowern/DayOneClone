//
//  ContentView.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
