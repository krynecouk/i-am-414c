//
//  TerminalView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.03.2021.
//

import SwiftUI

struct TerminalKeyboardView: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    
    let ascii: [ASCII] = [
        ASCIITable.one,
        ASCIITable.two,
        ASCIITable.three,
        ASCIITable.four,
        ASCIITable.six,
        ASCIITable.seven,
        ASCIITable.eight,
        ASCIITable.nine,
        ASCIITable.zero,
        ASCIITable.A,
        ASCIITable.B,
        ASCIITable.C,
        ASCIITable.D,
        ASCIITable.E,
        ASCIITable.F,
        ASCIITable.G,
        ASCIITable.H,
        ASCIITable.I,
        ASCIITable.J,
        ASCIITable.K,
        ASCIITable.L,
        ASCIITable.M,
        ASCIITable.N,
        ASCIITable.O,
        ASCIITable.P,
        ASCIITable.Q,
        ASCIITable.R,
        ASCIITable.S,
        ASCIITable.T,
        ASCIITable.U,
        ASCIITable.V,
        ASCIITable.W,
        ASCIITable.X,
        ASCIITable.Y,
        ASCIITable.Z,
    ]

    var body: some View {
        TerminalSegue(header: Group {
            TerminalText("414C >")
            TerminalText(keyboardVM.currentValue)
            TerminalText("█")
        }) {
            TerminalKeyboard()
        }
    }
}

struct TerminalKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            TerminalKeyboardView()
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
        .withEnvironment()
    }
}
