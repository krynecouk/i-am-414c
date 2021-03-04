//
//  TerminalView.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 01.03.2021.
//

import SwiftUI

struct TerminalView: View {
    @State var text: String = ""
    
    var body: some View {
        TerminalSegue(header: Group {
            TerminalFont("414C >")
            TerminalFont(text)
            TerminalFont("█")
        }) {
            TerminalFont("1")
                .onTapGesture {
                    text += "1"
                }
            TerminalFont("2")
                .onTapGesture {
                    text += "2"
                }
            TerminalFont("3")
                .onTapGesture {
                    text += "3"
                }
            TerminalFont("4")
                .onTapGesture {
                    text += "4"
                }
        }
    }
}

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        CathodeView {
            TerminalView()
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
