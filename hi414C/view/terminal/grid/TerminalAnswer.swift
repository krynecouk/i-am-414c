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
    @State var answer: Answer = ""
    
    init(_ answers: Answers) {
        self.answers = answers
        self.answer = rand(from: answers)
    }
    
    var body: some View {
        TerminalMessage(answer, theme: themeVM.terminal.help.answer)
            .onReceive(helpVM.$answers) { _ in
                self.answer = rand(from: answers)
            }
    }
    
    func rand(from answers: Answers) -> Answer {
        answers.randomElement() ?? "??"
    }
}
