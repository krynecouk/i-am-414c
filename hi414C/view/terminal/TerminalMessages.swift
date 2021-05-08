//
//  TerminalConversation.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 06.05.2021.
//

import SwiftUI

typealias Answer = String

struct TerminalMessages: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var historyVM: HistoryViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var asciiVM: ASCIIViewModel

    @State var answer: Answer = ""
    @State var answers: Set<Answer> = []
    
    private static let grid = [GridItem(.adaptive(minimum: 45, maximum: .infinity))]
    
    let message: Message
    
    var body: some View {
        GeometryReader { metrics in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    if helpVM.isHistory {
                        ForEach(historyVM.history) { message in
                            if message.author == ._414C {
                                Message414C(message.text, frame: metrics.size)
                            } else {
                                MessageAl(message.text, frame: metrics.size)
                            }
                        }
                    }
                    Message414C(message.text, frame: metrics.size)
                    MessageAl(next(from: self.answers), frame: metrics.size)
                        .onReceive(helpVM.$answers) { _ in
                            self.answer = next(from: self.answers)
                        }
                        .onAppear {
                            self.answers = getAnswers(from: graphVM.node, ascii: asciiVM.symbols)
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
    
    func next(from answers: Set<Answer>) -> Answer {
        if answers.isEmpty {
            return ""
        }
        else if answers.count == 1 {
            return answers.first!
        }
        else {
            let random = answers.randomElement()!
            if self.answer == random {
                return next(from: answers)
            } else {
                return random
            }
        }
    }
    
    // TODO horrible
    private func getAnswers(from node: Node, ascii: [ASCIISymbol]) -> Set<String> {
        var paths: Set<String> = []
        for edge in node.edges {
            paths.insert(edge.id)
            if let asciiEdge = edge as? ASCIITestEdge {
                paths.formUnion(Set(asciiEdge.variants))
            }
        }
        
        var i = 0
        for edge in graphVM.graph.edges {
            if i < 5 {
                paths.insert(edge.id)
                if let asciiEdge = edge as? ASCIITestEdge {
                    paths.formUnion(Set(asciiEdge.variants))
                }
            } else {
                break
            }
            i += 1
        }
        return paths.filter { contains(all: $0.map { ASCIISymbol.from($0) }, in: ascii ) }
    }
    
    private func contains(all symbols: [ASCIISymbol], in basket: [ASCIISymbol]) -> Bool {
        for symbol in symbols {
            if !basket.contains(symbol) {
                return false
            }
        }
        return true
    }
}
