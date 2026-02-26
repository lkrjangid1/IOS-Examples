//
//  ContentView.swift
//  Previewable Example
//
//  Created by Ron Erez on 01/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
//    ContentView()
    @Previewable @State var isOn: Bool = false
    let msg = isOn ? "Disable animations" : "Enable animations"
    
    Toggle(isOn: $isOn) {
        Text(msg)
            .font(.title)
    }.padding()
}
