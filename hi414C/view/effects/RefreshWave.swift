//
//  RefreshWave.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct RefreshWave: View {
    @State private var y: CGFloat = -1000;
    @State private var animation: Animation? = Optional.none;
    
    let gradient: Gradient;
    let linearGradient: LinearGradient;
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    init(of color: Color = Color("Primary").opacity(0.8)) {
        gradient = Gradient(colors: [Color.white.opacity(0), color])
        linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
            Rectangle()
                .fill(linearGradient)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .animation(animation)
                .onReceive(timer) {_ in
                    if y < 1000 {
                        animation = .linear
                        y += 15
                    } else {
                        animation = .none
                        y = -1000
                    }
                    print(timer)
                }
                .offset(y: y)
    }
}

struct RefreshWave_Previews: PreviewProvider {
    static var previews: some View {
        RefreshWave()
    }
}
