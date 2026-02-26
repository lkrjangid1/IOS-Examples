
import SwiftUI

struct ScrollTransitionExample1: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(images, id: \.self) { name in
                    ZStack {
                        MyImageView(name: name)
                            .scrollTransition(axis: .horizontal) { content, phase in
                                // -1 ... 1
                                let value = phase.value
                                
                                // 0 ... 1
                                let opacity = cos((.pi/2) * value)

                                return content
                                    .opacity(opacity)
                            }
                    }
                    .containerRelativeFrame(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ScrollTransitionExample1()
}
