//
//  TerminalKeyboard.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.03.2021.
//

import SwiftUI

struct TerminalKeyboard: View {
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                HStack(alignment: .center, spacing: 8) {
                    TerminalKeyboardButton("Q", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("W", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("E", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("R", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("T", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("Y", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("U", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("I", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("O", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("P", width: (metrics.size.width - 80) / 10)
                }
                HStack(spacing: 8) {
                    TerminalKeyboardButton("A", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("S", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("D", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("F", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("G", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("H", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("J", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("K", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("L", width: (metrics.size.width - 80) / 10)
                }
                HStack(spacing: 8) {
                    TerminalKeyboardButton("Z", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("X", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("C", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("V", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("B", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("N", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("M", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("DEL", width: (metrics.size.width - 80) / 10)
                }
                HStack(spacing: 8) {
                    TerminalKeyboardButton("123", width: (metrics.size.width - 80) / 10)
                    TerminalKeyboardButton("SPACE", width: (metrics.size.width - metrics.size.width/10 - metrics.size.width/10) - 16)
                    TerminalKeyboardButton("ENT", width: (metrics.size.width - 80) / 10)
                }
            }
        }
    }
}

struct TerminalKeyboard_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            VStack {
                Spacer()
                TerminalKeyboard()
                    .frame(height: 300)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
        }
    }
}
