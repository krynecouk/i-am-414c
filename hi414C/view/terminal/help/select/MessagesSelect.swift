//
//  MessagesSelect.swift
//  hi414C
//
//  Created by Darius Kryszczuk on 20.05.2021.
//

import SwiftUI

struct MessagesSelect: View {
    @EnvironmentObject var uiVM: UIViewModel
    @EnvironmentObject var themeVM: ThemeViewModel
    @EnvironmentObject var graphVM: GraphViewModel
    @EnvironmentObject var historyVM: HistoryViewModel
    
    var body: some View {
        ForEach(historyVM.answers.map { Item($0) }) { item in
            MessageButton(item.content)
        }
        ReloadButton()
    }
    
    func MessageLabel(_ text: String) -> some View {
        Text(text)
            .withTheme(ViewTheme(
                font: FontProps(.proggyTiny, 32),
                color: .white
            ))
            .offset(x: 4, y: 5)
            .padding([.top, .bottom], 8)
            .padding([.trailing, .leading], 25)
            .background(rounded)
    }
    
    func MessageButton(_ text: String) -> some View {
        MessageLabel(text)
            .onTapGesture {
                uiVM.isHelp = false
                graphVM.traverse(ctx: GraphContext(input: text))
            }
    }
    
    func ReloadButton(_ text: String = "...") -> some View {
        MessageLabel(text)
            .onTapGesture {
                // TODO
            }
    }
    
    var rounded: some View {
        RoundedRectangle(cornerRadius: 35).fill(themeVM.terminal.help.history.al.background ?? Color.clear)
    }
}

struct MessagesSelect_Previews: PreviewProvider {
    static var previews: some View {
        MessagesSelect()
    }
}
