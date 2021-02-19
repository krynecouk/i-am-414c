//
//  RefreshWave.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct RefreshWave: View {
    @State private var showWave = false;
    
    let gradient: Gradient;
    let linearGradient: LinearGradient;
    
    init(of color: Color = Color("Primary").opacity(0.8)) {
        gradient = Gradient(colors: [Color.white.opacity(0), color])
        linearGradient = LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }
    
    var body: some View {
        ZStack {
            if showWave {
                Rectangle()
                    .fill(linearGradient)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .transition(.asymmetric(insertion: .refresh, removal: .opacity))
                    .animation(Animation.linear(duration: 7).repeatForever(autoreverses: false))
            }
        }
        .onAppear() {
            showWave = true
        }
    }
}

struct OffsetModifier: ViewModifier {
    var x: CGFloat = 0
    var y: CGFloat = 0
    func body(content: Content) -> some View {
        content.offset(x: x, y: y)
    }
}

extension AnyTransition {
    static var refresh: AnyTransition { get {
        AnyTransition.modifier(active: OffsetModifier(y: -1000), identity: OffsetModifier(y: 800))
    }}
}

struct RefreshWave_Previews: PreviewProvider {
    static var previews: some View {
        RefreshWave()
    }
}
