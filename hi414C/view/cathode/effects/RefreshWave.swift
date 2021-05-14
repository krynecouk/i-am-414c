//
//  RefreshWave.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct RefreshWave: View {
    @State private var y: CGFloat = -1500

    let gradient: Gradient
    let linearGradient: LinearGradient

    init(of color: Color = Color("Primary")) {
        gradient = Gradient(colors: [Color.white.opacity(0), color])
        linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }

    var body: some View {
        Rectangle()
            .fill(linearGradient)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
            .offset(y: y)
            //.bloom()
            .onAppear {
                withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                    self.y = 1500
                }
            }
    }
}

struct RefreshWave_Previews: PreviewProvider {
    static var previews: some View {
        RefreshWave()
    }
}
