//
//  ContentView.swift
//  CircularSlider
//
//  Created by Thongchai Subsaidee on 4/8/2564 BE.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
//            CircularSliderView()
            CircularSliderTempView()
                .preferredColorScheme(.dark)
                .navigationBarTitle("Wallet")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

