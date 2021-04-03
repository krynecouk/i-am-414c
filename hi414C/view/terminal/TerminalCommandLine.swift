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
            HStack(alignment: .center, spacing: 0) {
                FigletView([.greaterThan], theme: FigletTheme(
                    view: ViewTheme(
                        font: (.terminus, 6)
                    ),
                    animations: []
                ))
                .padding(.trailing, 15)
                /*
                ForEach(Array(keyboardVM.input.enumerated()), id: \.offset) { i, char in
                    FigletView(String(char), theme: FigletTheme(
                    view: ViewTheme(
                    font: (.terminus, 6)
                    ),
                    animations: []
                    ))
                    .bloomFadeOut()
                }
                */
                /*
                 FigletView(keyboardVM.input, theme: FigletTheme(
                 view: ViewTheme(
                 font: (.terminus, 6)
                 ),
                 animations: []
                 ))
                 .id(keyboardVM.input)
                 */
                
                ForEach(Array(keyboardVM.input.enumerated()), id: \.offset) { i, char in
                    Text(String(char)).foregroundColor(Color("Primary"))
                        .font(Font.custom(FontName.proggyTiny.rawValue, size: 55))
                        .offset(y: 2)
                        .bloomFadeOut(speed: 1)
                        .padding(.trailing, 3)
                    
                }
                
                TerminalCommandPrompt()
                    .id(keyboardVM.input)
                    //.padding(.trailing, 5)
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
