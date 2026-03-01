

import SwiftUI

struct Phase_Animations_2: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                Text("Very Exciting")
                    .font(.largeTitle)
                    .bold()
                
                Image("fruit")
                    .resizable()
                    .scaledToFit()
                    .phaseAnimator([0, 10, 15, 3]) { view, phase in
                        view
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: phase)
                            )
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            }
            
        }
        
        
    }
}

#Preview {
    Phase_Animations_2()
}
