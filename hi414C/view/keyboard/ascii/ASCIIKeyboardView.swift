//
//  ASCIIKeyboardView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 29.03.2021.
//

import SwiftUI

struct ASCIIKeyboardView: View {
    @EnvironmentObject var asciiVM: ASCIIViewModel
    
    var body: some View {
        KeyboardView([
            .alphabetic: [
                .row1: [
                    ASCIIKeyboardKey(.Q),
                    ASCIIKeyboardKey(.W),
                    ASCIIKeyboardKey(.E),
                    ASCIIKeyboardKey(.R),
                    ASCIIKeyboardKey(.T),
                    ASCIIKeyboardKey(.Y),
                    ASCIIKeyboardKey(.U),
                    ASCIIKeyboardKey(.I),
                    ASCIIKeyboardKey(.O),
                    ASCIIKeyboardKey(.P),
                ],
                .row2: [
                    ASCIIKeyboardKey(.A),
                    ASCIIKeyboardKey(.S),
                    ASCIIKeyboardKey(.D),
                    ASCIIKeyboardKey(.F),
                    ASCIIKeyboardKey(.G),
                    ASCIIKeyboardKey(.H),
                    ASCIIKeyboardKey(.J),
                    ASCIIKeyboardKey(.K),
                    ASCIIKeyboardKey(.L),
                ],
                .row3: [
                    ASCIIKeyboardKey(.Z),
                    ASCIIKeyboardKey(.X),
                    ASCIIKeyboardKey(.C),
                    ASCIIKeyboardKey(.V),
                    ASCIIKeyboardKey(.B),
                    ASCIIKeyboardKey(.N),
                    ASCIIKeyboardKey(.M),
                ],
                .space: [
                    ASCIIKeyboardKey(.space, value: " ")
                ]
            ],
            .numeric: [
                .row1: [
                    ASCIIKeyboardKey(.one),
                    ASCIIKeyboardKey(.two),
                    ASCIIKeyboardKey(.three),
                    ASCIIKeyboardKey(.four),
                    ASCIIKeyboardKey(.five),
                    ASCIIKeyboardKey(.six),
                    ASCIIKeyboardKey(.seven),
                    ASCIIKeyboardKey(.eight),
                    ASCIIKeyboardKey(.nine),
                    ASCIIKeyboardKey(.zero),
                ],
                .row2: [
                    ASCIIKeyboardKey(.dash),
                    ASCIIKeyboardKey(.slash),
                    ASCIIKeyboardKey(.colon),
                    ASCIIKeyboardKey(.semicolon),
                    ASCIIKeyboardKey(.leftParen),
                    ASCIIKeyboardKey(.rightParen),
                    ASCIIKeyboardKey(.dollar),
                    ASCIIKeyboardKey(.ampersand),
                    ASCIIKeyboardKey(.atSign),
                    ASCIIKeyboardKey(.backslash),
                ],
                .row3: [
                    ASCIIKeyboardKey(.dot),
                    ASCIIKeyboardKey(.comma),
                    ASCIIKeyboardKey(.questionMark),
                    ASCIIKeyboardKey(.singleQuote),
                    ASCIIKeyboardKey(.ampersand),
                ],
                .space: [
                    ASCIIKeyboardKey(.space, value: " ")
                ]
            ]
        ])
    }
    
    func ASCIIKeyboardKey(_ symbol: ASCIISymbol, value: String? = .none) -> KeyboardKey {
        if asciiVM.symbols.contains(symbol) {
            let value = value ?? symbol.rawValue
            return KeyboardKey(symbol.rawValue, value: value)
        }
        let ascii = ASCII.from(symbol)
        return KeyboardKey(String(ascii.dec), value: String(ascii.dec))
    }
}

struct ASCIIKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        ASCIIKeyboardView()
    }
}