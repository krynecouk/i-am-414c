//
//  TerminalCommandLine.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 19.03.2021.
//

import SwiftUI

struct TerminalCommandLine: View {
    @EnvironmentObject var keyboardVM: KeyboardViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                FigletView([.greaterThan], settings: FigletSettings(
                    view: ViewSettings(
                        font: (.terminus, 6)
                    ),
                    animations: []
                ))
                .padding(.trailing, 5)
                FigletView(keyboardVM.input, settings: FigletSettings(
                    view: ViewSettings(
                        font: (.terminus, 6)
                    ),
                    animations: []
                ))
                .id(keyboardVM.input)
                TerminalCommandPrompt()
                    .id(keyboardVM.input)
            }
            .padding()
        }
        .background(Color("GoldBck").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}

struct TerminalCommandLine_Previews: PreviewProvider {
    static var previews: some View {
        TerminalCommandLine()
            .withEnvironment()
    }
}
