//
//  TerminalKeyboard.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 08.03.2021.
//

import SwiftUI

struct TerminalKeyboard: View {
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    TerminalKeyboardButton("Q")
                    TerminalKeyboardButton("W")
                    TerminalKeyboardButton("E")
                    TerminalKeyboardButton("R")
                    TerminalKeyboardButton("T")
                    TerminalKeyboardButton("Y")
                    TerminalKeyboardButton("U")
                    TerminalKeyboardButton("I")
                    TerminalKeyboardButton("O")
                    TerminalKeyboardButton("P")
                }
                HStack{
                    TerminalKeyboardButton("A")
                    TerminalKeyboardButton("S")
                    TerminalKeyboardButton("D")
                    TerminalKeyboardButton("F")
                    TerminalKeyboardButton("G")
                    TerminalKeyboardButton("H")
                    TerminalKeyboardButton("J")
                    TerminalKeyboardButton("K")
                    TerminalKeyboardButton("L")
                }
                HStack{
                    TerminalKeyboardButton("UP")
                    TerminalKeyboardButton("Z")
                    TerminalKeyboardButton("X")
                    TerminalKeyboardButton("C")
                    TerminalKeyboardButton("V")
                    TerminalKeyboardButton("B")
                    TerminalKeyboardButton("N")
                    TerminalKeyboardButton("M")
                    TerminalKeyboardButton("DEL")
                }
                HStack{
                    TerminalKeyboardButton("123")
                    TerminalKeyboardButton("SPACE", width: 330)
                    TerminalKeyboardButton("ENT")
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
                    .frame(height: 350)
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}
