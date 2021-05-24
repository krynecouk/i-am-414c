//
//  GraphToolkit.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 22.03.2021.
//

class GraphToolkit {
    var asciiVM: ASCIIViewModel
    var terminalVM: TerminalViewModel
    var keyboardVM: KeyboardViewModel
    var testVM: TestViewModel
    var themeVM: ThemeViewModel
    var uiVM: UIViewModel
    var chatVM: ChatViewModel
    var segueVM: SegueViewModel
    var helpVM: HelpViewModel
    var graphVM: GraphViewModel?
    
    init(
        asciiVM: ASCIIViewModel,
        terminalVM: TerminalViewModel,
        keyboardVM: KeyboardViewModel,
        testVM: TestViewModel,
        themeVM: ThemeViewModel,
        uiVM: UIViewModel,
        chatVM: ChatViewModel,
        segueVM: SegueViewModel,
        helpVM: HelpViewModel
    ) {
        self.asciiVM = asciiVM
        self.terminalVM = terminalVM
        self.keyboardVM = keyboardVM
        self.testVM = testVM
        self.themeVM = themeVM
        self.uiVM = uiVM
        self.chatVM = chatVM
        self.segueVM = segueVM
        self.helpVM = helpVM
    }
}
