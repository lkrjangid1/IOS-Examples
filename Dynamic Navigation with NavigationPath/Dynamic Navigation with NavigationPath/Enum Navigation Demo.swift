//
//  Enum Navigation Demo.swift
//  Dynamic Navigation with NavigationPath
//
//  Created by Ron Erez on 07/10/2025.
//

import SwiftUI

enum Screen: Hashable {
    case profile
    case settings
    case intScreen(Int)
}

struct Enum_Navigation_Demo: View {
    @State private var path: [Screen] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Button("Go to Profile") {
                    path.append(.profile)
                }
                Button("Go to Settings") {
                    path.append(.settings)
                }
                Button("Go to Random Int View") {
                    let randomInt = Int.random(in: 1...100)
                    path.append(.intScreen(randomInt))
                }
            }.navigationTitle("Home")
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .profile:
                        Text("Profile View")
                    case .settings:
                        Text("Settings View")
                    case .intScreen(let value):
                        Text("View \(value)")
                    }
                }
        }
    }
}

#Preview {
    Enum_Navigation_Demo()
}
