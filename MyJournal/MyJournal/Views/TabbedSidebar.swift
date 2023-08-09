//
//  TabbedSidebar.swift
//  MyJournal
//
//  Created by Thomas Cowern on 7/25/23.
//

import SwiftUI

struct TabbedSidebar: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @State private var selection: Int = 1
    
    var body: some View {
        if sizeClass == .compact {
            TabView {
                ListScreen()
                    .tabItem {
                        Label("List", systemImage: "list.dash")
                    }
                    .tag(1)
                PhotoScreen()
                    .tabItem {
                        Label("Photo", systemImage: "photo")
                    }
                    .tag(2)
            }
            
        } else {
            NavigationView {
                List {
                    NavigationLink(destination: ListScreen()) {
                        Label {
                            Text("List")
                        } icon: {
                            Image(systemName: "list.dash")
                        }
                    }

                    NavigationLink(destination: PhotoScreen()) {
                        Label {
                            Text("Photo")
                        } icon: {
                            Image(systemName: "photo")
                        }
                    }
                }
                .navigationTitle("My Journal")
                .navigationSplitViewStyle(.balanced)

                Text("Please use the sidbar to make a selection")
                    .font(.largeTitle)
            }
        }
    }
}

struct TabbedSideBar_Previews: PreviewProvider {
    static var previews: some View {
        TabbedSidebar()
    }
}
