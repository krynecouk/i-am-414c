//
//  TerminalAnswer.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 30.04.2021.
//

import SwiftUI

typealias Answer = String
typealias Answers = Set<Answer>

struct TerminalAnswer: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    let answers: Answers
    let wide: Bool
    @State var answer: Answer = ""
    
    init(_ answers: Answers, wide: Bool) {
        self.answers = answers
        self.wide = wide
        self.answer = rand(from: answers)
    }
    
    var body: some View {
        MessageRow(of: answer, wide: wide) {
            //TerminalCommandPrompt(theme: themeVM.terminal.hli.prompt)
            TerminalAlMessage(answer, theme: themeVM.terminal.help.history.AL)
                .onReceive(helpVM.$answers) { _ in
                    self.answer = rand(from: answers)
                }
            TerminalCommandCursor(theme: themeVM.terminal.hli.cursor, size: (35, 55))
                .id(answer)
        }
    }
    
    
    func rand(from answers: Answers) -> Answer {
        answers.randomElement() ?? "??"
    }
}
