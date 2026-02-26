//
//  Exploring Glass Effect.swift
//  Liquid Glass Demo
//
//  Created by Ron Erez on 05/07/2025.
//

import SwiftUI

struct Exploring_Glass_Effect: View {
    @State private var tapped = false
    @State private var spacing = 20.0
    let factor = 5.0
    
    var radius: CGFloat {
        tapped ? 0 : 20
    }
    
    var body: some View {
        ZStack {
            Image(.dogInNature)
                .resizable()
                .scaledToFit()
                .opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                Text("Tap Me!")
                    .font(.title)
                    .padding()
                    .glassEffect(
                        .regular.tint(tapped ? .red.opacity(0.3) : .clear),
                        in: .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: radius,
                            bottomTrailingRadius: 20,
                            topTrailingRadius: radius,
                            style: .circular
                        )
                    )
                    .onTapGesture {
                        withAnimation {
                            tapped.toggle()
                        }
                    }
                
                Image(systemName: "pawprint")
                    .font(.title)
                    .padding()
                    .glassEffect(
                        .regular.tint(.red),
                        in: .circle
                    )
                
                GlassEffectContainer {
                    HStack(spacing: spacing) {
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(
                                .regular.interactive(false).tint(.green),
                                in: .circle
                            )
                        
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(
                                .regular.interactive(true).tint(.mint),
                                in: .circle
                            )
                        
                        
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(
                                .regular.interactive(false).tint(.indigo),
                                in: .circle
                            )
                            .disabled(tapped)
                        
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(
                                .regular.interactive(true).tint(.brown),
                                in: .circle
                            )
                            .disabled(tapped)
                        
                        
                    }
                }
                
                GlassEffectContainer {
                    ZStack {
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(
                                .regular.interactive(false).tint(.green),
                                in: .circle
                            )
                            .offset(x: -spacing * factor)
                        
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(
                                .regular.interactive(true).tint(.mint),
                                in: .circle
                            )
                            .offset(x: -spacing * 2 * factor, y: -spacing * factor)
                        
                        
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(
                                .regular.interactive(false).tint(.indigo),
                                in: .circle
                            )
                            .disabled(tapped)
                            .offset(x: spacing * factor)
                        
                        Image(systemName: "pawprint")
                            .font(.title)
                            .padding()
                            .glassEffect(
                                .regular.interactive(true).tint(.brown),
                                in: .circle
                            )
                            .disabled(tapped)
                            .offset(x: spacing * 2 * factor)
                        
                    }
                }
                
                Slider(value: $spacing, in: 0 ... 50)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    Exploring_Glass_Effect()
}
