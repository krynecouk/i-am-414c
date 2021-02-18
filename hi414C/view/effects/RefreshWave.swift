//
//  RefreshWave.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct RefreshWave: View {
    let gradient: Gradient;
    let linearGradient: LinearGradient;
    
    init(of color: Color = Color("Primary").opacity(0.8)) {
        gradient = Gradient(colors: [Color.white.opacity(0), color])
        linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        Rectangle()
            .fill(linearGradient)
            .transition(.move(edge: .bottom)) // TODO falling animation
            .frame(width: .infinity, height: .infinity)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
    }
}

struct RefreshWave_Previews: PreviewProvider {
    static var previews: some View {
        RefreshWave()
    }
}
