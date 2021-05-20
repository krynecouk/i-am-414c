//
//  TerminalConversation.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 06.05.2021.
//

import SwiftUI

struct TerminalMessages: View {
    @EnvironmentObject var helpVM: HelpViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    
    private let currentMsgId = "current_msg_id"
    private static let PORTRAIT_MESSAGE = (1...5).map { _ in  GridItem(.flexible(minimum: 55, maximum: .infinity))}
    private static let LANDSLIDE_MESSAGE = (1...10).map { _ in  GridItem(.flexible(minimum: 55, maximum: .infinity))}
    
    let messages: Messages
    
    var body: some View {
        GeometryReader { metrics in
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { reader in
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(messages.history) { message in
                            if !message.text.isEmpty {
                                if message.author == .robot {
                                    Message414C(message.text, frame: metrics.size)
                                } else {
                                    MessageAl(message.text, frame: metrics.size)
                                }
                            }
                        }
                        Message414C(messages.current.text, frame: metrics.size)
                            .id(currentMsgId)
                    }
                    .padding(.top, 10)
                    .onAppear {
                        reader.scrollTo(currentMsgId)
                    }
                }
            }
        }
    }
    
    func Message414C(_ text: String, frame: CGSize) -> some View {
        Grid(columns: frame.width > 500 ? TerminalMessages.LANDSLIDE_MESSAGE : TerminalMessages.PORTRAIT_MESSAGE, alignment: .center) {
            TerminalMessageRow(text, wide: frame.width > 500, theme: themeVM.terminal.help.history.robot)
        }
        .offset(x: 3)
        .frame(maxWidth: getGridWidth(frame: frame, content: text), alignment: .leading)
        .background(rounded)
        .padding(.leading, 10)
        .animation(.spring().speed(1.3))
    }
    
    func MessageAl(_ text: String, frame: CGSize) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Text(text)
                .withTheme(themeVM.terminal.help.history.al)
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
        RoundedRectangle(cornerRadius: 35).fill(themeVM.terminal.help.history.al.background ?? Color.clear)
    }
    
    func getGridWidth(frame: CGSize, content: String) -> CGFloat {
        let contentCount = content.isEmpty ? 0 : findLongestWord(from: content).count
        print(contentCount)
        let contentW: CGFloat = CGFloat(contentCount * 90)
        let maxW: CGFloat = frame.width * 0.75
        return contentW > maxW ? maxW : contentW
    }
    
    func findLongestWord(from sentence: String) -> String {
        let words = sentence.components(separatedBy: " ")
        if let longest = words.max(by: { $1.count > $0.count }) {
            print(longest)
            return longest
        }
        print(words[0])
        return words[0]
    }
}

struct Messages {
    var history: [Message]
    var current: Message
}
