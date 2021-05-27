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
    
    @State var pageLimit = 3
    
    var body: some View {
        ForEach(chatVM.current.replies.prefix(pageLimit).map { Item($0) }) { item in
            MessageButton(item.content)
        }
        if chatVM.current.replies.count > pageLimit {
            ReloadButton2() {
                if chatVM.current.replies.count > pageLimit {
                    withAnimation {
                        self.pageLimit += 3
                    }
                }
            }
        }
        if chatVM.current.message == nil {
            MessageNoReply()
        }

    }
    
    func MessageLabel(_ text: String, theme: ViewTheme) -> some View {
        Text(text)
            .multilineTextAlignment(.center)
            .withTheme(theme)
            .offset(x: 2, y: 3.5)
            .padding([.top, .bottom], 8)
            .padding([.trailing, .leading], 25)
    }
    
    func MessageNoReply(_ text: String = "N/A") -> some View {
        MessageLabel(text, theme: themeVM.terminal.hli.select.noMessageButton)
            .padding([.leading, .trailing], 25)
            .background(rounded)
    }
    
    func MessageButton(_ text: String) -> some View {
        MessageLabel(text, theme: themeVM.terminal.hli.select.messageButton)
            .background(rounded)
            .onTapGesture {
                uiVM.isHelp = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    graphVM.traverse(ctx: GraphContext(input: text))
                }
            }
    }
    
    func ReloadButton(_ text: String = "...") -> some View {
        MessageLabel(text, theme: themeVM.terminal.hli.select.messageButton)
            .background(rounded)
            .onTapGesture {
                if chatVM.current.replies.count > pageLimit {
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

struct ReloadButton2: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @State var animated = false
    @State var disabled = false
    
    var action: () -> Void
    
    init(perform action: @escaping () -> Void = {}) {
        self.action = action
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ReloadButtonDot(animated: animated, delay: 0)
            ReloadButtonDot(animated: animated, delay: 0.1)
            ReloadButtonDot(animated: animated, delay: 0.2)
        }
        .offset(x: 2, y: 3.5)
        .padding([.top, .bottom], 8)
        .padding([.trailing, .leading], 25)
        .background(rounded)
        .disabled(self.disabled)
        .onTapGesture {
            if !disabled {
                print("CLICKED")
                self.animated = true
                self.disabled = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.disabled = false
                    self.animated = false
                    action()
                }
            }
        }
    }
    
    var rounded: some View {
        RoundedRectangle(cornerRadius: 35).fill(themeVM.terminal.help.history.al.background ?? Color.clear)
    }
    
    struct ReloadButton2_Previews: PreviewProvider {
        static var previews: some View {
            ReloadButton2()
                .withEnvironment()
        }
    }
}

struct ReloadButtonDot: View {
    @EnvironmentObject var themeVM: ThemeViewModel
    @State var offset: Offset = (0, 0)
    
    let animated: Bool
    let delay: Double
    
    var body: some View {
        Text(".")
            .offset(x: self.offset.x, y: self.offset.y)
            .onChange(of: animated) { animated in
                if animated {
                    withAnimation(Animation.spring(response: 0.3).speed(4).repeatForever().delay(self.delay)) {
                        self.offset = (0, -20)
                    }
                } else {
                    withAnimation(Animation.linear) {
                        self.offset = (0, 0)
                    }
                }

            }
            .withTheme(themeVM.terminal.hli.select.messageButton)
    }
}
