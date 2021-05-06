//
//  TerminalConversation.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 06.05.2021.
//

import SwiftUI

typealias Answer = String
typealias Answers = Set<Answer>

struct TerminalMessages: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    @State var answer: Answer = ""
    
    let messages: Messages
    
    var body: some View {
        //GeometryReader { metrics in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        HStack(spacing: 10) {
                            TerminalMessage(messages.current.text, theme: FigletTheme().withAnimation([]))
                                .border(Color.red)
                        }.frame(maxWidth: 200)

                        Spacer()
                    }
                    .border(Color.red)
                    HStack(spacing: 10) {
                        Spacer()
                        AlMessage(rand(from: messages.answers), theme: themeVM.terminal.help.history.AL)
                            .onReceive(helpVM.$answers) { _ in
                                self.answer = rand(from: messages.answers)
                            }
                            .frame(maxWidth: 250, alignment: .trailing)
                            .border(Color.blue)
                    }
                    
                    .border(Color.blue)
                }
                .border(Color.green)
                //.frame(width: metrics.size.width, height: metrics.size.height - 114, alignment: .topLeading)
                //.border(Color.green)
            }
            //.border(Color.pink)
        //}
        //.border(Color.yellow)

    }
    
    func rand(from answers: Answers) -> Answer {
        answers.randomElement() ?? "??"
    }
}

struct Messages {
    var history: [Message]
    var current: Message
    var answers: Answers
}

struct AlMessage: View {
    let text: String
    let theme: ViewTheme
    
    init(_ text: String, theme: ViewTheme) {
        self.text = text
        self.theme = theme
    }
    
    var body: some View {
        Text(text)
            //.frame(width: 35, height: 60, alignment: .center)
            .withTheme(theme)
    }
}

/*
 struct TerminalConversation_Previews: PreviewProvider {
 static var previews: some View {
 TerminalConversation()
 }
 }
 */
