//
//  TerminalTest.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.04.2021.
//

import SwiftUI

struct TerminalTest: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var uiVM: UIViewModel
    
    @State var landSpan = 7
    @State var portraitSpan = 3
    
    let test: Test
    let active: Bool
    let chars: Array<EnumeratedSequence<String>.Element>
    
    init(_ test: Test, _ active: Bool = false) {
        self.test = test
        self.active = active
        self.chars = Array(test.equation.toString().enumerated())
    }
    
    var body: some View {
        ForEach(chars, id: \.offset) { i, char in
            if isOperator(char) {
                if isOperator(chars[i + 1].element) {
                    FigletView(String(char), theme: active
                                ? themeVM.ascii.test.test.active.special
                                : themeVM.ascii.test.test.passive.special)
                        .onAppear {
                            self.landSpan -= 1
                            self.portraitSpan -= 1
                        }
                } else {
                    FigletView(String(char), theme: active
                                ? themeVM.ascii.test.test.active.special
                                : themeVM.ascii.test.test.passive.special)
                        .onAppear {
                            self.landSpan = 7
                            self.portraitSpan = 3
                        }
                    if uiVM.isDetail {
                        if uiVM.isWideScreen() {
                            ForEach(0 ..< self.landSpan) { _ in
                                Color.clear
                            }
                        } else {
                            ForEach(0 ..< self.portraitSpan) { _ in
                                Color.clear
                            }
                        }
                    }
                }
            } else {
                FigletView(String(char), theme: active
                            ? themeVM.ascii.test.test.active.figlet
                            : themeVM.ascii.test.test.passive.figlet)
            }
        }
    }
    
    func isOperator(_ char: Character) -> Bool {
        ["+", "-", "/", "*", "&", "|", "^", "~", "<", ">", ")", "("].contains(char)
    }
}
