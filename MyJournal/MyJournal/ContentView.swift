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
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
            
            PhotoView()
                .tabItem {
                    Label("Photo", systemImage: "photo")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
