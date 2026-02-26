//
//  ContentView.swift
//  Liquid Glass Demo
//
//  Created by Ron Erez on 04/07/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var morph = false
    
    var spacing: CGFloat {
        morph ? 40 : 0
    }
    
    var body: some View {
        ZStack {
            DogImageFill()

            VStack {
                Text("Hello, world!")
                    .padding()
                    .glassEffect()
                
                GlassEffectContainer(spacing: 30) {
                    HStack(spacing: spacing) {
                        Image(systemName: "scribble.variable")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                            .glassEffect(.regular.tint(.blue))
                        
                        Image(systemName: "eraser.fill")
                            .font(.system(size: 36))
                            .frame(width: 80, height: 80)
                            .glassEffect(.regular.tint(.blue))
                    }
                    .onTapGesture {
                        withAnimation(.bouncy) {
                            morph.toggle()
                        }
                    }
                }
                
            }
        }

    }
}

#Preview {
    ContentView()
}
