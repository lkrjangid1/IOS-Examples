//
//  ContentView.swift
//  Dynamic Navigation with NavigationPath
//
//  Created by Ron Erez on 07/10/2025.
//

import SwiftUI

struct User: Hashable {
    let name: String
    let age: Int
}

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Button("Go to Int 42") {
                    path.append(42)
                }
                
                Button("Go to String 'Hello'") {
                    path.append("Hello")
                }
                
                Button("Go to User Struct") {
                    path.append(User(name: "Bob", age: 23))
                }
                
                Button("Go through a chain") {
                    path.append(42)
                    path.append("Hello again")
                    path.append(User(name: "Alice", age: 24))
                }
            }
            .navigationTitle("Home Screen")
            .navigationDestination(for: Int.self) { value in
                IntView(value: value)
            }
            .navigationDestination(for: String.self) { text in
                StringView(text: text)
            }
            .navigationDestination(for: User.self) { user in
                UserView(user: user)
            }
        }
    }
}

struct IntView: View {
    let value: Int

    var body: some View {
        VStack(spacing: 20) {
            Text("Int View")
                .font(.headline)
            Text("Value: \(value)")
                .font(.title)
        }
    }
}

struct StringView: View {
    let text: String

    var body: some View {
        VStack(spacing: 20) {
            Text("String View")
                .font(.headline)
            Text(text)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct UserView: View {
    let user: User
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("User View")
                .font(.headline)
            Text("Name: \(user.name)")
            Text("Age: \(user.age)")
            
            Button("Go Back") {
                dismiss()
            }
        }
        .font(.title2)
    }
}


#Preview {
    ContentView()
}
