//
//  CircleProgressView.swift
//  CircularSlider
//
//  Created by Thongchai Subsaidee on 4/8/2564 BE.
//

import SwiftUI

struct CircleProgressView: View {
    // 1.
        @State private var progress: CGFloat = 0.0
        
        var body: some View {
            
            VStack(spacing: 20){
                // 2.
                HStack {
                    Text("0%")
                    Slider(value: $progress)
                    Text("100%")
                }.padding()
                
                ZStack {
                    // 3.
                    Circle()
                        .stroke(Color.gray, lineWidth: 20)
                        .opacity(0.1)
                    // 4.
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(Color.red, lineWidth: 20)
                        .rotationEffect(.degrees(-90))
                    // 5.
                    .overlay(
                        Text("\(Int(progress * 100.0))%"))
                         
                }.padding(20)
                .frame(height: 300)
                
                Spacer()
            }
        }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView()
    }
}
