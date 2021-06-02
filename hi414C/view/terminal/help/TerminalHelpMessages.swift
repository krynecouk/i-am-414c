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
    @EnvironmentObject var segueVM: SegueViewModel
    
    private let paddingId = "padding"
    
    var body: some View {
        if helpVM.current == .chat {
            GeometryReader { metrics in
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { reader in
                        VStack(alignment: .leading) {
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
                                }
                                if chatVM.messages.isEmpty && chatVM.current.message == nil {
                                    MessageEmpty(frame: metrics.size)
                                }
                            }
                            TerminalHelpPadding()
                                .id(paddingId)
                        }
                        .padding(.top, 20)
                        .onAppear {
                            withAnimation {
                                reader.scrollTo(paddingId)
                            }
                        }
                        .onChange(of: segueVM.isOpen) { isOpen in
                            withAnimation {
                                reader.scrollTo(paddingId)
                            }
                        }
                    }
                }
            }
            .animation(.default)
        }
    }
    
    func Message414C(_ text: String, frame: CGSize) -> some View {
        Text(text)
            .allowsTightening(true)
            .minimumScaleFactor(0.1)
            .lineSpacing(10)
            .withTheme(themeVM.terminal.help.history.robot)
            .padding(.leading, 29)
            .padding(.trailing, 19)
            .padding(.top, 18)
            .padding(.bottom, 5)
            .background(rounded(color: themeVM.terminal.help.history.robot.background ?? Color.clear))
            .frame(maxWidth: frame.width * 0.9, alignment: .leading)
            .padding(.leading, 20)
    }
    
    func MessageAl(_ text: String, frame: CGSize) -> some View {
        HStack(spacing: 10) {
            Spacer()
            Text(text)
                .allowsTightening(true)
                .withTheme(themeVM.terminal.help.history.al)
                .offset(x: 2, y: 3.5)
                .padding([.top, .bottom], 8)
                .padding([.trailing, .leading], 25)
                .background(rounded(color: themeVM.terminal.help.history.al.background ?? Color.clear))
                .frame(maxWidth: frame.width * 0.9, alignment: .trailing)
        }
        .padding(.trailing, 20)
    }
    
    func MessageEmpty(_ text: String = "You Have No New Messages", frame: CGSize) -> some View {
        Text(text)
            .withTheme(themeVM.terminal.help.history.al)
            .multilineTextAlignment(.center)
            .offset(x: 2, y: 3.5)
            .padding([.top, .bottom], 8)
            .padding([.trailing, .leading], 25)
            .background(rounded(color: themeVM.terminal.help.history.al.background ?? Color.clear))
            .frame(maxWidth: frame.width, alignment: .center)
            .padding([.leading, .trailing], 10)
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
