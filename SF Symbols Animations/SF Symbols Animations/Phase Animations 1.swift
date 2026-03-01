
import SwiftUI

struct AnimateProperties: Equatable {
    let color: Color
    let bgColor: Color
    let font: Font
    let fontWeight: Font.Weight
    let cornerRadius: CGFloat
    let xScale: CGFloat
    let yScale: CGFloat
    let offsetY: CGFloat
    let rotate: CGFloat
}


struct Phase_Animations_1: View {
    @State private var animateMe = false
    
    let phases: [AnimateProperties] = [
        .init(
            color: .red,
            bgColor: .white,
            font: .title,
            fontWeight: .semibold,
            cornerRadius: 20,
            xScale: 1,
            yScale: 1,
            offsetY: 0,
            rotate: 0),

        .init(
            color: .red,
            bgColor: .black,
            font: .largeTitle,
            fontWeight: .semibold,
            cornerRadius: 20,
            xScale: 1,
            yScale: 1.5,
            offsetY: 0,
            rotate: 30),
        .init(
            color: .blue,
            bgColor: .gray,
            font: .body,
            fontWeight: .thin,
            cornerRadius: 0,
            xScale: 1.5,
            yScale: 1,
            offsetY: 50,
            rotate: 60),
        .init(
            color: .blue,
            bgColor: .gray,
            font: .body,
            fontWeight: .thin,
            cornerRadius: 100,
            xScale: 1.5,
            yScale: 1,
            offsetY: 10,
            rotate: 60),
        .init(
            color: .purple,
            bgColor: .black,
            font: .largeTitle,
            fontWeight: .bold,
            cornerRadius: 50,
            xScale: 1,
            yScale: 1,
            offsetY: -20,
            rotate: 0),
    
    ]
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Hello, World!")
                .phaseAnimator(phases, trigger: animateMe) { view, phase in
                    view
                        .foregroundStyle(phase.color)
                        .font(phase.font)
                        .fontWeight( phase.fontWeight)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: phase.cornerRadius)
                                .fill( phase.bgColor.gradient)
                        )
                        .scaleEffect(
                            x: phase.xScale,
                            y: phase.yScale)
                        .offset(y: phase.offsetY)
                        .rotation3DEffect(
                            Angle(degrees: phase.rotate),
                          axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
                }
            
            
            
            
            Spacer()
            
            Button(action: {
                animateMe.toggle()
            }, label: {
                Text(animateMe ? "Stop" : "Play")
            })
        }
    }
}

#Preview {
    Phase_Animations_1()
}
