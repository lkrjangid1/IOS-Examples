

import SwiftUI

struct AnimationValues {
    var offsetY: CGFloat = -300
    var rotation: Angle = Angle(degrees: 0)
    var scaleX = 1.0
}

struct Key_Frame_Animations: View {
    let timeDuration: Double
    
    var body: some View {
        MyShape()
            .keyframeAnimator(
                initialValue: AnimationValues()) { view, value in
                    view
                        .rotationEffect(value.rotation)
                        .offset(y: value.offsetY)
                        .scaleEffect(x: value.scaleX)
                } keyframes: { _ in
                    KeyframeTrack(\.offsetY) {
                        LinearKeyframe(-300, duration: 0.2*timeDuration)
                        
                        SpringKeyframe( 0, duration: 0.4*timeDuration)
                        LinearKeyframe(-100, duration: 0.3*timeDuration)
                    }
                    
                    KeyframeTrack(\.rotation) {
                        CubicKeyframe(.zero, duration: 0.5 * timeDuration)
                        
                        CubicKeyframe(Angle(degrees: 20*360), duration: 0.5 * timeDuration)
                    }
                    
                    KeyframeTrack(\.scaleX) {
                        SpringKeyframe(1, duration: 0.25*timeDuration)
                        
                        SpringKeyframe(0.1, duration: 0.5*timeDuration)
                        
                        SpringKeyframe(0.8, duration: 0.25*timeDuration)
                    }
                }
    }
}

struct MyShape: View {
    var body: some View {
        Circle()
            .stroke(AngularGradient(
                colors: [
                    .red, .green, .blue, .yellow, .black, .indigo, .pink
                ], center: .center),
            lineWidth: 20
            )
            .shadow(radius: 3)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}


#Preview {
    Key_Frame_Animations(timeDuration: 4)
}
