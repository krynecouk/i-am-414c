//
//  CathodeBackground.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 18.02.2021.
//

import SwiftUI

struct CathodeDisplay: View {
    var body: some View {
        ZStack {
            StaticNoise()
                .opacity(0.4)
            BlurIn()
                .opacity(0.9)
            Curtain()
                .opacity(0.8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CathodeDisplay_Previews: PreviewProvider {
    static var previews: some View {
        CathodeDisplay()
    }
}
