//
//  EnvironmentModifier.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 17.03.2021.
//

import SwiftUI

struct EnvironmentModifier: ViewModifier {
    @ObservedObject var asciiVM: ASCIIViewModel
    @ObservedObject var terminalVM: TerminalViewModel
    @ObservedObject var keyboardVM: KeyboardViewModel
    @ObservedObject var testVM: TestViewModel
    @ObservedObject var themeVM: ThemeViewModel
    @ObservedObject var graphVM: GraphViewModel
    @ObservedObject var uiVM: UIViewModel
    
    init(
        asciiVM: ASCIIViewModel = ASCIIViewModel(),
        terminalVM: TerminalViewModel = TerminalViewModel(),
        keyboardVM: KeyboardViewModel = KeyboardViewModel(),
        themeVM: ThemeViewModel = ThemeViewModel(),
        testVM: TestViewModel = TestViewModel(),
        uiVM: UIViewModel = UIViewModel())
    {
        self.asciiVM = asciiVM
        self.terminalVM = terminalVM
        self.keyboardVM = keyboardVM
        self.themeVM = themeVM
        self.testVM = testVM
        self.uiVM = uiVM
        self.graphVM = GraphViewModel(toolkit: GraphToolkit(
            asciiVM: asciiVM, terminalVM: terminalVM, keyboardVM: keyboardVM, testVM: testVM, themeVM: themeVM, uiVM: uiVM
        ))
    }
    
    func body(content: Content) -> some View {
        content
            .environmentObject(asciiVM)
            .environmentObject(terminalVM)
            .environmentObject(graphVM)
            .environmentObject(keyboardVM)
            .environmentObject(testVM)
            .environmentObject(themeVM)
            .environmentObject(uiVM)
    }
}

extension View {
    func withEnvironment() -> some View {
        self.modifier(EnvironmentModifier())
    }
}
