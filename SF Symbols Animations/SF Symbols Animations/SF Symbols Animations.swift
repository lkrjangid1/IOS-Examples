

import SwiftUI

struct SF_Symbols_Animations: View {
    @State private var clicked = false
    @State private var pauseGlobe = false
    
    var body: some View {
        VStack {
            // SF Symbols
            HStack {
                Image( systemName: "globe")
                    .imageScale(.large)
                    .symbolEffectsRemoved(pauseGlobe)
                    .symbolEffect(.bounce, value: clicked)
                    .padding()
                
                Image( systemName: "house.fill")
                    .imageScale(.large)
                    .symbolEffect(.pulse, value: clicked)
                    .padding()
                
                Image( systemName: "square.stack.3d.up")
                    .imageScale(.large)
                    .symbolEffect(.variableColor.iterative, value: clicked)
                    .foregroundStyle(clicked ? .red : .black)
                    .padding()
                
                Image( systemName: "square.stack.3d.up")
                    .imageScale(.large)
                    .symbolEffect(.variableColor.cumulative, value: clicked)
                    .foregroundStyle(clicked ? .blue : .black)
                    .padding()
                
                Image( systemName: clicked ? "eye" : "eye.slash")
                    .imageScale(.large)
                    .foregroundStyle(clicked ? .black : .gray.opacity(0.5))
                    .symbolEffect(.bounce, value: clicked)
                    .padding()
                
                Image( systemName: clicked ? "person.crop.circle.badge.plus" : "bolt.horizontal.circle.fill")
                    .imageScale(.large)
                    .foregroundStyle(clicked ? .blue : .purple.opacity(0.5))
                    .symbolEffect(.pulse.byLayer, options: .repeat(3).speed(3) , value: clicked)
                    .padding()
                

                


            }
            
            
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
        }
    }
}

#Preview {
    SF_Symbols_Animations()
}
