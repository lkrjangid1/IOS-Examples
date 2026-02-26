//
//  BlendedCircleView.swift
//  Explore Blur Effects
//
//  Created by Ron Erez on 08/09/2024.
//

import SwiftUI

struct BlendedCircleView: View {
    let color: Color
    let circleRadius: Double
    let offsetX: Double
    let offsetY: Double
    let blurRadius: Double
    let blendMode: BlendMode
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: circleRadius, height: circleRadius)
            .offset(x: offsetX, y: offsetY)
            .blur(radius: blurRadius)
            .blendMode(blendMode)
    }
}

#Preview {
    BlendedCircleView(
        color: .red,
        circleRadius: 50,
        offsetX: 100,
        offsetY: -100,
        blurRadius: 10,
        blendMode: .normal
    )
}
