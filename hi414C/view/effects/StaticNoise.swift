//
//  Noise.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct StaticNoise: View {
    @State var x : CGFloat = 0;
    @State var y : CGFloat = 0;
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Image("Noise")
            .onReceive(timer) { _ in
                x = CGFloat.random(in: -130...130)
                y = CGFloat.random(in: -150...150)
            }
            .position(x: x, y: y)
    }
}

struct StaticNoise_Previews: PreviewProvider {
    static var previews: some View {
        StaticNoise()
    }
}
