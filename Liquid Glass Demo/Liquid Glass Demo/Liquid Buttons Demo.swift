//
//  Liquid Buttons Demo.swift
//  Liquid Glass Demo
//
//  Created by Ron Erez on 05/07/2025.
//

import SwiftUI

struct Liquid_Buttons_Demo: View {
    var body: some View {
        ZStack {
            DogImageFit()
            
            VStack {
                Button("Button 1") {}
                    .buttonStyle(.glass)
                
                Button("Button 2") {}
                    .buttonStyle(.glassProminent)
                
                Button("Button 3") {}
                    .padding()
                    .glassEffect()
                
                Button("Button 4") {}
                    .buttonStyle(.borderedProminent)
                    .glassEffect()
            }
            
        }
    }
}

#Preview {
    Liquid_Buttons_Demo()
}
