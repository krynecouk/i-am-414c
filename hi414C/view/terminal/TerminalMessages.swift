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
                VStack(alignment: .leading, spacing: 10) {
                    Grid(columns: [GridItem(.adaptive(minimum: 45, maximum: .infinity))], alignment: .center) {
                        FigletView(messages.current.text, theme: FigletTheme().withAnimation([]))
                        //.border(Color.red)
                    }
                    .offset(x: 3)
                    .background(RoundedRectangle(cornerRadius: 35).fill(Color("BlackBck")))
                    .frame(maxWidth: getGridWidth(frame: metrics.size, content: messages.current.text), alignment: .leading)
                    .padding(.leading, 10)
                    
                    HStack(spacing: 10) {
                        Spacer()
                        Text(rand(from: messages.answers))
                            .withTheme(themeVM.terminal.help.history.AL)
                            .offset(x: 4, y: 5)
                            .padding([.top, .bottom], 8)
                            .padding([.trailing, .leading], 25)
                            .background(RoundedRectangle(cornerRadius: 35).fill(Color("BlackBck")))
                            .frame(maxWidth: metrics.size.width * 0.7, alignment: .trailing)
                            .transition(.scale)
                            .animation(.easeOut.speed(1.3))
                    }
                    .onReceive(helpVM.$answers) { _ in
                        self.answer = rand(from: messages.answers)
                    }
                    .padding(.trailing, 10)
                    .padding(.bottom, 250)
                    
                    //.border(Color.blue)
                }
                 // TODO presne kolik podle segue.open || isHint
                //.border(Color.green)
            }
        }
    }
    
    func getGridWidth(frame: CGSize, content: String) -> CGFloat {
        let contentW: CGFloat = CGFloat(content.count * 80)
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
