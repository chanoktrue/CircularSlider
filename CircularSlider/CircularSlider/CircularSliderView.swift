//
//  CircularSliderView.swift
//  CircularSlider
//
//  Created by Thongchai Subsaidee on 4/8/2564 BE.
//

import SwiftUI

struct CircularSliderView: View {
    
    @State var size = UIScreen.main.bounds.width - 100
    @State var progress: CGFloat = 0
    @State var angle: Double = 0
    
    var body: some View {
                
        VStack {
            
            ZStack {
                
                // Background
                Circle()
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
                
                // Progress...
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.green, style: StrokeStyle(lineWidth: 55, lineCap: .butt))
                    .frame(width: size, height: size)
                    .rotationEffect(.init(degrees: -90))
                
                // Iner finish curve
                Circle()
                    .fill(Color.gray)
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: -90))
                
                // Drag Circle...
                Circle()
                    .fill(Color.white)
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    // Add animation rotation
                    .rotationEffect(.init(degrees: angle))
                    // Add gesture
                    .gesture(
                        DragGesture().onChanged(onDrag(value:))
                    )
                    .rotationEffect(.init(degrees: -90))
                
                // Sample $200
                Text("$" + String(format: "%.0f", progress * 200))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            
        }

    }
    
    func onDrag(value: DragGesture.Value) {
        
        // Calculating radians
        
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        
        // Since atan2 will give from -180 to 180
        // Eliminating drag gesture size
        // Size = 55 => Radius = 27.5
        
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        
        //Converting to angle
        
        var angle = radians * 180 / .pi
        
        // Simple technique for 0 to 360
        
        // eg = 360 - 176 = 184
        
        if angle < 0 {
            angle = 360 + angle
        }
        
        withAnimation(Animation.linear(duration: 0.15)) {
            
            // Progress
            
            let progress = angle / 360
            self.progress = progress
            
            self.angle = Double(angle)
        }
        
    }
    
}

struct CircularSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CircularSliderView()
    }
}
