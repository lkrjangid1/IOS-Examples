

import SwiftUI

struct SF_Symbols_Content_Transitions: View {
    @State private var clicked = false
    @State private var pauseGlobe = false
    @State private var runCount = 1
    @State private var layerAnimate = true
    @State private var animationRunning = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: clicked ? "person.fill" : "globe")
                    .imageScale(.large)
                    .symbolEffectsRemoved(pauseGlobe)
                    .symbolEffect(.bounce, value: clicked)
                    .contentTransition(
                        .symbolEffect(.replace
                            .byLayer.downUp)
                    )
                    .padding()
                
                Image(systemName: clicked ? "person.fill" : "globe")
                    .imageScale(.large)
                    .symbolEffectsRemoved(pauseGlobe)
                    .symbolEffect(.pulse.wholeSymbol, value: clicked)
                    .contentTransition(
                        .symbolEffect(.replace
                            .wholeSymbol.downUp)
                    )
                    .padding()
            }.padding()
            
            // Buttons
            HStack {
                Button(action: {
                    clicked.toggle()
                }, label: {
                    Text("Click Me")
                        .font(.headline)
                        .foregroundStyle(.orange)
                        .bold()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5)
                            .fill(.black))
                })

                Button(action: {
                    pauseGlobe.toggle()
                }, label: {
                    Text(pauseGlobe ? "Unpause Globe" : "Pause Globe")
                        .font(.headline)
                        .foregroundStyle(pauseGlobe ? .red : .cyan)
                        .bold()
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5)
                            .fill(.black))
                })

            }
            
            Button(action: {
                runCount += 1
            }, label: {
                Label("Hello World \(runCount) !", systemImage: "figure.run.circle")
            })
            .symbolEffect(layerAnimate ? .bounce.byLayer : .bounce.wholeSymbol, options: .repeat(runCount), value: runCount)
            .font(.largeTitle)
            .padding()
            
            Button(action: {
                layerAnimate.toggle()
            }, label: {
                Text(layerAnimate ? "Whole Animate" : "Layer Animate")
            })
            
        }
    }
}

#Preview {
    SF_Symbols_Content_Transitions()
}
