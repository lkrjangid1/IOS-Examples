

import SwiftUI

struct BlurEffectDemo: View {
    @State private var mainBlurRadius: Double = 10.0
    @State private var redBlurRadius: Double = 10.0
    @State private var blueBlurRadius: Double = 10.0
    
    let blendModes: [BlendMode] = [
        .plusLighter, .softLight, .normal
    ]
    @State private var blendModeIndex = 0
    var blendMode: BlendMode {
        blendModes[blendModeIndex]
    }
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(
                    colors: [.purple, .blue, .green, .orange],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .blur(radius: mainBlurRadius)
                
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 30))
                    .overlay {
                        Text("Cool Blur Effects")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                    }.padding()
                
                // Red circle
                BlendedCircleView(
                    color: .red,
                    circleRadius: 200,
                    offsetX: -100,
                    offsetY: 100,
                    blurRadius: redBlurRadius,
                    blendMode: blendMode
                )
                
                // Blue circle
                BlendedCircleView(
                    color: .blue,
                    circleRadius: 150,
                    offsetX: 120,
                    offsetY: -80,
                    blurRadius: blueBlurRadius,
                    blendMode: blendMode
                )
                
            }
            
            
            // Sliders
            VStack {
                SliderTextView(
                    value: $mainBlurRadius,
                    min: 0,
                    max: 30,
                    text: "main blur radius",
                    color: .purple
                )
                SliderTextView(
                    value: $redBlurRadius,
                    min: 0,
                    max: 50,
                    text: "red blur radius",
                    color: .red
                )
                SliderTextView(
                    value: $blueBlurRadius,
                    min: 0,
                    max: 50,
                    text: "blue blur radius",
                    color: .blue
                )
            }
        }
        .padding()
        .onTapGesture {
            blendModeIndex = (blendModeIndex + 1) % blendModes.count
        }
    }
}

#Preview {
    BlurEffectDemo()
}
