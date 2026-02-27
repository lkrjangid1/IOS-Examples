//
//  Environment_ExampleApp.swift
//  Environment Example
//
//  Created by Ron Erez on 02/01/2024.
//

import SwiftUI

@main
struct Environment_ExampleApp: App {
    @State private var personViewModel = PersonViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(personViewModel)
        }
    }
}
