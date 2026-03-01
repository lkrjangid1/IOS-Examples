//
//  MainView.swift
//  Text Exploration
//
//  Created by Ron Erez on 26/04/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Acrostic Poems") {
                    AcrosticPoemView()
                }
                NavigationLink("Markdown") {
                    Markdown_Demo()
                }
                NavigationLink("Markdown and String Interpolation") {
                    Markdown_and_String_Interpolation_Demo()
                }
                NavigationLink("Markdown and Code") {
                    Displaying_Code_with_Markdown()
                }
                NavigationLink("OpenURLAction") {
                    OpenURLAction_Demo()
                }
                NavigationLink("Pluralization and Inflection") {
                    Pluralization_Demo()
                }
                NavigationLink("List, Memberstyle and Measurements") {
                    List_MemberStyle_Measurements_Demo()
                }
                NavigationLink("Dates and the Text View") {
                    Text_Dates_Demo()
                }
                NavigationLink("Attributed String") {
                    Attributed_String_Demo()
                }
            }.navigationTitle("Style and Text View")
        }
    }
}

#Preview {
    MainView()
}
