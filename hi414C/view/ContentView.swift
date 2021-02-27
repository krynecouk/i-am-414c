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
                    ANSIRegular.ZERO
                    ANSIRegular.ONE
                    ANSIRegular.ONE
                    ANSIRegular.ONE
                    ANSIRegular.ONE
                }.frame(height: 120)
                HStack {
                    ANSIRegular.ONE
                    ANSIRegular.ZERO
                    ANSIRegular.ZERO
                    ANSIRegular.ZERO
                    ANSIRegular.ONE
                    ANSIRegular.ONE
                    ANSIRegular.ONE
                    ANSIRegular.ONE
                }.frame(height: 120).opacity(0.2)
                HStack {
                    ANSIShadow.H
                    ANSIShadow.I
                }.frame(height: 120).opacity(0.2)
                Text("10001111100100011000100010000101")
                    .font(Font.custom(FontManager.ModernTerminus.terminus, size: 100))
                    .foregroundColor(Color("Primary"))
                    .shadow(color: Color("Primary"), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .opacity(0.8)
                
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
