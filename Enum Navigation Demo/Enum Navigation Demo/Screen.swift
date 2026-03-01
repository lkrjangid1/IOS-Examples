//
//  Screen.swift
//  Enum Navigation Demo
//
//  Created by Ron Erez on 07/10/2025.
//


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
                        ProfileView(path: $path)
                    case .settings:
                        SettingsView()
                    case .intScreen(let value):
                        IntView(
                            value: value,
                            path: $path
                        )
                    }
                }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings Screen")
            .font(.title)
            .navigationTitle("Settings")
    }
}

struct ProfileView: View {
    @Binding var path: [Screen]
    
    var body: some View {
        VStack {
            Text("Profile Screen")
                .font(.title)
            
            Button("Go to Random Int View") {
                let randomInt = Int.random(in: 1...100)
                path.append(.intScreen(randomInt))
            }
            .padding()
            
            Button("Back to Home") {
                path = []
            }.foregroundStyle(.red)
                .padding()
            
        }
        .navigationTitle("Profile")
        .navigationBarBackButtonHidden()
    }
}

struct IntView: View {
    let value: Int
    @Binding var path: [Screen]
    
    var body: some View {
        VStack {
            Button("Go to Random Int View") {
                let randomInt = Int.random(in: 1...100)
                path.append(.intScreen(randomInt))
            }
            .padding()
            
            Button("Back to Home") {
                path = []
            }.foregroundStyle(.red)
            .padding()
        }
        .navigationTitle("Int View: \(value)")
    }
}

#Preview {
    Enum_Navigation_Demo()
}
