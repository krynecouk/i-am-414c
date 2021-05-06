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
        GeometryReader { metrics in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 0) {
                        Grid(columns: [GridItem(.adaptive(minimum: 60, maximum: .infinity))], alignment: .leading) {
                            LiteFigletView(messages.current.text, theme: LiteFigletTheme())
                                .border(Color.red)
                        }
                        .border(Color.yellow)
                        .frame(maxWidth: getGridWidth(frame: metrics.size, content: messages.current.text), alignment: .leading)
                        .border(Color.red)
                    }
                    
                    HStack(spacing: 10) {
                        Spacer()
                        Text(rand(from: messages.answers))
                            .withTheme(themeVM.terminal.help.history.AL)

                            .frame(maxWidth: metrics.size.width * 0.7, alignment: .trailing)
                    }
                    .onReceive(helpVM.$answers) { _ in
                        self.answer = rand(from: messages.answers)
                    }
                    
                    .border(Color.blue)
                }
                .padding(.bottom, 250) // TODO presne kolik podle segue.open || isHint
                .border(Color.green)
            }
        }
    }
    
    func getGridWidth(frame: CGSize, content: String) -> CGFloat {
        let contentW: CGFloat = CGFloat(content.count * 90)
        let maxW: CGFloat = frame.width * 0.7
        
        return contentW > maxW ? maxW : contentW
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


/*
 struct TerminalConversation_Previews: PreviewProvider {
 static var previews: some View {
 TerminalConversation()
 }
 }
 */
