//
//  CircularSliderTempView.swift
//  CircularSlider
//
//  Created by Thongchai Subsaidee on 4/8/2564 BE.
//

import SwiftUI

struct CircularSliderTempView: View {
    
    @State var size = UIScreen.main.bounds.width - 100
    @State var progress: CGFloat = 0
    @State var angle: Double = 0
    @State var degrees: Double = -225
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                // Background
                Circle()
                    .trim(from: 0.0, to: 0.75)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 10)
                    .frame(width: size, height: size)
                    .rotationEffect(.init(degrees: degrees))
                
                // Progress
                
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow, Color.red]), startPoint: .leading, endPoint: .trailing)
                    .mask(
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(Color.green.opacity(0.8), lineWidth: 10)
                            .frame(width: size, height: size)
                            .rotationEffect(.init(degrees: degrees))
                    )
                
                // Drag Circle
                Circle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: angle))
                    // Adding gestur
                    .gesture(DragGesture().onChanged(onDrag(value:)))
                    .rotationEffect(.init(degrees: degrees))
                                    
                // Display
                VStack {
                    Text("\(progress)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    Text("Angle: \(angle)")
                }
            }
            
        }

    }
    
    func onDrag(value: DragGesture.Value) {
        
        // Calculation radians
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        print("Vector: \(vector)")
        
        // Since atan2 will give from -180 to 180
        // Eliminationg drang gesture size
        // Size = 10 => Radius = 5
        let radians = atan2(vector.dy - 5 , vector.dx - 5)
        print("Radians: \(radians)")
        
        // Converting to angle
        var angle = radians * 180 / .pi
        print("Angle: \(angle) \n\n")
        
        // Simple technique for 0 to 360
        // eg = 360 - 176 = 184

        if angle < 0 {
            angle = 360 + angle
        }
    
        // Limit angle from 0 to 270
        if angle >= 270 {
            angle = 270
        }
    
        withAnimation(Animation.linear(duration: 0.15)) {
            // Progress
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
        
    }
    
}

struct CircularSliderTempView_Previews: PreviewProvider {
    static var previews: some View {
        CircularSliderTempView()
    }
}
