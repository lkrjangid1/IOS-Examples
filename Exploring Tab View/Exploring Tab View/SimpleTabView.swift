//
//  ContentView.swift
//  Exploring Tab View
//
//  Created by Ron Erez on 30/06/2024.
//

import SwiftUI

struct SimpleTabView: View {
    var body: some View {
        TabView {
            Tab("Watch", systemImage: "play") {
                Text("Watching something")
            }
            Tab("Read", systemImage: "book.pages.fill") {
                Text("Reading a book")
            }
            Tab(role: .search) {
                Text("Search this App...")
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    SimpleTabView()
}
