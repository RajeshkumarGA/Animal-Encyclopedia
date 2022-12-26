//
//  MotionAnimationView.swift
//  Animals Encyclopedia
//
//  Created by Admin on 25/12/22.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomeCircle = Int.random(in: 12...16)
    @State private var isAnimatting : Bool = false
    
    // MARK: FUNCTIONS
    
    // RANDOM COORDINATES
    func randomCoordinates(max : CGFloat) -> CGFloat{
        return CGFloat.random(in: 0...max)
    }
    // RANDOM SIZE
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 10...300))
    }
    // RANDOM SCALE
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // RANDOM SPEED
    func randomSpeed() -> Double{
        return Double.random(in: 0.025...1.0)
    }
    // RANDOM DELAY
    func randomDelay() -> Double{
        return Double.random(in: 0...2.0)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0 ... randomeCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimatting ? randomScale() : 1)
                        .position(x: randomCoordinates(max: geometry.size.width) , y: randomCoordinates(max: geometry.size.height))
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()),value: UUID()
                        )
                        .onAppear(perform: {
                            isAnimatting = true
                        })
                    
                        
                }
//                Text("width: \(Int(geometry.size.width)) height: \(Int(geometry.size.height))")
            }// ZStack
            .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
