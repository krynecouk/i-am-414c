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
    
    private static let grid = [GridItem(.adaptive(minimum: 45, maximum: .infinity))]
    
    let messages: Messages
    
    var body: some View {
        GeometryReader { metrics in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    if helpVM.isHistory {
                        ForEach(messages.history) { message in
                            if message.author == ._414C {
                                Message414C(message.text, frame: metrics.size)
                            } else {
                                MessageAl(message.text, frame: metrics.size)
                            }
                        }
                    }
                    Message414C(messages.current.text, frame: metrics.size)
                    MessageAl(rand(from: messages.answers), frame: metrics.size)
                        .onReceive(helpVM.$answers) { _ in
                            self.answer = rand(from: messages.answers)
                        }
                        .padding(.bottom, 250)
                }
            }
        }
    }
    
    func Message414C(_ text: String, frame: CGSize) -> some View {
        Grid(columns: TerminalMessages.grid, alignment: .center) {
            FigletView(text, theme: FigletTheme().withAnimation([]))
        }
        .offset(x: 3)
        .background(rounded)
        .frame(maxWidth: getGridWidth(frame: frame, content: text), alignment: .leading)
        .padding(.leading, 10)
        .animation(.spring().speed(1.3))
    }
    
    func MessageAl(_ text: String, frame: CGSize) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Text(text)
                .withTheme(themeVM.terminal.help.history.AL)
                .offset(x: 4, y: 5)
                .padding([.top, .bottom], 8)
                .padding([.trailing, .leading], 25)
                .background(rounded)
                .frame(maxWidth: frame.width * 0.75, alignment: .trailing)
                .animation(.spring().speed(1.3))
        }
        .padding(.trailing, 10)
    }
    
    var rounded: some View {
        RoundedRectangle(cornerRadius: 35).fill(Color("BlackBck"))
    }
    
    func getGridWidth(frame: CGSize, content: String) -> CGFloat {
        let contentW: CGFloat = CGFloat(content.count * 80)
        let maxW: CGFloat = frame.width * 0.75
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
