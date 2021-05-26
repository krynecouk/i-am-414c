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
                    }
                }
            }
        }
    }
    
    func Message414C(_ text: String, frame: CGSize) -> some View {
            Text(text)
                .lineSpacing(10)
                .withTheme(themeVM.terminal.help.history.robot)
                .padding(.leading, 29)
                .padding(.trailing, 19)
                .padding(.top, 18)
                .padding(.bottom, 5)
                .background(rounded(color: themeVM.terminal.help.history.robot.background ?? Color.clear))
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
                .background(rounded(color: themeVM.terminal.help.history.al.background ?? Color.clear))
                .frame(maxWidth: frame.width * 0.8, alignment: .trailing)
                .animation(.spring().speed(1.3))
        }
        .padding(.trailing, 10)
    }
    
    func rounded(color: Color) -> some View {
        RoundedRectangle(cornerRadius: 35)
            .fill(color)
    }
}

struct Messages {
    var history: [Message]
    var current: Message
}
