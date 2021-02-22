//
//  BlurIn.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct BlurIn: View {
    let gradient: Gradient;
    let radialGradient: RadialGradient;
    
    init(of color: Color = Color("Primary").opacity(0.8)) {
        gradient = Gradient(colors: [color, .black, .black, .black, .black])
        radialGradient = RadialGradient(gradient: gradient, center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 80, endRadius: 2200)
    }
    
    var body: some View {
        Rectangle()
            .fill(radialGradient)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct BlurIn_Previews: PreviewProvider {
    static var previews: some View {
        BlurIn()
    }
}
