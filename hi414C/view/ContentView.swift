//
//  ContentView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CathodeDisplay()
            VStack {
                HStack {
                    ANSIRegular.ONE
                    ANSIRegular.ZERO
                    ANSIRegular.ZERO

                }
                
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
