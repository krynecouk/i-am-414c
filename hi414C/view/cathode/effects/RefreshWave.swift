//
//  RefreshWave.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct RefreshWave: View {
    @State private var y: CGFloat = -UIScreen.main.bounds.height

    let gradient: Gradient
    let linearGradient: LinearGradient

    init(of color: Color = .primary("Orange")) {
        gradient = Gradient(colors: [Color.white.opacity(0), color])
        linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }

    var body: some View {
        GeometryReader { metrics in
            Rectangle()
                .fill(linearGradient)
                .edgesIgnoringSafeArea( .all)
                .offset(y: y)
                //.bloom()
                .onAppear {
                    withAnimation(Animation.linear(duration: 7).delay(3).repeatForever(autoreverses: false)) {
                        self.y = metrics.size.height
                    }
                }
        }
    }
}

struct RefreshWave_Previews: PreviewProvider {
    static var previews: some View {
        RefreshWave()
    }
}
