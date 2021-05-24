//
//  TerminalMessagesSelect.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

struct TerminalMessagesSelect: View {
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var chatVM: ChatViewModel
    
    @State var pageLimit = 100
    
    var body: some View {
        ForEach(chatVM.replies.prefix(pageLimit).map { Item($0) }) { item in
            MessageButton(item.content)
        }
        if chatVM.replies.count > pageLimit {
            ReloadButton()
        }
    }
    
    func MessageLabel(_ text: String) -> some View {
        Text(text)
            .withTheme(themeVM.terminal.hli.select.messageButton)
            .offset(x: 2, y: 3.5)
            .padding([.top, .bottom], 8)
            .padding([.trailing, .leading], 25)
            .background(rounded)
    }
    
    func MessageButton(_ text: String) -> some View {
        MessageLabel(text)
            .onTapGesture {
                uiVM.isHelp = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    graphVM.traverse(ctx: GraphContext(input: text))
                }
            }
    }
    
    func ReloadButton(_ text: String = "...") -> some View {
        MessageLabel(text)
            .onTapGesture {
                if chatVM.replies.count > pageLimit {
                    withAnimation {
                        self.pageLimit += 3
                    }
                }
            }
    }
    
    var rounded: some View {
        RoundedRectangle(cornerRadius: 35).fill(themeVM.terminal.help.history.al.background ?? Color.clear)
    }
}

struct MessagesSelect_Previews: PreviewProvider {
    static var previews: some View {
        TerminalMessagesSelect()
    }
}
