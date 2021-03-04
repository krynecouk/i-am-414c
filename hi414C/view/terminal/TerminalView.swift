//
//  TerminalView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.03.2021.
//

import SwiftUI

struct TerminalView: View {
    @State var text: String = ""
    let ascii: [ASCII] = [
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
            TerminalText(text)
            TerminalText("█")
        }) {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 60, maximum: .infinity))], alignment: .center, spacing: 10) {
                    Group() {
                        ForEach(ascii, id: \.self) { a in
                            TerminalButton(a.char, label: String(a.dec))
                                .onTapGesture {
                                    text += a.char
                                }
                        }
                        TerminalButton(ASCIITable.DEL.char)
                            .onTapGesture {
                                if (!text.isEmpty) {
                                    text.removeLast()
                                }
                                
                            }
                    }
                }
            }
        }
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            TerminalView()
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
    }
}
