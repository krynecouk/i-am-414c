//
//  TerminalHelpMessages.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 06.05.2021.
//

import SwiftUI

struct TerminalHelpMessages: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var chatVM: ChatViewModel
    
    private let currentMsgId = "current_msg_id"
    private static let PORTRAIT_MESSAGE = (1...5).map { _ in  GridItem(.flexible(minimum: 55, maximum: .infinity))}
    private static let LANDSLIDE_MESSAGE = (1...10).map { _ in  GridItem(.flexible(minimum: 55, maximum: .infinity))}
        
    var body: some View {
        if helpVM.current == .chat {
            GeometryReader { metrics in
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { reader in
                        VStack(alignment: .leading) {
                            Color.clear.frame(height: 10)
                            VStack(alignment: .leading, spacing: 10) {
                                ForEach(chatVM.messages) { message in
                                    if !message.text.isEmpty {
                                        if message.author == .robot {
                                            Message414C(message.text, frame: metrics.size)
                                        } else {
                                            MessageAl(message.text, frame: metrics.size)
                                        }
                                    }
                                }
                                if chatVM.current.message != nil {
                                    Message414C(chatVM.current.message!.text, frame: metrics.size)
                                        .id(currentMsgId)
                                }
                            }
                            .onAppear {
                                withAnimation {
                                    reader.scrollTo(currentMsgId)
                                }
                            }
                            TerminalHelpPadding()
                        }
                        .frame(width: metrics.size.width)
                        .border(Color.green)
                    }
                }
            }
        }
    }
    
    /*
    func Message414C(_ text: String, frame: CGSize) -> some View {
        Grid(columns: frame.width > 500 ? TerminalHelpMessages.LANDSLIDE_MESSAGE : TerminalHelpMessages.PORTRAIT_MESSAGE, alignment: .center) {
            TerminalMessageRow(text, wide: frame.width > 500, theme: themeVM.terminal.help.history.robot)
        }
        .offset(x: text.count == 1 ? -5 : 3)
        .frame(maxWidth: getGridWidth(frame: frame, content: text), alignment: .leading)
        .background(rounded)
        .padding(.leading, 10)
        .animation(.spring().speed(1.3))
    }
    */
    
    func Message414C(_ text: String, frame: CGSize) -> some View {
            Text(text)
                .font(Font.of(props: FontProps(.ansiRegular, 70)))
                .lineSpacing(15)
                .foregroundColor(.white)
                .padding([.top, .bottom], 15)
                .padding([.trailing, .leading], 30)
                .background(rounded)
                .frame(maxWidth: frame.width * 0.8, alignment: .leading)
                .animation(.spring().speed(1.3))
                .padding(.leading, 10)
    }
    
    func MessageAl(_ text: String, frame: CGSize) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Text(text)
                .withTheme(themeVM.terminal.help.history.al)
                .offset(x: 2, y: 3.5)
                .padding([.top, .bottom], 8)
                .padding([.trailing, .leading], 25)
                .background(rounded)
                .frame(maxWidth: frame.width * 0.8, alignment: .trailing)
                .animation(.spring().speed(1.3))
        }
        .padding(.trailing, 10)
    }
    
    var rounded: some View {
        RoundedRectangle(cornerRadius: 35)
            .fill(themeVM.terminal.help.history.al.background ?? Color.clear)
    }
    
    func getGridWidth(frame: CGSize, content: String) -> CGFloat {
        let contentCount = content.isEmpty ? 0 : findLongestWord(from: content).count
        let contentW: CGFloat = CGFloat(contentCount * 80)
        let maxW: CGFloat = frame.width * 0.9
        return contentW > maxW ? maxW : contentW
    }
    
    func findLongestWord(from sentence: String) -> String {
        let words = sentence.components(separatedBy: " ")
        if let longest = words.max(by: { $1.count > $0.count }) {
            return longest
        }
        return words[0]
    }
}

struct Messages {
    var history: [Message]
    var current: Message
}
